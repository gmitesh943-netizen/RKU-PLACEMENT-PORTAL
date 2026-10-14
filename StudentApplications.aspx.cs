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
    public partial class StudentApplications : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string nm;
        string rollno;
        string email;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select a.*, c.compName, c.compLogo from Company_Applications a left join register_auth_company c on (a.CompanyUsername = c.compUsername or a.CompanyUsername = c.compEmail) where a.StudentRollNo='" + ViewState["rollno"] + "' or a.StudentEmail='" + ViewState["email"] + "' or a.StudentUsername='" + ViewState["email"] + "' order by a.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            //--------------display kare  total number of applications------------
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblApplicationCount.Text = ds.Tables[0].Rows.Count + " Applications";
            }
            else
            {
                lblApplicationCount.Text = "0 Applications";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from register_auth where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["regFullname"].ToString();
                    rollno = ds.Tables[0].Rows[0]["regRollNo"].ToString();
                    email = ds.Tables[0].Rows[0]["regEmail"].ToString();

                    ViewState["nm"] = nm;
                    ViewState["rollno"] = rollno;
                    ViewState["email"] = email;
                    fillgrid();
                }
                else
                {
                    ViewState["rollno"] = Session["student"].ToString();
                    ViewState["email"] = Session["student"].ToString();
                    fillgrid();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}