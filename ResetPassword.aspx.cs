using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ResetEmail"] == null || Session["OtpVerified"] == null)
            {
                Response.Redirect("ForgotPassword.aspx");
            }

            if (!IsPostBack)
            {
                lblResetMsg.Text = "";
                litTargetEmail.Text = Session["ResetEmail"].ToString();
            }
        }

        protected void fpResetPasswordBtn_Click(object sender, EventArgs e)
        {
            if (fpNewPassword.Text == "")
            {
                lblResetMsg.Text = "Enter new password.";
                lblResetMsg.CssClass = "text-danger fw-bold d-block mb-3 text-center";
                return;
            }

            if (fpNewPassword.Text.Length < 6)
            {
                lblResetMsg.Text = "Password must be at least 6 characters.";
                lblResetMsg.CssClass = "text-danger fw-bold d-block mb-3 text-center";
                return;
            }

            if (fpNewPassword.Text != fpConfirmPassword.Text)
            {
                lblResetMsg.Text = "Passwords do not match.";
                lblResetMsg.CssClass = "text-danger fw-bold d-block mb-3 text-center";
                return;
            }

            string email = Session["ResetEmail"] != null ? Session["ResetEmail"].ToString() : "";
            string role = Session["ResetRole"] != null ? Session["ResetRole"].ToString() : "student";

            getcon();

            if (role == "student")
            {
                cmd = new SqlCommand("UPDATE register_auth SET regPassword='" + fpNewPassword.Text + "', regConfirmPassword='" + fpConfirmPassword.Text + "' WHERE regEmail='" + email + "'", con);
                cmd.ExecuteNonQuery();
            }
            else if (role == "company")
            {
                cmd = new SqlCommand("UPDATE register_auth_company SET compPassword='" + fpNewPassword.Text + "', compConfirmPassword='" + fpConfirmPassword.Text + "' WHERE compEmail='" + email + "'", con);
                cmd.ExecuteNonQuery();
            }

            divResetForm.Visible = false;
            divResetSuccess.Visible = true;

            if (step3Circle != null)
            {
                step3Circle.InnerHtml = "<i class=\"fa-solid fa-check\"></i>";
                step3Circle.Style["background"] = "#10b981";
            }

            Session.Remove("ResetOtp");
            Session.Remove("OtpVerified");
            Session.Remove("ResetEmail");
            Session.Remove("ResetRole");
        }

        protected void fpResetPasswordBtn_Click(object sender, ImageClickEventArgs e)
        {
            fpResetPasswordBtn_Click(sender, (EventArgs)e);
        }
    }
}
