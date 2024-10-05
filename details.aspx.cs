using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;
using System.Configuration; // Add this

public partial class details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Configuration for file upload size
            HttpContext.Current.Application["maxRequestLength"] = 10 * 1024; // Size in KB
        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        // Check the maximum request length
        if (Request.ContentLength > (int)HttpContext.Current.Application["maxRequestLength"] * 1024)
        {
            Response.Write("Error: File size exceeds the limit.");
            return;
        }

        // Get form data
        string semester = semesterDropdown.SelectedValue;
        string subject = subjectDropdown.SelectedValue;
        string dateFieldValue = dateField.Text;
        string timeFieldValue = timeField.Text;

        // Initialize paths for uploaded files
        string pdfPath = "";
        string videoPath = "";

        // Define folder paths for PDFs and Videos
        string pdfFolderPath = Server.MapPath("~/Uploads/PDFs/");
        string videoFolderPath = Server.MapPath("~/Uploads/Videos/");

        // Create directories if they don't exist
        if (!Directory.Exists(pdfFolderPath))
        {
            Directory.CreateDirectory(pdfFolderPath);
        }
        if (!Directory.Exists(videoFolderPath))
        {
            Directory.CreateDirectory(videoFolderPath);
        }

        if (pdfUpload.HasFile)
        {
            string fileName = Path.GetFileNameWithoutExtension(pdfUpload.FileName);
            string extension = Path.GetExtension(pdfUpload.FileName);
            string randomFileName = fileName + "_" + Guid.NewGuid().ToString() + extension;
            pdfPath = "~/Uploads/PDFs/" + randomFileName;
            pdfUpload.PostedFile.SaveAs(Server.MapPath(pdfPath));
        }

        // Handle Video upload
        if (videoUpload.HasFile)
        {
            string fileName = Path.GetFileNameWithoutExtension(videoUpload.FileName);
            string extension = Path.GetExtension(videoUpload.FileName);
            string randomFileName = fileName + "_" + Guid.NewGuid().ToString() + extension;
            videoPath = "~/Uploads/Videos/" + randomFileName;
            videoUpload.PostedFile.SaveAs(Server.MapPath(videoPath));

            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("USP_SaveUploadDetails", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Semester", semester);
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@DateField", dateFieldValue);
                    cmd.Parameters.AddWithValue("@TimeField", timeFieldValue);
                    cmd.Parameters.AddWithValue("@PDFPath", pdfPath);
                    cmd.Parameters.AddWithValue("@VideoPath", videoPath);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Success message or redirect
            Response.Write("<script>alert('Data has been uploaded successfully!');</script>");
        }
    }


}
