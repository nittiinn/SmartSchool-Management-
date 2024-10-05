using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class h_work : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("USP_InsertHomeworkSubmission", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Add parameters
                cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(txtDate.Text));
                cmd.Parameters.AddWithValue("@HomeworkTitle", txtHomeworkTitle.Text);
                cmd.Parameters.AddWithValue("@SubmissionDate", Convert.ToDateTime(txtSubmissionDate.Text));
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Homework submission successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception)
                {
                    lblMessage.Text = "An error occurred while submitting the homework. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}