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

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        string getBaseQuery()
        {
            return "SELECT ca.*, rac.compName FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail)";
        }

        // search_reports
        public DataSet search_reports(string search)
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return select_all_reports();
            }
            getcon();
            string baseQ = getBaseQuery();
            string safeSearch = search.Trim().Replace("'", "''");
            string extraCond = "";
            if (safeSearch.Equals("placed", StringComparison.OrdinalIgnoreCase))
            {
                extraCond = " OR ca.ApplicationStatus = 'Offer Accepted' OR ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Placed'";
            }

            da = new SqlDataAdapter(baseQ + " WHERE (ca.StudentName LIKE '%" + safeSearch + "%' OR ca.StudentRollNo LIKE '%" + safeSearch + "%' OR ca.StudentBranch LIKE '%" + safeSearch + "%' OR ca.JobRole LIKE '%" + safeSearch + "%' OR rac.compName LIKE '%" + safeSearch + "%' OR ca.ApplicationStatus LIKE '%" + safeSearch + "%'" + extraCond + ") ORDER BY ca.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_reports
        public DataSet select_all_reports()
        {
            getcon();
            string baseQ = getBaseQuery();
            da = new SqlDataAdapter(baseQ + " ORDER BY ca.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_reports_by_status
        public DataSet select_reports_by_status(string status)
        {
            getcon();
            string baseQ = getBaseQuery();
            if (string.IsNullOrEmpty(status) || status == "All")
            {
                da = new SqlDataAdapter(baseQ + " ORDER BY ca.Id DESC", con);
            }
            else if (status == "Selected" || status == "Placed")
            {
                da = new SqlDataAdapter(baseQ + " WHERE (ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Offer Accepted' OR ca.ApplicationStatus = 'Placed') ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter(baseQ + " WHERE ca.ApplicationStatus = '" + status + "' ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // filter_reports (combines search + status)
        public DataSet filter_reports(string search, string status)
        {
            getcon();
            string baseQ = getBaseQuery();
            string query = baseQ + " WHERE 1=1";

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                if (status == "Selected" || status == "Placed")
                {
                    query += " AND (ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Offer Accepted' OR ca.ApplicationStatus = 'Placed')";
                }
                else
                {
                    query += " AND ca.ApplicationStatus = '" + status + "'";
                }
            }

            if (!string.IsNullOrWhiteSpace(search))
            {
                string safeSearch = search.Trim().Replace("'", "''");
                string extraCond = "";
                if (safeSearch.Equals("placed", StringComparison.OrdinalIgnoreCase))
                {
                    extraCond = " OR ca.ApplicationStatus = 'Offer Accepted' OR ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Placed'";
                }
                query += " AND (ca.StudentName LIKE '%" + safeSearch + "%' OR ca.StudentRollNo LIKE '%" + safeSearch + "%' OR ca.StudentBranch LIKE '%" + safeSearch + "%' OR ca.JobRole LIKE '%" + safeSearch + "%' OR rac.compName LIKE '%" + safeSearch + "%' OR ca.ApplicationStatus LIKE '%" + safeSearch + "%'" + extraCond + ")";
            }

            query += " ORDER BY ca.Id DESC";
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
