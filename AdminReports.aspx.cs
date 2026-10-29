using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminReports : System.Web.UI.Page
    {
        AdminReportsClass reportClass = new AdminReportsClass();
        SqlConnection con;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                ViewState["page"] = 0;
                ViewState["company_page"] = 0;
                ViewState["branch_page"] = 0;
                fillgrid();
                fillCompanyGrid();
                fillBranchGrid();
                LoadKPIs();
            }
        }

        void startcon()
        {
            reportClass = new AdminReportsClass();
            reportClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            reportClass = new AdminReportsClass();
            DataTable dt = reportClass.select_reports().Tables[0];

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            gvReportRoster.DataSource = reportClass.certificate_pagination(dt, page);
            gvReportRoster.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // Company-Wise Recruitment Report Grid
        void fillCompanyGrid()
        {
            reportClass = new AdminReportsClass();
            DataTable dt = reportClass.select_company_reports().Tables[0];

            int page = Convert.ToInt32(ViewState["company_page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["company_page"] = page;
            }

            gvCompanyReport.DataSource = reportClass.certificate_pagination(dt, page);
            gvCompanyReport.DataBind();

            lblPagesCompany.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPreviousCompany.Enabled = page > 0;
            btnNextCompany.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        void filterCompanyGrid(DataTable dt)
        {
            ViewState["company_page"] = 0;

            gvCompanyReport.DataSource = reportClass.certificate_pagination(dt, 0);
            gvCompanyReport.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPagesCompany.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPreviousCompany.Enabled = false;
            btnNextCompany.Enabled = dt != null && dt.Rows.Count > 6;
        }

        protected void btnPreviousCompany_Click(object sender, EventArgs e)
        {
            ViewState["company_page"] = Convert.ToInt32(ViewState["company_page"]) - 1;
            fillCompanyGrid();
        }

        protected void btnNextCompany_Click(object sender, EventArgs e)
        {
            ViewState["company_page"] = Convert.ToInt32(ViewState["company_page"]) + 1;
            fillCompanyGrid();
        }

        protected void btnFilterCompany_Click(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filterCompanyGrid(reportClass.search_company_reports(txtSearchCompany.Text).Tables[0]);
        }

        protected void CompanyStatusFilter_Changed(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filterCompanyGrid(reportClass.select_company_reports_by_status(ddlCompanyStatus.SelectedValue).Tables[0]);
        }

        protected void btnResetCompany_Click(object sender, EventArgs e)
        {
            txtSearchCompany.Text = "";
            ddlCompanyStatus.SelectedIndex = 0;
            ViewState["company_page"] = 0;
            fillCompanyGrid();
        }

        // Branch-Wise Placement Statistics Grid
        void fillBranchGrid()
        {
            reportClass = new AdminReportsClass();
            DataTable dt = reportClass.select_branch_reports().Tables[0];

            int page = Convert.ToInt32(ViewState["branch_page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["branch_page"] = page;
            }

            gvBranchReport.DataSource = reportClass.certificate_pagination(dt, page);
            gvBranchReport.DataBind();

            lblPagesBranch.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPreviousBranch.Enabled = page > 0;
            btnNextBranch.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        void filterBranchGrid(DataTable dt)
        {
            ViewState["branch_page"] = 0;

            gvBranchReport.DataSource = reportClass.certificate_pagination(dt, 0);
            gvBranchReport.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPagesBranch.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPreviousBranch.Enabled = false;
            btnNextBranch.Enabled = dt != null && dt.Rows.Count > 6;
        }

        protected void btnPreviousBranch_Click(object sender, EventArgs e)
        {
            ViewState["branch_page"] = Convert.ToInt32(ViewState["branch_page"]) - 1;
            fillBranchGrid();
        }

        protected void btnNextBranch_Click(object sender, EventArgs e)
        {
            ViewState["branch_page"] = Convert.ToInt32(ViewState["branch_page"]) + 1;
            fillBranchGrid();
        }

        protected void btnFilterBranch_Click(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filterBranchGrid(reportClass.search_branch_reports(txtSearchBranch.Text).Tables[0]);
        }

        protected void BranchDegreeFilter_Changed(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filterBranchGrid(reportClass.select_branch_reports_by_degree(ddlBranchDegree.SelectedValue).Tables[0]);
        }

        protected void btnResetBranch_Click(object sender, EventArgs e)
        {
            txtSearchBranch.Text = "";
            ddlBranchDegree.SelectedIndex = 0;
            ViewState["branch_page"] = 0;
            fillBranchGrid();
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            ViewState["page"] = 0;

            gvReportRoster.DataSource = reportClass.certificate_pagination(dt, 0);
            gvReportRoster.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPages.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = false;
            btnNext.Enabled = dt != null && dt.Rows.Count > 6;
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 1;
            fillgrid();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 1;
            fillgrid();
        }

        // SearchButton 
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filtergrid(reportClass.search_reports(txtReportSearch.Text).Tables[0]);
        }

        // Status
        protected void ReportFilter_Changed(object sender, EventArgs e)
        {
            reportClass = new AdminReportsClass();
            filtergrid(reportClass.select_reports_by_status(ddlReportStatus.SelectedValue).Tables[0]);
        }

        // ResetButton
        protected void btnFilterReset_Click(object sender, EventArgs e)
        {
            txtReportSearch.Text = "";
            ddlReportStatus.SelectedIndex = 0;
            ViewState["page"] = 0;
            fillgrid();
        }

        void LoadKPIs()
        {
            SqlConnection con = reportClass.getcon();

            // Total Students
            SqlDataAdapter da = new SqlDataAdapter("select count(*) from register_auth where regRole='student'", con);
            DataSet ds = new DataSet();
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

        // 1. Candidate Placement Master Roster Report (PDF)
        protected void btnExportCsv_Click(object sender, EventArgs e)
        {
            getcon();

            string q = "select ca.StudentRollNo as [Roll No], ca.StudentName as [Student Name], " +
                       "ca.StudentBranch as [Branch], ca.StudentCgpa as [CGPA], ca.JobRole as [Job Role], " +
                       "ISNULL(rac.compName, ca.CompanyUsername) as [Company], " +
                       "ca.ApplicationStatus as [Status], " +
                       "CONVERT(VARCHAR(10), ca.AppliedDate, 120) as [Applied Date] " +
                       "from Company_Applications ca " +
                       "LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) " +
                       "order by ca.Id desc";

            da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4.Rotate());

                PdfWriter.GetInstance(doc, ms);
                doc.Open();

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                // Add column names
                foreach (DataColumn column in dt.Columns)
                {
                    table.AddCell(column.ColumnName);
                }

                // Add database data
                foreach (DataRow row in dt.Rows)
                {
                    foreach (DataColumn column in dt.Columns)
                    {
                        string value = row[column] == DBNull.Value ? "" : Convert.ToString(row[column]);
                        table.AddCell(value);
                    }
                }

                doc.Add(table);
                doc.Close();

                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=RKU_Placement_Roster.pdf");
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.SuppressContent = true;
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        // 2. Placed / Selected Students Report (PDF)
        protected void btnExportPlacedPdf_Click(object sender, EventArgs e)
        {
            getcon();

            string q = "select ca.StudentRollNo as [Roll No], ca.StudentName as [Student Name], " +
                       "ca.StudentBranch as [Branch], ca.StudentCgpa as [CGPA], ca.JobRole as [Job Role], " +
                       "ISNULL(rac.compName, ca.CompanyUsername) as [Company], " +
                       "ca.ApplicationStatus as [Status], " +
                       "CONVERT(VARCHAR(10), ca.AppliedDate, 120) as [Placed Date] " +
                       "from Company_Applications ca " +
                       "LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) " +
                       "where (ca.ApplicationStatus = 'Selected' or ca.ApplicationStatus = 'Offer Accepted' or ca.ApplicationStatus = 'Placed') " +
                       "order by ca.Id desc";

            da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4.Rotate());

                PdfWriter.GetInstance(doc, ms);
                doc.Open();

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                // Add column names
                foreach (DataColumn column in dt.Columns)
                {
                    table.AddCell(column.ColumnName);
                }

                // Add database data
                foreach (DataRow row in dt.Rows)
                {
                    foreach (DataColumn column in dt.Columns)
                    {
                        string value = row[column] == DBNull.Value ? "" : Convert.ToString(row[column]);
                        table.AddCell(value);
                    }
                }

                doc.Add(table);
                doc.Close();

                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=RKU_Placed_Students_Report.pdf");
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.SuppressContent = true;
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        // 3. Company-Wise Recruitment Report (PDF)
        protected void btnExportCompanyCsv_Click(object sender, EventArgs e)
        {
            getcon();

            string q = "SELECT c.compName as [Company Name], c.compEmail as [Email], " +
                       "ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS [Industry], " +
                       "(SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS [Total Drives], " +
                       "(SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS [Applicants], " +
                       "(SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS [Shortlisted], " +
                       "(SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS [Hired], " +
                       "CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' " +
                       "WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' " +
                       "ELSE 'Registered' END AS [Status] " +
                       "FROM register_auth_company c ORDER BY [Applicants] DESC, c.Id DESC";

            da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4.Rotate());

                PdfWriter.GetInstance(doc, ms);
                doc.Open();

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                // Add column names
                foreach (DataColumn column in dt.Columns)
                {
                    table.AddCell(column.ColumnName);
                }

                // Add database data
                foreach (DataRow row in dt.Rows)
                {
                    foreach (DataColumn column in dt.Columns)
                    {
                        string value = row[column] == DBNull.Value ? "" : Convert.ToString(row[column]);
                        table.AddCell(value);
                    }
                }

                doc.Add(table);
                doc.Close();

                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=RKU_Company_Recruitment_Report.pdf");
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.SuppressContent = true;
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        // 4. Branch-Wise Placement Statistics Report (PDF)
        protected void btnExportBranchCsv_Click(object sender, EventArgs e)
        {
            getcon();

            string q = "SELECT ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') AS [Branch / Stream], " +
                       "ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') AS [Degree], " +
                       "COUNT(r.Id) AS [Total Enrolled], " +
                       "COUNT(p.StudentRollNo) AS [Placed Students], " +
                       "(COUNT(r.Id) - COUNT(p.StudentRollNo)) AS [Unplaced], " +
                       "CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 1) AS VARCHAR(10)) + '%' ELSE '0.0%' END AS [Placement Rate] " +
                       "FROM register_auth r " +
                       "LEFT JOIN (SELECT DISTINCT StudentRollNo FROM Company_Applications WHERE ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted' OR ApplicationStatus = 'Placed') p ON r.regRollNo = p.StudentRollNo " +
                       "WHERE r.regRole = 'student' OR r.regRole IS NULL " +
                       "GROUP BY ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science'), ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') " +
                       "ORDER BY [Total Enrolled] DESC";

            da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4.Rotate());

                PdfWriter.GetInstance(doc, ms);
                doc.Open();

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                // Add column names
                foreach (DataColumn column in dt.Columns)
                {
                    table.AddCell(column.ColumnName);
                }

                // Add database data
                foreach (DataRow row in dt.Rows)
                {
                    foreach (DataColumn column in dt.Columns)
                    {
                        string value = row[column] == DBNull.Value ? "" : Convert.ToString(row[column]);
                        table.AddCell(value);
                    }
                }

                doc.Add(table);
                doc.Close();

                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=RKU_Branch_Placement_Statistics.pdf");
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.SuppressContent = true;
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        // 5. Campus Recruitment Drives Report (PDF)
        protected void btnExportDrivesPdf_Click(object sender, EventArgs e)
        {
            getcon();

            string q = "SELECT cd.JobRole as [Job Role], " +
                       "ISNULL(rac.compName, cd.CompanyUsername) as [Company], " +
                       "cd.PackageOffered as [Package], cd.VenueLocation as [Venue], " +
                       "CONVERT(VARCHAR(10), cd.DriveDate, 120) as [Drive Date], " +
                       "cd.DriveStatus as [Status] " +
                       "FROM Company_Drives cd " +
                       "LEFT JOIN register_auth_company rac ON (cd.CompanyUsername = rac.compUsername OR cd.CompanyUsername = rac.compEmail) " +
                       "ORDER BY cd.Id DESC";

            da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4.Rotate());

                PdfWriter.GetInstance(doc, ms);
                doc.Open();

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                // Add column names
                foreach (DataColumn column in dt.Columns)
                {
                    table.AddCell(column.ColumnName);
                }

                // Add database data
                foreach (DataRow row in dt.Rows)
                {
                    foreach (DataColumn column in dt.Columns)
                    {
                        string value = row[column] == DBNull.Value ? "" : Convert.ToString(row[column]);
                        table.AddCell(value);
                    }
                }

                doc.Add(table);
                doc.Close();

                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=RKU_Campus_Drives_Report.pdf");
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.SuppressContent = true;
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}
