using System;
using System.Data;
using System.Runtime.InteropServices;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminContactInquiries : System.Web.UI.Page
    {
        AdminContactInquiriesClass inquiryClass = new AdminContactInquiriesClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                ViewState["page"] = 0;
                fillgrid();
            }
        }

        void startcon()
        {
            inquiryClass = new AdminContactInquiriesClass();
            inquiryClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            inquiryClass = new AdminContactInquiriesClass();
            DataTable dt = inquiryClass.select_inquiries().Tables[0];

            lblInquiryCount.Text = dt.Rows.Count.ToString();

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            GridView1.DataSource = inquiryClass.certificate_pagination(dt, page);
            GridView1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            lblInquiryCount.Text = dt.Rows.Count.ToString();

            ViewState["page"] = 0;

            GridView1.DataSource = inquiryClass.certificate_pagination(dt, 0);
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
            inquiryClass = new AdminContactInquiriesClass();
            filtergrid(inquiryClass.search_inquiries(inquirySearchInput.Text).Tables[0]);
        }

        // Department
        protected void inquiryDeptFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            inquiryClass = new AdminContactInquiriesClass();
            filtergrid(inquiryClass.select_inquiries_by_dept(inquiryDeptFilter.SelectedValue).Tables[0]);
        }

        // ResetButton
        protected void btnReset_Click(object sender, EventArgs e)
        {
            inquirySearchInput.Text = "";
            inquiryDeptFilter.SelectedIndex = 0;
            ViewState["page"] = 0;
            fillgrid();
        }

        // delate Inq
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                inquiryClass = new AdminContactInquiriesClass();
                inquiryClass.delete_inquiry(Convert.ToInt32(e.CommandArgument));
                fillgrid();
            }
        }
    }
}
