using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        DataTable dtUploads = new DataTable();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ID, Semester, Subject, DateField, TimeField, PDFPath, VideoPath FROM UploadDetails", conn))
            {
                cmd.CommandType = CommandType.Text;

                conn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dtUploads);
                }
            }
        }

        reportsGridView.DataSource = dtUploads;
        reportsGridView.DataBind();
    }
}
