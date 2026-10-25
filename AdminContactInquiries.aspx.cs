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
    public partial class AdminContactInquiries : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        AdminContactInquiriesClass inquiryClass;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridContact();
            }
        }

        void filtergrid(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (lblInquiryCount != null)
            {
                lblInquiryCount.Text = (dt != null ? dt.Rows.Count : 0).ToString();
            }
        }

        void GridContact()
        {
            inquiryClass = new AdminContactInquiriesClass();
            filtergrid(inquiryClass.select_all_inquiries().Tables[0]);
        }

        //<----------- Search/Filter --------------->

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            inquiryClass = new AdminContactInquiriesClass();
            filtergrid(inquiryClass.filter_inquiries(inquirySearchInput.Text, inquiryDeptFilter.SelectedValue).Tables[0]);
        }

        protected void inquiryDeptFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            inquiryClass = new AdminContactInquiriesClass();
            filtergrid(inquiryClass.filter_inquiries(inquirySearchInput.Text, inquiryDeptFilter.SelectedValue).Tables[0]);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            inquirySearchInput.Text = "";
            inquiryDeptFilter.SelectedIndex = 0;
            GridContact();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from contact where id=" + e.CommandArgument, con);
                cmd.ExecuteNonQuery();
                GridContact();
            }
        }
    }
}
