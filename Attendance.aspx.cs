using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Attendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAttendanceGrid();
        }
    }

    private void LoadAttendanceGrid()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
            SELECT 
                s.Id,
                s.RollNo, 
                s.Name AS StudentName,
                s.Email,  
                a.Status
            FROM 
                Student s 
            LEFT JOIN 
                Attendance a ON s.Id = a.StudentId 
                AND CAST(a.Date AS DATE) = CAST(GETDATE() AS DATE)";

            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gvAttendance.DataSource = dt;
            gvAttendance.DataBind();
        }
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;

        int rowIndex = row.RowIndex;

        if (rowIndex >= 0 && rowIndex < gvAttendance.DataKeys.Count && gvAttendance.DataKeys[rowIndex] != null)
        {
            int studentId = Convert.ToInt32(gvAttendance.DataKeys[rowIndex].Value);
            string status = ddl.SelectedValue;

            if (!string.IsNullOrEmpty(status))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("sp_InsertAtten", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@StudentId", studentId);
                    command.Parameters.AddWithValue("@Status", status);

                    connection.Open();
                    command.ExecuteNonQuery(); 
                    connection.Close();
                }


                LoadAttendanceGrid();
            }
            else
            {
                Response.Write("Error: Please select a valid status.");
            }
        }
        else
        {
            Response.Write("Error: Invalid row or missing DataKey.");
        }
    }
}
