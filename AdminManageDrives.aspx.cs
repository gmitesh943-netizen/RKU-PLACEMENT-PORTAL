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
    public partial class AdminManageDrives : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int openCount = 0;
        int closedCount = 0;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                datalist();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void datalist()
        {
            getcon();
            da = new SqlDataAdapter("select * from Company_Drives", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                
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
                driveCountLabel.Text = ds.Tables[0].Rows.Count + " Drives";
            }
            else
            {
                statOpenCount.Text = "0";
                statClosedCount.Text = "0";
                driveCountLabel.Text = "0 Drives";
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from Company_Drives where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                datalist();
            }
        }
    }
}
