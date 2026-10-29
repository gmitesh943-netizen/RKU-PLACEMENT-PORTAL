using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminTrackApplications : System.Web.UI.Page
    {
        AdminTrackApplicationsClass appClass = new AdminTrackApplicationsClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                ViewState["page"] = 0;
                loadCompanies();
                fillgrid();
                fillStats();
            }
        }

        void startcon()
        {
            appClass = new AdminTrackApplicationsClass();
            appClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            appClass = new AdminTrackApplicationsClass();
            DataTable dt = appClass.select_applications().Tables[0];

            lblRecordsCount.Text = dt.Rows.Count + " Applications";

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            gvMasterApplications.DataSource = appClass.certificate_pagination(dt, page);
            gvMasterApplications.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            lblRecordsCount.Text = (dt != null ? dt.Rows.Count : 0) + " Applications";

            ViewState["page"] = 0;

            gvMasterApplications.DataSource = appClass.certificate_pagination(dt, 0);
            gvMasterApplications.DataBind();

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
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.search_applications(txtSearch.Text).Tables[0]);
        }

        // Company
        protected void ddlCompanyFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.select_applications_by_company(ddlCompanyFilter.SelectedValue).Tables[0]);
        }

        // Status
        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            appClass = new AdminTrackApplicationsClass();
            filtergrid(appClass.select_applications_by_status(ddlStatusFilter.SelectedValue).Tables[0]);
        }

        // ResetButton
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            txtSearch.Text = "";
            ddlCompanyFilter.SelectedIndex = 0;
            ddlStatusFilter.SelectedIndex = 0;
            fillgrid();
        }

        // delate Application
        protected void gvMasterApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                appClass = new AdminTrackApplicationsClass();
                appClass.delete_application(Convert.ToInt32(e.CommandArgument));
                fillgrid();
                fillStats();
            }
        }

        // load companies dropdown
        void loadCompanies()
        {
            SqlConnection con = appClass.getcon();
            SqlDataAdapter da = new SqlDataAdapter("select compUsername, compName from register_auth_company order by compName asc", con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ddlCompanyFilter.DataSource = ds;
            ddlCompanyFilter.DataTextField = "compName";
            ddlCompanyFilter.DataValueField = "compUsername";
            ddlCompanyFilter.DataBind();

            ddlCompanyFilter.Items.Insert(0, new ListItem("All Companies / Recruiters (" + ds.Tables[0].Rows.Count + ")", "All"));
        }

        void fillStats()
        {
            SqlConnection con = appClass.getcon();
            SqlDataAdapter da = new SqlDataAdapter("select * from Company_Applications", con);
            DataSet ds = new DataSet();
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
    }
}
