using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class AdminTrackApplicationsClass
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
            return "SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail)";
        }

        // search_applications
        public DataSet search_applications(string search)
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return select_all_applications();
            }
            getcon();
            string baseQ = getBaseQuery();
            da = new SqlDataAdapter(baseQ + " WHERE (ca.StudentName LIKE '%" + search + "%' OR ca.StudentRollNo LIKE '%" + search + "%' OR ca.StudentBranch LIKE '%" + search + "%' OR ca.JobRole LIKE '%" + search + "%' OR rac.compName LIKE '%" + search + "%' OR ca.ApplicationStatus LIKE '%" + search + "%') ORDER BY ca.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_applications
        public DataSet select_all_applications()
        {
            getcon();
            string baseQ = getBaseQuery();
            da = new SqlDataAdapter(baseQ + " ORDER BY ca.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_applications_by_company
        public DataSet select_applications_by_company(string company)
        {
            getcon();
            string baseQ = getBaseQuery();
            if (string.IsNullOrEmpty(company) || company == "All" || company == "0")
            {
                da = new SqlDataAdapter(baseQ + " ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter(baseQ + " WHERE (ca.CompanyUsername = '" + company + "' OR rac.compUsername = '" + company + "' OR rac.compEmail = '" + company + "' OR rac.compName = (SELECT TOP 1 c.compName FROM register_auth_company c WHERE c.compUsername = '" + company + "' OR c.compEmail = '" + company + "')) ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_applications_by_status
        public DataSet select_applications_by_status(string status)
        {
            getcon();
            string baseQ = getBaseQuery();
            if (string.IsNullOrEmpty(status) || status == "All")
            {
                da = new SqlDataAdapter(baseQ + " ORDER BY ca.Id DESC", con);
            }
            else if (status == "Selected")
            {
                da = new SqlDataAdapter(baseQ + " WHERE (ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Offer Accepted') ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter(baseQ + " WHERE ca.ApplicationStatus = '" + status + "' ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // filter_applications (combines search + company + status)
        public DataSet filter_applications(string search, string company, string status)
        {
            getcon();
            string baseQ = getBaseQuery();
            string query = baseQ + " WHERE 1=1";

            if (!string.IsNullOrEmpty(company) && company != "All" && company != "0")
            {
                query += " AND (ca.CompanyUsername = '" + company + "' OR rac.compUsername = '" + company + "' OR rac.compEmail = '" + company + "' OR rac.compName = (SELECT TOP 1 c.compName FROM register_auth_company c WHERE c.compUsername = '" + company + "' OR c.compEmail = '" + company + "'))";
            }

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                if (status == "Selected")
                {
                    query += " AND (ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Offer Accepted')";
                }
                else
                {
                    query += " AND ca.ApplicationStatus = '" + status + "'";
                }
            }

            if (!string.IsNullOrWhiteSpace(search))
            {
                query += " AND (ca.StudentName LIKE '%" + search + "%' OR ca.StudentRollNo LIKE '%" + search + "%' OR ca.StudentBranch LIKE '%" + search + "%' OR ca.JobRole LIKE '%" + search + "%' OR rac.compName LIKE '%" + search + "%')";
            }

            query += " ORDER BY ca.Id DESC";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
