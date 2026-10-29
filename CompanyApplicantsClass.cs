using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class CompanyApplicantsClass
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
        public DataSet select_applicants(string compUser)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  search filter
        public DataSet search_applicants(string nm, string compUser)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) AND (StudentName LIKE '%" + nm + "%' OR StudentRollNo LIKE '%" + nm + "%' OR StudentEmail LIKE '%" + nm + "%' OR StudentBranch LIKE '%" + nm + "%' OR JobRole LIKE '%" + nm + "%' OR ApplicationStatus LIKE '%" + nm + "%' OR CAST(Id AS VARCHAR) LIKE '%" + nm + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  drive filter
        public DataSet select_applicants_by_drive(string driveId, string compUser)
        {
            getcon();
            if (driveId == "0" || driveId == "all" || driveId == "All")
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) AND DriveId = '" + driveId + "' ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  status filter
        public DataSet select_applicants_by_status(string st, string compUser)
        {
            getcon();
            if (st == "all" || st == "All")
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) ORDER BY Id DESC", con);
            }
            else if (st == "Selected")
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) AND (ApplicationStatus = 'Selected' OR ApplicationStatus = 'Offer Accepted') ORDER BY Id DESC", con);
            }
            else if (st == "Pending")
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) AND (ApplicationStatus = 'Pending' OR ApplicationStatus = 'Under Review' OR ApplicationStatus IS NULL OR ApplicationStatus = '') ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR CompanyUsername IN (SELECT compEmail FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "') OR DriveId IN (SELECT Id FROM Company_Drives WHERE CompanyUsername = '" + compUser + "' OR CompanyUsername IN (SELECT compUsername FROM register_auth_company WHERE compEmail = '" + compUser + "' OR compUsername = '" + compUser + "'))) AND ApplicationStatus = '" + st + "' ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Update application status
        public void update_status(int appId, string status)
        {
            getcon();
            cmd = new SqlCommand("UPDATE Company_Applications SET ApplicationStatus = '" + status + "' WHERE Id = " + appId, con);
            cmd.ExecuteNonQuery();
        }

        // Schedule interview
        public void schedule_interview(int appId, string interviewDate, string venue, string remarks)
        {
            getcon();
            cmd = new SqlCommand("UPDATE Company_Applications SET ApplicationStatus = 'Shortlisted', InterviewDate = '" + interviewDate + "', InterviewVenue = '" + venue + "', Remarks = '" + remarks + "' WHERE Id = " + appId, con);
            cmd.ExecuteNonQuery();
        }

        // Pagination
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
    }
}
