using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class CompanyApplicants : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        CompanyApplicantsClass compClass;

        string compName;
        string compUsername;
        string compEmail;
        string compUser;
        string compCond;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        string getCompanyUser()
        {
            if (ViewState["compEmail"] != null && !string.IsNullOrEmpty(ViewState["compEmail"].ToString()))
            {
                return ViewState["compEmail"].ToString();
            }
            if (ViewState["compUsername"] != null && !string.IsNullOrEmpty(ViewState["compUsername"].ToString()))
            {
                return ViewState["compUsername"].ToString();
            }
            return Session["company"] != null ? Session["company"].ToString() : "";
        }

        void filtergrid(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (dt != null && dt.Rows.Count > 0)
            {
                lblApplicantCount.Text = dt.Rows.Count.ToString();
            }
            else
            {
                lblApplicantCount.Text = "0";
            }
        }

        void fillgrid()
        {
            compClass = new CompanyApplicantsClass();
            filtergrid(compClass.select_all_applicants(getCompanyUser()).Tables[0]);
        }

        void loadDrives()
        {
            getcon();
            compUser = getCompanyUser();
            compCond = "(CompanyUsername='" + compUser + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or CompanyUsername in (select compEmail from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "'))";
            da = new SqlDataAdapter("select Id, JobRole, PackageOffered from Company_Drives where " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);

            ddlDriveFilter.Items.Clear();
            ddlDriveFilter.Items.Add(new ListItem("All Posted Drives (" + ds.Tables[0].Rows.Count + ")", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string text = ds.Tables[0].Rows[i]["JobRole"].ToString() + " (" + ds.Tables[0].Rows[i]["PackageOffered"].ToString() + ")";

                //Add the job drive to the DropDownList with its ID as the value
                ddlDriveFilter.Items.Add(new ListItem(text, ds.Tables[0].Rows[i]["Id"].ToString()));
            }
        }

        void fillStats()
        {
            getcon();
            string compUser = getCompanyUser();
            string compCond = "(CompanyUsername='" + compUser + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or CompanyUsername in (select compEmail from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or DriveId in (select Id from Company_Drives where CompanyUsername='" + compUser + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or CompanyUsername in (select compEmail from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "')))";

            // Total Applications
            da = new SqlDataAdapter("select count(*) from Company_Applications where " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);
            statTotalApplicants.InnerText = ds.Tables[0].Rows[0][0].ToString();

            // Shortlisted
            da = new SqlDataAdapter("select count(*) from Company_Applications where " + compCond + " and ApplicationStatus='Shortlisted'", con);
            ds = new DataSet();
            da.Fill(ds);
            statShortlisted.InnerText = ds.Tables[0].Rows[0][0].ToString();

            // Selected / Placed
            da = new SqlDataAdapter("select count(*) from Company_Applications where " + compCond + " and (ApplicationStatus='Selected' or ApplicationStatus='Offer Accepted')", con);
            ds = new DataSet();
            da.Fill(ds);
            statSelected.InnerText = ds.Tables[0].Rows[0][0].ToString();

            // Pending Review
            da = new SqlDataAdapter("select count(*) from Company_Applications where " + compCond + " and (ApplicationStatus='Pending' or ApplicationStatus='Under Review' or ApplicationStatus is null or ApplicationStatus='')", con);
            ds = new DataSet();
            da.Fill(ds);
            statPending.InnerText = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["company"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from register_auth_company where compEmail='" + Session["company"] + "' or compUsername='" + Session["company"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    compName = ds.Tables[0].Rows[0]["compName"].ToString();
                    compUsername = ds.Tables[0].Rows[0]["compUsername"].ToString();
                    compEmail = ds.Tables[0].Rows[0]["compEmail"].ToString();

                    ViewState["compName"] = compName;
                    ViewState["compUsername"] = compUsername;
                    ViewState["compEmail"] = compEmail;
                }
                else
                {
                    ViewState["compUsername"] = Session["company"].ToString();
                    ViewState["compEmail"] = Session["company"].ToString();
                }

                if (!IsPostBack)
                {
                    loadDrives();
                    fillgrid();
                    fillStats();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        //<----------- Search/Filter --------------->

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            compClass = new CompanyApplicantsClass();
            filtergrid(compClass.search_applicants(txtSearch.Text, getCompanyUser()).Tables[0]);
        }

        // Driver filter
        protected void ddlDriveFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            compClass = new CompanyApplicantsClass();
            filtergrid(compClass.select_applicants_by_drive(ddlDriveFilter.SelectedValue, getCompanyUser()).Tables[0]);
        }

        // Status filter
        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            compClass = new CompanyApplicantsClass();
            filtergrid(compClass.select_applicants_by_status(ddlStatusFilter.SelectedValue, getCompanyUser()).Tables[0]);
        }

        // Clear button
        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlDriveFilter.SelectedIndex = 0;
            ddlStatusFilter.SelectedIndex = 0;
            fillgrid();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlRowStatus");

                //read and extract column values GridView row at runtime without needing  type-casting.
                string status = DataBinder.Eval(e.Row.DataItem, "ApplicationStatus").ToString();

                //DropDownList all ListItem  check kare valyu valo  option che e check kare 
                if (ddl != null && ddl.Items.FindByValue(status) != null)
                {
                    ddl.SelectedValue = status;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                getcon();
                int index = Convert.ToInt32(e.CommandArgument);
                int appId = Convert.ToInt32(GridView1.DataKeys[index].Value);

                GridViewRow row = GridView1.Rows[index];
                DropDownList ddl = (DropDownList)row.FindControl("ddlRowStatus");
                string status = ddl.SelectedValue;

                cmd = new SqlCommand("update Company_Applications set ApplicationStatus='" + status + "' where Id='" + appId + "'", con);
                cmd.ExecuteNonQuery();

                fillgrid();
                fillStats();
            }
            else if (e.CommandName == "ScheduleInterview")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int appId = Convert.ToInt32(GridView1.DataKeys[index].Value);
                hfModalAppId.Value = appId.ToString();

                getcon();
                da = new SqlDataAdapter("select * from Company_Applications where Id='" + appId + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblModalStudentName.Text = ds.Tables[0].Rows[0]["StudentName"].ToString();
                    lblModalJobRole.Text = ds.Tables[0].Rows[0]["JobRole"].ToString();
                    txtModalInterviewDate.Text = ds.Tables[0].Rows[0]["InterviewDate"].ToString();
                    txtModalVenue.Text = ds.Tables[0].Rows[0]["InterviewVenue"].ToString();
                    txtModalRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                    pnlScheduleModal.Visible = true;
                }
            }
        }

        protected void btnSaveSchedule_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("update Company_Applications set ApplicationStatus='Shortlisted', InterviewDate='" + txtModalInterviewDate.Text + "', InterviewVenue='" + txtModalVenue.Text + "', Remarks='" + txtModalRemarks.Text + "' where Id='" + hfModalAppId.Value + "'", con);
            cmd.ExecuteNonQuery();
            pnlScheduleModal.Visible = false;
            fillgrid();
            fillStats();
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlScheduleModal.Visible = false;
        }
    }
}
