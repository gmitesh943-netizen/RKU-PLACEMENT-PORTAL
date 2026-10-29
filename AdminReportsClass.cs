using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class AdminReportsClass
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // fill grid method
        public DataSet select_reports()
        {
            getcon();
            da = new SqlDataAdapter("SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //Pagination for Recruitment Master Roster
        public DataTable certificate_pagination(DataTable dt, int page)
        {
            DataTable dt2 = dt.Clone();
            int start = page * 6;
            for (int i = start; i < start + 6 && i < dt.Rows.Count; i++)
            {
                dt2.ImportRow(dt.Rows[i]);
            }
            return dt2;
        }

  
        //  search filter
        public DataSet search_reports(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE (ca.StudentName LIKE '%" + nm + "%' OR ca.StudentRollNo LIKE '%" + nm + "%' OR ca.StudentBranch LIKE '%" + nm + "%' OR ca.JobRole LIKE '%" + nm + "%' OR rac.compName LIKE '%" + nm + "%' OR ca.ApplicationStatus LIKE '%" + nm + "%') ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  status filter
        public DataSet select_reports_by_status(string status)
        {
            getcon();
            if (status == "all" || status == "All")
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            }
            else if (status == "Selected" || status == "Placed")
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE (ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Offer Accepted' OR ca.ApplicationStatus = 'Placed') ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE ca.ApplicationStatus = '" + status + "' ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Delete report
        public void delete_report(int id)
        {
            getcon();
            cmd = new SqlCommand("delete from Company_Applications where Id = " + id, con);
            cmd.ExecuteNonQuery();
        }

        // Company-Wise Recruitment Report
        public DataSet select_company_reports()
        {
            getcon();
            da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c ORDER BY TotalApplicants DESC, c.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Search Company Report
        public DataSet search_company_reports(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c ORDER BY TotalApplicants DESC, c.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c WHERE (c.compName LIKE '%" + nm + "%' OR c.compEmail LIKE '%" + nm + "%' OR c.compIndustry LIKE '%" + nm + "%' OR c.compLocation LIKE '%" + nm + "%') ORDER BY TotalApplicants DESC, c.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Filter Company Report by Status
        public DataSet select_company_reports_by_status(string status)
        {
            getcon();
            if (status == "all" || status == "All")
            {
                da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c ORDER BY TotalApplicants DESC, c.Id DESC", con);
            }
            else if (status == "Active")
            {
                da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c WHERE EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') ORDER BY TotalApplicants DESC, c.Id DESC", con);
            }
            else if (status == "Completed")
            {
                da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c WHERE NOT EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') AND EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) ORDER BY TotalApplicants DESC, c.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT c.compName, c.compEmail, c.compUsername, c.compLogo, ISNULL(NULLIF(c.compIndustry, ''), 'IT & Software') AS compIndustry, (SELECT COUNT(*) FROM Company_Drives d WHERE d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AS TotalDrives, (SELECT COUNT(*) FROM Company_Applications a WHERE a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail)) AS TotalApplicants, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Shortlisted') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS ShortlistedCount, (SELECT COUNT(*) FROM Company_Applications a WHERE (a.ApplicationStatus = 'Selected' OR a.ApplicationStatus = 'Offer Accepted' OR a.ApplicationStatus = 'Placed') AND (a.CompanyUsername = c.compUsername OR a.CompanyUsername = c.compEmail OR a.DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = c.compUsername OR CompanyUsername = c.compEmail))) AS HiredCount, CASE WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) AND d.DriveStatus = 'Open') THEN 'Active' WHEN EXISTS (SELECT 1 FROM Company_Drives d WHERE (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)) THEN 'Completed' ELSE 'Registered' END AS Status FROM register_auth_company c ORDER BY TotalApplicants DESC, c.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Branch-Wise Placement Statistics Report
        public DataSet select_branch_reports()
        {
            getcon();
            da = new SqlDataAdapter("SELECT ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') AS BranchName, ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') AS DegreeProgram, COUNT(r.Id) AS TotalEnrolled, COUNT(p.StudentRollNo) AS PlacedCount, (COUNT(r.Id) - COUNT(p.StudentRollNo)) AS UnplacedCount, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 1) AS VARCHAR(10)) + '%' ELSE '0.0%' END AS PlacementRate, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 0) AS INT) ELSE 0 END AS PlacementRateInt FROM register_auth r LEFT JOIN (SELECT DISTINCT StudentRollNo FROM Company_Applications WHERE ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted' OR ApplicationStatus = 'Placed') p ON r.regRollNo = p.StudentRollNo WHERE r.regRole = 'student' OR r.regRole IS NULL GROUP BY ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science'), ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') ORDER BY TotalEnrolled DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Search Branch Report
        public DataSet search_branch_reports(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') AS BranchName, ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') AS DegreeProgram, COUNT(r.Id) AS TotalEnrolled, COUNT(p.StudentRollNo) AS PlacedCount, (COUNT(r.Id) - COUNT(p.StudentRollNo)) AS UnplacedCount, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 1) AS VARCHAR(10)) + '%' ELSE '0.0%' END AS PlacementRate, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 0) AS INT) ELSE 0 END AS PlacementRateInt FROM register_auth r LEFT JOIN (SELECT DISTINCT StudentRollNo FROM Company_Applications WHERE ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted' OR ApplicationStatus = 'Placed') p ON r.regRollNo = p.StudentRollNo WHERE r.regRole = 'student' OR r.regRole IS NULL GROUP BY ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science'), ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') ORDER BY TotalEnrolled DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') AS BranchName, ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') AS DegreeProgram, COUNT(r.Id) AS TotalEnrolled, COUNT(p.StudentRollNo) AS PlacedCount, (COUNT(r.Id) - COUNT(p.StudentRollNo)) AS UnplacedCount, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 1) AS VARCHAR(10)) + '%' ELSE '0.0%' END AS PlacementRate, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 0) AS INT) ELSE 0 END AS PlacementRateInt FROM register_auth r LEFT JOIN (SELECT DISTINCT StudentRollNo FROM Company_Applications WHERE ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted' OR ApplicationStatus = 'Placed') p ON r.regRollNo = p.StudentRollNo WHERE (r.regRole = 'student' OR r.regRole IS NULL) AND (ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') LIKE '%" + nm + "%' OR ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') LIKE '%" + nm + "%') GROUP BY ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science'), ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') ORDER BY TotalEnrolled DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Filter Branch Report by Degree
        public DataSet select_branch_reports_by_degree(string degree)
        {
            getcon();
            if (degree == "all" || degree == "All")
            {
                da = new SqlDataAdapter("SELECT ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') AS BranchName, ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') AS DegreeProgram, COUNT(r.Id) AS TotalEnrolled, COUNT(p.StudentRollNo) AS PlacedCount, (COUNT(r.Id) - COUNT(p.StudentRollNo)) AS UnplacedCount, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 1) AS VARCHAR(10)) + '%' ELSE '0.0%' END AS PlacementRate, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 0) AS INT) ELSE 0 END AS PlacementRateInt FROM register_auth r LEFT JOIN (SELECT DISTINCT StudentRollNo FROM Company_Applications WHERE ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted' OR ApplicationStatus = 'Placed') p ON r.regRollNo = p.StudentRollNo WHERE r.regRole = 'student' OR r.regRole IS NULL GROUP BY ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science'), ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') ORDER BY TotalEnrolled DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') AS BranchName, ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') AS DegreeProgram, COUNT(r.Id) AS TotalEnrolled, COUNT(p.StudentRollNo) AS PlacedCount, (COUNT(r.Id) - COUNT(p.StudentRollNo)) AS UnplacedCount, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 1) AS VARCHAR(10)) + '%' ELSE '0.0%' END AS PlacementRate, CASE WHEN COUNT(r.Id) > 0 THEN CAST(ROUND((CAST(COUNT(p.StudentRollNo) AS FLOAT) / COUNT(r.Id)) * 100, 0) AS INT) ELSE 0 END AS PlacementRateInt FROM register_auth r LEFT JOIN (SELECT DISTINCT StudentRollNo FROM Company_Applications WHERE ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted' OR ApplicationStatus = 'Placed') p ON r.regRollNo = p.StudentRollNo WHERE (r.regRole = 'student' OR r.regRole IS NULL) AND (ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') = '" + degree + "' OR ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') LIKE '%" + degree + "%' OR ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science') LIKE '%" + degree + "%') GROUP BY ISNULL(NULLIF(LTRIM(RTRIM(r.branch)), ''), 'Computer Science'), ISNULL(NULLIF(LTRIM(RTRIM(r.degree)), ''), 'BCA') ORDER BY TotalEnrolled DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
