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

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        string getCompanyCondition(string compUser)
        {
            return "(CompanyUsername='" + compUser + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or CompanyUsername in (select compEmail from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or DriveId in (select Id from Company_Drives where CompanyUsername='" + compUser + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "') or CompanyUsername in (select compEmail from register_auth_company where compEmail='" + compUser + "' or compUsername='" + compUser + "')))";
        }

        // search_applicants
        public DataSet search_applicants(string nm, string compUser)
        {
            if (string.IsNullOrWhiteSpace(nm))
            {
                return select_all_applicants(compUser);
            }
            getcon();
            string compCond = getCompanyCondition(compUser);
            da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (" + compCond + ") AND (StudentName LIKE '%" + nm + "%' OR StudentRollNo LIKE '%" + nm + "%' OR StudentEmail LIKE '%" + nm + "%' OR StudentBranch LIKE '%" + nm + "%' OR JobRole LIKE '%" + nm + "%' OR ApplicationStatus LIKE '%" + nm + "%') ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_applicants
        public DataSet select_all_applicants(string compUser)
        {
            getcon();
            string compCond = getCompanyCondition(compUser);
            da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE " + compCond + " ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_applicants_by_drive
        public DataSet select_applicants_by_drive(string driveId, string compUser)
        {
            getcon();
            string compCond = getCompanyCondition(compUser);
            if (driveId == "0" || driveId == "All" || string.IsNullOrEmpty(driveId))
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE " + compCond + " ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (" + compCond + ") AND DriveId='" + driveId + "' ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_applicants_by_status
        public DataSet select_applicants_by_status(string st, string compUser)
        {
            getcon();
            string compCond = getCompanyCondition(compUser);
            if (st == "All" || string.IsNullOrEmpty(st))
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE " + compCond + " ORDER BY Id DESC", con);
            }
            else if (st == "Selected")
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (" + compCond + ") AND (ApplicationStatus='Selected' OR ApplicationStatus='Offer Accepted') ORDER BY Id DESC", con);
            }
            else if (st == "Pending")
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (" + compCond + ") AND (ApplicationStatus='Pending' OR ApplicationStatus='Under Review' OR ApplicationStatus IS NULL OR ApplicationStatus='') ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Company_Applications WHERE (" + compCond + ") AND ApplicationStatus='" + st + "' ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
