using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminTrackApplications : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        AdminTrackApplicationsClass appClass;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCompanies();
                fillgrid();
                fillStats();
            }
        }

        void filtergrid(DataTable dt)
        {
            gvMasterApplications.DataSource = dt;
            gvMasterApplications.DataBind();

            if (dt != null && dt.Rows.Count > 0)
            {
                lblRecordsCount.Text = dt.Rows.Count + " Applications";
            }
            else
            {
                lblRecordsCount.Text = "0 Applications";
            }
        }

        // ==================== Grid View fill data ====================
        void fillgrid()
        {
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.select_all_applications().Tables[0]);
        }

        //--------------------- drop down ma company na name mate ----------------
        void loadCompanies()
        {
            getcon();
            da = new SqlDataAdapter("select compUsername, compName from register_auth_company order by compName asc", con);
            ds = new DataSet();
            da.Fill(ds);
            ddlCompanyFilter.DataSource = ds;
            ddlCompanyFilter.DataTextField = "compName";
            ddlCompanyFilter.DataValueField = "compUsername";
            ddlCompanyFilter.DataBind();

            ddlCompanyFilter.Items.Insert(0, new ListItem("All Companies / Recruiters (" + ds.Tables[0].Rows.Count + ")", "All"));
        }

        void fillStats()
        {
            getcon();
            da = new SqlDataAdapter("select * from Company_Applications", con);
            ds = new DataSet();
            da.Fill(ds);

            int total = ds.Tables[0].Rows.Count;
            int shortlisted = 0;
            int interviews = 0;
            int selected = 0;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string st = ds.Tables[0].Rows[i]["ApplicationStatus"].ToString();
                if (st == "Shortlisted")
                {
                    shortlisted++;
                }
                else if (st == "Interview Scheduled")
                {
                    interviews++;
                }
                else if (st == "Selected" || st == "Offer Accepted")
                {
                    selected++;
                }
            }
            lblKpiTotal.Text = total.ToString();
            lblKpiShortlisted.Text = shortlisted.ToString();
            lblKpiInterviews.Text = interviews.ToString();
            lblKpiSelected.Text = selected.ToString();
        }

        //<----------- Search/Filter --------------->

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.filter_applications(txtSearch.Text, ddlCompanyFilter.SelectedValue, ddlStatusFilter.SelectedValue).Tables[0]);
        }

        protected void ddlCompanyFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.filter_applications(txtSearch.Text, ddlCompanyFilter.SelectedValue, ddlStatusFilter.SelectedValue).Tables[0]);
        }

        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.filter_applications(txtSearch.Text, ddlCompanyFilter.SelectedValue, ddlStatusFilter.SelectedValue).Tables[0]);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlCompanyFilter.SelectedIndex = 0;
            ddlStatusFilter.SelectedIndex = 0;
            fillgrid();
        }

        // ==================== remove karva mate stuent  ====================
        protected void gvMasterApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from Company_Applications where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
                fillStats();
            }
        }
    }
}
