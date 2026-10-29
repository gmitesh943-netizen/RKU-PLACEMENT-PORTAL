using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class AdminStudentDirectoryClass
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

        // ------------------STUDENT METHODS --------------

        // fill student grid method
        public DataSet select_students()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  student search filter
        public DataSet search_students(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth WHERE (regFullName LIKE '%" + nm + "%' OR regRollNo LIKE '%" + nm + "%' OR regEmail LIKE '%" + nm + "%' OR regMobile LIKE '%" + nm + "%' OR degree LIKE '%" + nm + "%' OR branch LIKE '%" + nm + "%' OR skills LIKE '%" + nm + "%' OR regUsername LIKE '%" + nm + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  student branch filter
        public DataSet select_students_by_branch(string branch)
        {
            getcon();
            if (branch == "all" || branch == "All")
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth WHERE (branch = '" + branch + "' OR branch LIKE '%" + branch + "%' OR degree LIKE '%" + branch + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Delete student 
        public void delete_student(int id)
        {
            getcon();
            cmd = new SqlCommand("delete from register_auth where Id = " + id, con);
            cmd.ExecuteNonQuery();
        }

      
        // -------------------------- COMPANY METHODS -----------------

        // fill company grid method
        public DataSet select_companies()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM register_auth_company ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  company search filter
        public DataSet search_companies(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth_company ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth_company WHERE (compName LIKE '%" + nm + "%' OR compEmail LIKE '%" + nm + "%' OR compMobile LIKE '%" + nm + "%' OR compHRName LIKE '%" + nm + "%' OR compIndustry LIKE '%" + nm + "%' OR compLocation LIKE '%" + nm + "%' OR compUsername LIKE '%" + nm + "%' OR compWebsite LIKE '%" + nm + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  company filter
        public DataSet select_companies_by_industry(string industry)
        {
            getcon();
            if ( industry == "all" || industry == "All")
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth_company ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth_company WHERE compIndustry = '" + industry + "' OR compIndustry LIKE '%" + industry + "%' ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Delete company 
        public void delete_company(int id)
        {
            getcon();
            cmd = new SqlCommand("delete from register_auth_company where Id = " + id, con);
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
