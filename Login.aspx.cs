using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string role = hfSelectedRole.Value;

            if (!(string.IsNullOrEmpty(txtemail.Text)) && !(string.IsNullOrEmpty(txtpassword.Text)))
            {
                if (role == "admin")
                {
                    if (txtemail.Text == "admin@placement.com" && txtpassword.Text == "admin123")
                    {
                        Session["admin"] = txtemail.Text;
                        Session["role"] = "admin";
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Admin Email or Password";
                    }
                }
                else if (role == "student")
                {
                    getcon();
                    cmd = new SqlCommand("select id from register_auth where regEmail='" + txtemail.Text + "' and regPassword='" + txtpassword.Text + "' and regRole='Student'", con);
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        Session["student"] = txtemail.Text;
                        Session["role"] = "student";
                        Session["UserID"] = result.ToString();
                        Response.Redirect("StudentDashboard.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Student Email or Password";
                    }
                }
                else if (role == "company")
                {
                    getcon();
                    cmd = new SqlCommand("select id from register_auth_company where compEmail='" + txtemail.Text + "' and compPassword='" + txtpassword.Text + "' and regRole='Company'", con);
                    object compResult = cmd.ExecuteScalar();

                    if (compResult != null)
                    {
                        Session["company"] = txtemail.Text;
                        Session["role"] = "company";
                        Session["UserID"] = compResult.ToString();
                        Response.Redirect("CompanyOverview.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Company Email or Password";
                    }
                }
                else
                {
                    lblMsg.Text = "Please Select Role";
                }
            }
            else
            {
                lblMsg.Text = "Please Enter Email and Password";
            }
        }
    }
}