using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;    
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Contact : System.Web.UI.Page
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

            clearContact();
           
        }

        protected void btnResetForm_Click(object sender, EventArgs e)
        {
            clearContact();
        }
    }
}