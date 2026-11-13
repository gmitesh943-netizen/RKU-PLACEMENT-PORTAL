using System;
using System.Configuration;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void clearContact()
        {
            contactFullName.Text = "";
            contactEmailAddr.Text = "";
            contactMobile.Text = "";
            contactDepartment.SelectedIndex = 0;
            contactSubject.Text = "";
            contactMessage.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("insert into contact (Name,Email,Mobile,Department,Subject,Message) values('" + contactFullName.Text + "','" + contactEmailAddr.Text + "','" + contactMobile.Text + "','" + contactDepartment.SelectedValue + "','" + contactSubject.Text + "','" + contactMessage.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();

            clearContact();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thank you! Your inquiry has been sent successfully to the Placement Cell.');", true);
        }

        protected void btnResetForm_Click(object sender, EventArgs e)
        {
            clearContact();
        }
    }
}
