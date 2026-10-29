using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class CompanyApplicants : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        CompanyApplicantsClass compClass = new CompanyApplicantsClass();

        string compName;
        string compUsername;
        string compEmail;
        string compUser;
        string compCond;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }


        //session Company / Recruiter only view my comany 
        string getCompanyUser()
        {
            if (Session["company"] != null)
            {
                return Session["company"].ToString();
            }
            return "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["company"] != null)
            {
                startcon();
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
                    ViewState["page"] = 0;
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

        void startcon()
        {
            compClass = new CompanyApplicantsClass();
            compClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            compClass = new CompanyApplicantsClass();
            DataTable dt = compClass.select_applicants(getCompanyUser()).Tables[0];

            lblApplicantCount.Text = dt.Rows.Count.ToString();

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            GridView1.DataSource = compClass.certificate_pagination(dt, page);
            GridView1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            lblApplicantCount.Text = (dt != null ? dt.Rows.Count.ToString() : "0");

            ViewState["page"] = 0;

            GridView1.DataSource = compClass.certificate_pagination(dt, 0);
            GridView1.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPages.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = false;
            btnNext.Enabled = dt != null && dt.Rows.Count > 6;
        }

        // Previous Button
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 1;
            fillgrid();
        }

        // Next Button
        protected void btnNext_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 1;
            fillgrid();
        }

        // SearchButton 
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

        // ResetButton
        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            txtSearch.Text = "";
            ddlDriveFilter.SelectedIndex = 0;
            ddlStatusFilter.SelectedIndex = 0;
            fillgrid();
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlRowStatus");
                string status = DataBinder.Eval(e.Row.DataItem, "ApplicationStatus").ToString();

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
                int index = Convert.ToInt32(e.CommandArgument);
                int appId = Convert.ToInt32(GridView1.DataKeys[index].Value);

                GridViewRow row = GridView1.Rows[index];
                DropDownList ddl = (DropDownList)row.FindControl("ddlRowStatus");
                string status = ddl.SelectedValue;

                compClass = new CompanyApplicantsClass();
                compClass.update_status(appId, status);

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
            compClass = new CompanyApplicantsClass();
            compClass.schedule_interview(Convert.ToInt32(hfModalAppId.Value), txtModalInterviewDate.Text, txtModalVenue.Text, txtModalRemarks.Text);
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
