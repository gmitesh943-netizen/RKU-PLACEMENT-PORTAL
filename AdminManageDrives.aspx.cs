using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminManageDrives : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        AdminManageDrivesClass driveClass;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datalist();
                updateStats();
            }
        }

        void filterdata(DataTable dt)
        {
            DataList1.DataSource = dt;
            DataList1.DataBind();

            if (dt != null && dt.Rows.Count > 0)
            {
                driveCountLabel.Text = dt.Rows.Count.ToString() + " Drives";
                noDrivesMessage.Visible = false;
            }
            else
            {
                driveCountLabel.Text = "0 Drives";
                noDrivesMessage.Visible = true;
            }
        }

        void datalist()
        {
            driveClass = new AdminManageDrivesClass();
            filterdata(driveClass.select_all_drives().Tables[0]);
        }

        //<----------- Search/Filter --------------->

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            driveClass = new AdminManageDrivesClass();
            filterdata(driveClass.search_drives(txtSearch.Text).Tables[0]);
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            driveClass = new AdminManageDrivesClass();
            filterdata(driveClass.select_drives_by_status(ddlStatus.SelectedValue).Tables[0]);
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlStatus.SelectedIndex = 0;
            datalist();
        }

        void updateStats()
        {
            getcon();
            da = new SqlDataAdapter("select * from Company_Drives", con);
            ds = new DataSet();
            da.Fill(ds);

            int openCount = 0;
            int closedCount = 0;
            int total = ds.Tables[0].Rows.Count;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["DriveStatus"].ToString() == "Open")
                {
                    openCount++;
                }
                else
                {
                    closedCount++;
                }
            }

            statOpenCount.Text = openCount.ToString();
            statClosedCount.Text = closedCount.ToString();
            driveCountLabel.Text = total + " Drives";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from Company_Drives where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                datalist();
                updateStats();
            }
        }
    }
}
