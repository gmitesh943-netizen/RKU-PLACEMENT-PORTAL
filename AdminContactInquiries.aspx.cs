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
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridContact();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void GridContact()
        {
            getcon();
            da = new SqlDataAdapter("select * from contact", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from contact where id=" + e.CommandArgument, con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridContact();
            }
        }
    }
}
