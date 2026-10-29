using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s =ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Text = "";
            }
        }

        void student_check()
        {
            da = new SqlDataAdapter("SELECT id, regEmail, regFullname FROM register_auth WHERE regEmail = '" + fpEmail.Text + "' OR regRollNo = '" + fpEmail.Text + "' OR regUsername = '" + fpEmail.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GenerateAndSendOtp(ds.Tables[0].Rows[0]["regEmail"].ToString(), "student", ds.Tables[0].Rows[0]["regFullname"].ToString());
            }
        }

        void company_check()
        {
            da = new SqlDataAdapter("SELECT compEmail, compName FROM register_auth_company WHERE compEmail = '" + fpEmail.Text + "' OR compUsername = '" + fpEmail.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GenerateAndSendOtp(ds.Tables[0].Rows[0]["compEmail"].ToString(), "company", ds.Tables[0].Rows[0]["compName"].ToString());
            }
        }

        void admin_check()
        {
            if (fpEmail.Text == "admin@placement.com")
            {
                GenerateAndSendOtp("admin@placement.com", "admin", "Admin");
            }
        }

        protected void fpSendOtpBtn_Click(object sender, EventArgs e)
        {
            if (fpEmail.Text == "")
            {
                lblMsg.Text = "Please enter email or enrollment number.";
                return;
            }

            getcon();

            student_check();
            company_check();
            admin_check();

            lblMsg.Text = "Account not found.";
        }

        protected void fpSendOtpBtn_Click(object sender, ImageClickEventArgs e)
        {
            fpSendOtpBtn_Click(sender, (EventArgs)e);
        }

        private void GenerateAndSendOtp(string email, string role, string name)
        {
            string otp = new Random().Next(100000, 1000000).ToString();

            Session["ResetEmail"] = email;
            Session["ResetRole"] = role;
            Session["ResetName"] = name;
            Session["ResetOtp"] = otp;
            Session["ResetOtpTime"] = DateTime.Now;

            Response.Redirect("verifyotp.aspx");
        }
    }
}
