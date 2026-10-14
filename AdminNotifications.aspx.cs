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
    public partial class AdminNotifications : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null && Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                getcon();
                fillGrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtTitle.Text = "";
            txtMessage.Text = "";
            txtLink.Text = "";
            ddlCategory.SelectedIndex = 0;
            ddlPriority.SelectedIndex = 2; // Normal Notice
            ddlAudience.SelectedIndex = 0;
            btnSendBroadcast.Text = "Publish Notice Broadcast";
            lblAlertMsg.Text = "";
            lblAlertMsg.CssClass = "";
        }

        protected void btnSendBroadcast_Click(object sender, EventArgs e)
        {
            if (btnSendBroadcast.Text == "Publish Notice Broadcast")
            {
                getcon();
                cmd = new SqlCommand("insert into TPO_Broadcasts(Title,MessageBody,Category,TargetAudience,Priority,AttachmentLink,CreatedDate,IsActive) values('" + txtTitle.Text.Replace("'", "''") + "','" + txtMessage.Text.Replace("'", "''") + "','" + ddlCategory.SelectedValue + "','" + ddlAudience.SelectedValue + "','" + ddlPriority.SelectedValue + "','" + txtLink.Text.Replace("'", "''") + "', GETDATE(), 1)", con);
                cmd.ExecuteNonQuery();
                clear();
                fillGrid();
                lblAlertMsg.CssClass = "alert alert-success d-block mb-3";
                lblAlertMsg.Text = "Notice broadcast published live successfully!";
            }
            else
            {
                getcon();
                cmd = new SqlCommand("update TPO_Broadcasts set Title='" + txtTitle.Text.Replace("'", "''") + "',MessageBody='" + txtMessage.Text.Replace("'", "''") + "',Category='" + ddlCategory.SelectedValue + "',TargetAudience='" + ddlAudience.SelectedValue + "',Priority='" + ddlPriority.SelectedValue + "',AttachmentLink='" + txtLink.Text.Replace("'", "''") + "' where Id='" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
                clear();
                btnSendBroadcast.Text = "Publish Notice Broadcast";
                lblAlertMsg.CssClass = "alert alert-success d-block mb-3";
                lblAlertMsg.Text = "Notice broadcast updated successfully!";
            }
        }

        void fillGrid()
        {
            getcon();
            string filter = ViewState["Filter"] != null ? ViewState["Filter"].ToString() : "All";
            string qry = "select * from TPO_Broadcasts order by Id desc";

            if (filter == "Urgent")
            {
                qry = "select * from TPO_Broadcasts where Priority='Urgent' or Priority='High' order by Id desc";
            }
            else if (filter == "Campus Drive")
            {
                qry = "select * from TPO_Broadcasts where Category='Campus Drive' order by Id desc";
            }

            da = new SqlDataAdapter(qry, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            // Stats calculation
            SqlDataAdapter daStats = new SqlDataAdapter("select * from TPO_Broadcasts", con);
            DataSet dsStats = new DataSet();
            daStats.Fill(dsStats);

            int total = dsStats.Tables[0].Rows.Count;
            int active = 0;
            int urgent = 0;

            for (int i = 0; i < total; i++)
            {
                if (Convert.ToBoolean(dsStats.Tables[0].Rows[i]["IsActive"])) active++;
                string p = dsStats.Tables[0].Rows[i]["Priority"].ToString();
                if (p == "Urgent" || p == "High") urgent++;
            }

            lblTotalBroadcasts.Text = total.ToString();
            lblActiveBroadcasts.Text = active.ToString();
            lblUrgentAlerts.Text = urgent.ToString();
        }
        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from TPO_Broadcasts where Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                txtMessage.Text = ds.Tables[0].Rows[0]["MessageBody"].ToString();
                ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
                ddlPriority.SelectedValue = ds.Tables[0].Rows[0]["Priority"].ToString();
                ddlAudience.SelectedValue = ds.Tables[0].Rows[0]["TargetAudience"].ToString();
                txtLink.Text = ds.Tables[0].Rows[0]["AttachmentLink"].ToString();
            }
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                string id = e.CommandArgument.ToString();
                ViewState["id"] = id;
                btnSendBroadcast.Text = "Update";
                filldata();
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from TPO_Broadcasts where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
                lblAlertMsg.CssClass = "alert alert-warning d-block mb-3";
                lblAlertMsg.Text = "Broadcast notice deleted successfully.";
            }
        }

        protected void btnResetForm_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void FilterBroadcast_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            ViewState["Filter"] = btn.CommandArgument;
            fillGrid();
        }
    }
}