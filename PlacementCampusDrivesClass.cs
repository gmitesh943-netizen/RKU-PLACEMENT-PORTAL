using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class PlacementCampusDrivesClass
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // fill grid method
        public DataSet select_drives()
        {
            getcon();
            da = new SqlDataAdapter("SELECT cd.*, rac.compName, rac.compLogo FROM Company_Drives cd LEFT JOIN register_auth_company rac ON (cd.CompanyUsername = rac.compUsername OR cd.CompanyUsername = rac.compEmail) ORDER BY cd.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  search filter
        public DataSet search_drives(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT cd.*, rac.compName, rac.compLogo FROM Company_Drives cd LEFT JOIN register_auth_company rac ON (cd.CompanyUsername = rac.compUsername OR cd.CompanyUsername = rac.compEmail) ORDER BY cd.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT cd.*, rac.compName, rac.compLogo FROM Company_Drives cd LEFT JOIN register_auth_company rac ON (cd.CompanyUsername = rac.compUsername OR cd.CompanyUsername = rac.compEmail) WHERE (cd.JobRole LIKE '%" + nm + "%' OR rac.compName LIKE '%" + nm + "%' OR rac.compIndustry LIKE '%" + nm + "%' OR cd.VenueLocation LIKE '%" + nm + "%' OR cd.PackageOffered LIKE '%" + nm + "%' OR CAST(cd.Id AS VARCHAR) LIKE '%" + nm + "%') ORDER BY cd.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  department filter
        public DataSet select_drives_by_dept(string dept)
        {
            getcon();
            if (string.IsNullOrEmpty(dept) || dept == "all" || dept == "All")
            {
                da = new SqlDataAdapter("SELECT cd.*, rac.compName, rac.compLogo FROM Company_Drives cd LEFT JOIN register_auth_company rac ON (cd.CompanyUsername = rac.compUsername OR cd.CompanyUsername = rac.compEmail) ORDER BY cd.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT cd.*, rac.compName, rac.compLogo FROM Company_Drives cd LEFT JOIN register_auth_company rac ON (cd.CompanyUsername = rac.compUsername OR cd.CompanyUsername = rac.compEmail) WHERE (cd.JobRole LIKE '%" + dept + "%' OR rac.compIndustry LIKE '%" + dept + "%' OR cd.JobDescription LIKE '%" + dept + "%') ORDER BY cd.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Backward compatibility
        public DataSet select_all_drives()
        {
            return select_drives();
        }
    }
}
