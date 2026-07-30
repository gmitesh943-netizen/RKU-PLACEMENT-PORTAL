using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Label1.Text = "Full Name: " + regFullName.Text + "\n" +
                "Email ID: " + regEmail.Text + "\n" +
                "Enrollment No:" +regRollNo.Text + "\n" +
                "Password: " + regPassword.Text + "\n" +
                "Confirm Password: " + regConfirmPassword.Text;
        }
    }
}