using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class verifyotp : System.Web.UI.Page
    {
   
   
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ResetEmail"] == null || Session["ResetOtp"] == null)
            {
                Response.Redirect("ForgotPassword.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblOtpError.Text = "";
                litMaskedEmail.Text = Session["ResetEmail"].ToString();
                litDemoOtp.Text = Session["ResetOtp"].ToString();
            }
        }

        protected void fpVerifyOtpBtn_Click(object sender, EventArgs e)
        {
            string otp = otp0.Text + otp1.Text + otp2.Text + otp3.Text + otp4.Text + otp5.Text;

            if (otp.Length != 6)
            {
                lblOtpError.Text = "Enter all 6 digits.";
            }
            else if (otp == Session["ResetOtp"].ToString())
            {
                Session["OtpVerified"] = true;
                Response.Redirect("ResetPassword.aspx");
            }
            else
            {
                lblOtpError.Text = "Invalid OTP.";
            }
        }

        protected void fpVerifyOtpBtn_Click(object sender, ImageClickEventArgs e)
        {
            fpVerifyOtpBtn_Click(sender, (EventArgs)e);
        }

        protected void btnResendOtp_Click(object sender, EventArgs e)
        {
            string otp = new Random().Next(100000, 1000000).ToString();
            Session["ResetOtp"] = otp;
            litDemoOtp.Text = otp;
            lblOtpError.Text = "New OTP sent: " + otp;
        }
    }
}
