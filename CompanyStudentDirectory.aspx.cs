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
    public partial class CompanyStudentDirectory : System.Web.UI.Page
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
                GridStudent();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void GridStudent()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                string name = drv["regFullName"] != DBNull.Value ? drv["regFullName"].ToString() : "";
                string roll = drv["regRollNo"] != DBNull.Value ? drv["regRollNo"].ToString() : "";
                string email = drv["regEmail"] != DBNull.Value ? drv["regEmail"].ToString() : "";
                string username = drv["regUsername"] != DBNull.Value ? drv["regUsername"].ToString() : "";

                e.Row.CssClass = "student-row";
                e.Row.Attributes["data-search"] = (name + " " + roll + " " + email + " " + username).ToLower();
                e.Row.Attributes["data-branch"] = GetBranch(username);
            }
        }

        public string GetBranch(object usernameObj)
        {
            return "MCA (IT)";
        }

        public string GetCgpa(object usernameObj)
        {
            return "10.00";
        }

        public string GetBacklogs(object usernameObj)
        {
            return "0";
        }

        public string GetSkillsBadgeHtml(object usernameObj)
        {
            return "<span class=\"badge bg-light text-dark border me-1 my-1\" style=\"font-size:0.7rem;\">java html css javascript</span>";
        }
    }
}