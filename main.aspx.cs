using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class YourDashboard : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAttendanceData();
        }
    }

    private void LoadAttendanceData()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString; // Ensure this matches your connection string in web.config
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("sp_GetAttendance", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    int presentCount = reader.GetInt32(0); // PresentCount
                    int absentCount = reader.GetInt32(1); // AbsentCount
                    lblPresentCount.Text = "Present Count: " + presentCount.ToString();
                    lblAbsentCount.Text = "Absent Count: " + absentCount.ToString();
                    string script = "renderChart(" + presentCount + ", " + absentCount + ");";
                    ClientScript.RegisterStartupScript(this.GetType(), "RenderChart", script, true);
                }
            }
        }
    }
}
