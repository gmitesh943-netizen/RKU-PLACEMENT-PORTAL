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
    public partial class AdminStudentDirectory : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

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
                getcon();
                GridStudent();
                GridCompany();
            }
        }
        void GridStudent()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (lblStudentCount != null)
            {
                lblStudentCount.Text = ds.Tables[0].Rows.Count.ToString();
            }
        }

        void GridCompany()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();

            if (lblCompanyCount != null)
            {
                lblCompanyCount.Text = ds.Tables[0].Rows.Count.ToString();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from register_auth where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                GridStudent();
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cdel")
            {
                getcon();
                cmd = new SqlCommand("delete from register_auth_company where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                GridCompany();
            }
        }
    }
}