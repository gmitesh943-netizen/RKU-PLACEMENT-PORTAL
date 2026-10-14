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
    public partial class StudentOfferLetters : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillGrid()
        {
            getcon();
            string sess = Session["student"] != null ? Session["student"].ToString() : "";
            da = new SqlDataAdapter("select ca.*, cd.PackageOffered, cd.DriveDate, rac.compName, rac.compLogo from Company_Applications ca LEFT JOIN Company_Drives cd ON ca.DriveId = cd.Id LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail OR ca.CompanyUsername = rac.compName) where (ca.StudentEmail='" + sess + "' or ca.StudentUsername='" + sess + "' or ca.StudentRollNo='" + sess + "') and (ca.ApplicationStatus='Selected' or ca.ApplicationStatus='Offer Accepted' or ca.ApplicationStatus='Offer Declined') order by ca.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string sessionUser = Session["student"] != null ? Session["student"].ToString() : "";
            if (sessionUser != "")
            {
                if (!IsPostBack)
                {
                    fillGrid();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_accept")
            {
                getcon();
                cmd = new SqlCommand("update Company_Applications set ApplicationStatus='Offer Accepted' where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
            else if (e.CommandName == "cmd_decline")
            {
                getcon();
                cmd = new SqlCommand("update Company_Applications set ApplicationStatus='Offer Declined' where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }
    }
}