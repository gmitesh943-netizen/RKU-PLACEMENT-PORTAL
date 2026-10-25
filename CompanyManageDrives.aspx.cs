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
    public partial class CompanyManageDrives : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            cmpDriveRole.Text = "";
            cmpDrivePackage.Text = "";
            cmpDriveMinCgpa.Text = "";
            cmpDriveVacancies.Text = "";
            cmpDriveDate.Text = "";
            cmpDriveStatus.SelectedIndex = 0;
            cmpDriveLocation.Text = "";
            cmpDriveDescription.Text = "";
            cmpBtnSubmitDrive.Text = "Publish Drive";
        }
        void fillGrid()
        {
            getcon();

            if (Session["company"] != null)
            {
                da = new SqlDataAdapter("select * from Company_Drives where CompanyUsername='" + Session["company"] + "'", con);
            }
            else
            {
                da = new SqlDataAdapter("select * from Company_Drives", con);
            }

            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                drivesCountBadge.InnerText = ds.Tables[0].Rows.Count.ToString();
                drivesSubtitle.InnerText = ds.Tables[0].Rows.Count + " total drives";
            }
            else
            {
                drivesCountBadge.InnerText = "0";
                drivesSubtitle.InnerText = "0 total drives";
            }
        }
        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from Company_Drives where Id='" + ViewState["driveid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                cmpDriveRole.Text = ds.Tables[0].Rows[0]["JobRole"].ToString();
                cmpDrivePackage.Text = ds.Tables[0].Rows[0]["PackageOffered"].ToString();
                cmpDriveMinCgpa.Text = ds.Tables[0].Rows[0]["MinCgpa"].ToString();
                cmpDriveVacancies.Text = ds.Tables[0].Rows[0]["TotalVacancies"].ToString();
                cmpDriveDate.Text = ds.Tables[0].Rows[0]["DriveDate"].ToString();
                if (cmpDriveStatus.Items.FindByValue(ds.Tables[0].Rows[0]["DriveStatus"].ToString()) != null)
                {
                    cmpDriveStatus.SelectedValue = ds.Tables[0].Rows[0]["DriveStatus"].ToString();
                }
                cmpDriveLocation.Text = ds.Tables[0].Rows[0]["VenueLocation"].ToString();
                cmpDriveDescription.Text = ds.Tables[0].Rows[0]["JobDescription"].ToString();
            }
        }

        protected void cmpBtnSubmitDrive_Click(object sender, EventArgs e)
        {
            getcon();
            string compUser = (Session["company"] != null) ? Session["company"].ToString() : "";

            if (cmpBtnSubmitDrive.Text == "Publish Drive")
            {
                cmd = new SqlCommand("insert into Company_Drives(JobRole,PackageOffered,MinCgpa,TotalVacancies,DriveDate,DriveStatus,VenueLocation,JobDescription,CompanyUsername) values('" + cmpDriveRole.Text + "','" + cmpDrivePackage.Text + "','" + cmpDriveMinCgpa.Text + "','" + cmpDriveVacancies.Text + "','" + cmpDriveDate.Text + "','" + cmpDriveStatus.SelectedValue + "','" + cmpDriveLocation.Text + "','" + cmpDriveDescription.Text + "','" + compUser + "')", con);
                cmd.ExecuteNonQuery();
                clear();
                fillGrid();
            }
            else
            {
                cmd = new SqlCommand("update Company_Drives set JobRole='" + cmpDriveRole.Text + "',PackageOffered='" + cmpDrivePackage.Text + "',MinCgpa='" + cmpDriveMinCgpa.Text + "',TotalVacancies='" + cmpDriveVacancies.Text + "',DriveDate='" + cmpDriveDate.Text + "',DriveStatus='" + cmpDriveStatus.SelectedValue + "',VenueLocation='" + cmpDriveLocation.Text + "',JobDescription='" + cmpDriveDescription.Text + "' where Id='" + ViewState["driveid"] + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
                clear();
                cmpBtnSubmitDrive.Text = "Publish Drive";
            }
        }
        protected void cmpBtnResetDrive_Click(object sender, EventArgs e)
        {
            clear();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                string id = e.CommandArgument.ToString();
                ViewState["driveid"] = id;
                cmpBtnSubmitDrive.Text = "Update Drive";
                filldata();
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from Company_Drives where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }
    }
}
