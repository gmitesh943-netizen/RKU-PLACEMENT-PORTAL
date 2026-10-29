using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminManageDrives : System.Web.UI.Page
    {
        AdminManageDrivesClass driveClass = new AdminManageDrivesClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                ViewState["page"] = 0;
                fillgrid();
                updateStats();
            }
        }

        void startcon()
        {
            driveClass = new AdminManageDrivesClass();
            driveClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            driveClass = new AdminManageDrivesClass();
            DataTable dt = driveClass.select_drives().Tables[0];

            driveCountLabel.Text = dt.Rows.Count.ToString() + " Drives";
            noDrivesMessage.Visible = dt.Rows.Count == 0;

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            DataList1.DataSource = driveClass.certificate_pagination(dt, page);
            DataList1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            driveCountLabel.Text = (dt != null ? dt.Rows.Count.ToString() : "0") + " Drives";
            noDrivesMessage.Visible = dt == null || dt.Rows.Count == 0;

            ViewState["page"] = 0;

            DataList1.DataSource = driveClass.certificate_pagination(dt, 0);
            DataList1.DataBind();

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
            driveClass = new AdminManageDrivesClass();
            filtergrid(driveClass.search_drives(txtSearch.Text).Tables[0]);
        }

        // Status
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            driveClass = new AdminManageDrivesClass();
            filtergrid(driveClass.select_drives_by_status(ddlStatus.SelectedValue).Tables[0]);
        }

        // ResetButton
        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            txtSearch.Text = "";
            ddlStatus.SelectedIndex = 0;
            fillgrid();
        }

        void updateStats()
        {
            driveClass = new AdminManageDrivesClass();
            DataTable dt = driveClass.select_drives().Tables[0];

            int openCount = 0;
            int closedCount = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["DriveStatus"].ToString() == "Open")
                {
                    openCount++;
                }
                else
                {
                    closedCount++;
                }
            }

            statOpenCount.Text = openCount.ToString();
            statClosedCount.Text = closedCount.ToString();
        }

        // delate Drive
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                driveClass = new AdminManageDrivesClass();
                driveClass.delete_drive(Convert.ToInt32(e.CommandArgument));
                fillgrid();
                updateStats();
            }
        }
    }
}
