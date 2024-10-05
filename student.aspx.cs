using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Student (Name, RollNo, ApplicationNo, Email, MobileNo, DateOfBirth, Gender, Password) VALUES (@Name, @RollNo, @ApplicationNo, @Email, @MobileNo, @DateOfBirth, @Gender, @Password)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Name", txtName.Text);
            command.Parameters.AddWithValue("@RollNo", txtRollNo.Text);
            command.Parameters.AddWithValue("@ApplicationNo", txtApplicationNo.Text);
            command.Parameters.AddWithValue("@Email", txtEmail.Text);
            command.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
            command.Parameters.AddWithValue("@DateOfBirth", Convert.ToDateTime(txtDob.Text));
            command.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
            command.Parameters.AddWithValue("@Password", txtPassword.Text); 

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        Response.Redirect("Attendance.aspx");
    }
}