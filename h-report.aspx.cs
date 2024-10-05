using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class h_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView(); // Bind the GridView on initial load
        }
    }

    // Search by Date
    protected void btnSearchDate_Click(object sender, EventArgs e)
    {
        string selectedDate = txtSearchDate.Text;

        if (string.IsNullOrEmpty(selectedDate))
        {
            // Show error if the date is empty
            lblErrorMessage.Text = "Please enter a date to search.";
            gvReports.DataSource = null;
            gvReports.DataBind();
        }
        else
        {
            try
            {
                DateTime searchDate;

                string[] formats = { "MM/dd/yyyy", "dd/MM/yyyy", "yyyy-MM-dd" }; // Add any formats that might be used

                if (DateTime.TryParseExact(selectedDate, formats, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out searchDate))
                {
                    BindGridView("WHERE Date = @Date", new SqlParameter("@Date", searchDate));
                }
                else
                {
                    lblErrorMessage.Text = "Please enter the date in a valid format (e.g., MM/dd/yyyy).";
                    gvReports.DataSource = null;
                    gvReports.DataBind();
                }
            }
            catch (FormatException)
            {
                // Handle any parsing errors
                lblErrorMessage.Text = "The date entered is not valid. Please try again.";
            }
        }
    }

    // Search by Subject
    protected void btnSearchSubject_Click(object sender, EventArgs e)
    {
        string selectedSubject = ddlSearchSubject.SelectedValue;

        if (string.IsNullOrEmpty(selectedSubject) || selectedSubject == "Select Subject")
        {
            // Show error if no subject is selected
            lblErrorMessage.Text = "Please select a subject to search.";
            gvReports.DataSource = null;
            gvReports.DataBind();
        }
        else
        {
            BindGridView("WHERE Subject = @Subject", new SqlParameter("@Subject", selectedSubject));
        }
    }

    // Method to bind data to GridView
    private void BindGridView(string whereClause = "", SqlParameter parameter = null)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM HomeworkSubmissions " + whereClause;

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (parameter != null)
                {
                    cmd.Parameters.Add(parameter);
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvReports.DataSource = dt;
                    gvReports.DataBind();
                    lblErrorMessage.Text = ""; // Clear any previous error messages
                }
                else
                {
                    // Show an error message if no records were found
                    lblErrorMessage.Text = "No records found for the selected search criteria.";
                    gvReports.DataSource = null;
                    gvReports.DataBind();
                }
            }
        }
    }
}
