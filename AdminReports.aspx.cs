using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.IO;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminReports : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        AdminReportsClass reportClass;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadKPIs();
                fillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadKPIs()
        {
            getcon();

            // Total Students
            da = new SqlDataAdapter("select count(*) from register_auth where regRole='student'", con);
            ds = new DataSet();
            da.Fill(ds);
            int students = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            // Total Placed
            da = new SqlDataAdapter("select count(*) from Company_Applications where (ApplicationStatus='Selected' or ApplicationStatus='Offer Accepted' or ApplicationStatus='Placed')", con);
            ds = new DataSet();
            da.Fill(ds);
            int placed = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            // Total Drives
            da = new SqlDataAdapter("select count(*) from Company_Drives", con);
            ds = new DataSet();
            da.Fill(ds);
            int drives = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            lblRptStudents.Text = students.ToString();
            lblRptPlaced.Text = placed.ToString();
            lblRptDrives.Text = drives.ToString();

            // Placement Rate 
            if (students > 0)
            {
                double rate = ((double)placed / students) * 100.0;
                lblRptRate.Text = rate.ToString("0.0") + "%";
            }
            else
            {
                lblRptRate.Text = "0%";
            }
        }

        void filtergrid(DataTable dt)
        {
            gvReportRoster.DataSource = dt;
            gvReportRoster.DataBind();
        }

        void fillgrid()
        {
            reportClass = new AdminReportsClass();
            filtergrid(reportClass.select_all_reports().Tables[0]);
        }

        void LoadRosterGrid()
        {
            fillgrid();
        }

        protected void ReportFilter_Changed(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filtergrid(reportClass.filter_reports(txtReportSearch.Text, ddlReportStatus.SelectedValue).Tables[0]);
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filtergrid(reportClass.filter_reports(txtReportSearch.Text, ddlReportStatus.SelectedValue).Tables[0]);
        }

        protected void btnFilterReset_Click(object sender, EventArgs e)
        {
            ddlReportStatus.SelectedValue = "All";
            txtReportSearch.Text = "";
            fillgrid();
        }

        protected void btnExportCsv_Click(object sender, EventArgs e)
        {
            getcon();
            string qry = "select ca.StudentRollNo, ca.StudentName, ca.StudentBranch, ca.StudentCgpa, ca.JobRole, ISNULL(rac.compName, ca.CompanyUsername) as Company, ca.ApplicationStatus, ca.AppliedDate from Company_Applications ca LEFT JOIN register_auth_company rac ON ca.CompanyUsername = rac.compUsername order by ca.Id desc";
            da = new SqlDataAdapter(qry, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Roll No,Student Name,Branch,CGPA,Job Role,Company,Status,Applied Date");

            foreach (DataRow row in dt.Rows)
            {
                sb.AppendLine(string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\",\"{6}\",\"{7:yyyy-MM-dd}\"",
                    row["StudentRollNo"],
                    row["StudentName"],
                    row["StudentBranch"],
                    row["StudentCgpa"],
                    row["JobRole"],
                    row["Company"],
                    row["ApplicationStatus"],
                    row["AppliedDate"]));
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=RKU_Placement_Roster_" + DateTime.Now.ToString("yyyyMMdd") + ".csv");
            Response.Charset = "";
            Response.ContentType = "text/csv";
            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for controls rendered to string or exports
        }
    }
}
