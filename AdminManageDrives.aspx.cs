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

        void datalist()
        {
            getcon();
            da = new SqlDataAdapter("select d.*, c.compName, c.compLogo, c.compIndustry from Company_Drives d left join register_auth_company c on (d.CompanyUsername = c.compUsername or d.CompanyUsername = c.compEmail) order by d.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
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
                con.Close();

                datalist();
                updateStats();
            }
        }
    }
}
