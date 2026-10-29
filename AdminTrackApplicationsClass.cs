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
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // fill grid method
        public DataSet select_applications()
        {
            getcon();
            da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  search filter
        public DataSet search_applications(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE (ca.StudentName LIKE '%" + nm + "%' OR ca.StudentRollNo LIKE '%" + nm + "%' OR ca.StudentBranch LIKE '%" + nm + "%' OR ca.JobRole LIKE '%" + nm + "%' OR rac.compName LIKE '%" + nm + "%' OR ca.ApplicationStatus LIKE '%" + nm + "%' OR CAST(ca.Id AS VARCHAR) LIKE '%" + nm + "%') ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  company filter
        public DataSet select_applications_by_company(string company)
        {
            getcon();
            if (company == "all" || company == "All" || company == "0")
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE (ca.CompanyUsername = '" + company + "' OR rac.compUsername = '" + company + "' OR rac.compEmail = '" + company + "' OR rac.compName = (SELECT TOP 1 c.compName FROM register_auth_company c WHERE c.compUsername = '" + company + "' OR c.compEmail = '" + company + "')) ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  status filter
        public DataSet select_applications_by_status(string status)
        {
            getcon();
            if (status == "all" || status == "All")
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) ORDER BY ca.Id DESC", con);
            }
            else if (status == "Selected" || status == "Offer Accepted")
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE (ca.ApplicationStatus = 'Selected' OR ca.ApplicationStatus = 'Offer Accepted') ORDER BY ca.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT ca.*, rac.compName, rac.compLogo, (SELECT TOP 1 r.photoUrl FROM register_auth r WHERE (r.regEmail = ca.StudentEmail AND ca.StudentEmail <> '') OR (r.regUsername = ca.StudentUsername AND ca.StudentUsername <> '') OR (r.regRollNo = ca.StudentRollNo AND ca.StudentRollNo <> '') ORDER BY CASE WHEN r.photoUrl IS NOT NULL AND r.photoUrl <> '' THEN 0 ELSE 1 END, r.Id DESC) AS photoUrl FROM Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername OR ca.CompanyUsername = rac.compEmail) WHERE ca.ApplicationStatus = '" + status + "' ORDER BY ca.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Delete application 
        public void delete_application(int id)
        {
            getcon();
            cmd = new SqlCommand("delete from Company_Applications where Id = " + id, con);
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
