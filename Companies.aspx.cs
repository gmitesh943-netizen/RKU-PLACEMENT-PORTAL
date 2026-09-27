using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Companies : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datalist();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void datalist()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company", con);
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
            string query = "select * from register_auth_company where 1=1";
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                string kw = txtSearch.Text.Trim().Replace("'", "''");
                query += " and (compName like '%" + kw + "%' or compDescription like '%" + kw + "%' or compTags like '%" + kw + "%' or compIndustry like '%" + kw + "%')";
            }
            if (!string.IsNullOrEmpty(ddlIndustry.SelectedValue))
            {
                string ind = ddlIndustry.SelectedValue.Replace("'", "''");
                query += " and compIndustry like '%" + ind + "%'";
            }
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}