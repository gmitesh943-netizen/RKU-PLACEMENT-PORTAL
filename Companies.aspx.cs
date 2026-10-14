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
    public partial class Companies : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company order by id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            filterData();
        }

        protected void ddlIndustry_SelectedIndexChanged(object sender, EventArgs e)
        {
            filterData();
        }

        void filterData()
        {
            getcon();

            if (txtSearch.Text != "" && ddlIndustry.SelectedValue != "")
            {
                da = new SqlDataAdapter("select * from register_auth_company where (compName like '%" + txtSearch.Text + "%' or compDescription like '%" + txtSearch.Text + "%' or compTags like '%" + txtSearch.Text + "%') and compIndustry like '%" + ddlIndustry.SelectedValue + "%' order by id desc", con);
            }
            else if (txtSearch.Text != "")
            {
                da = new SqlDataAdapter("select * from register_auth_company where compName like '%" + txtSearch.Text + "%' or compDescription like '%" + txtSearch.Text + "%' or compTags like '%" + txtSearch.Text + "%' or compIndustry like '%" + txtSearch.Text + "%' order by id desc", con);
            }
            else if (ddlIndustry.SelectedValue != "")
            {
                da = new SqlDataAdapter("select * from register_auth_company where compIndustry like '%" + ddlIndustry.SelectedValue + "%' order by id desc", con);
            }
            else
            {
                da = new SqlDataAdapter("select * from register_auth_company order by id desc", con);
            }

            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}