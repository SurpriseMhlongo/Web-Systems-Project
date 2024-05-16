using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

namespace FreightDirector.Driver
{
    public partial class UpdateDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDriverDetails();
            }
        }

        protected void btnUpdateDetails_Click(object sender, EventArgs e)
        {
            int driverID = Convert.ToInt32(txtDriverID.Text);
            string lastName = txtLastName.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string newPassword = txtPwd.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["FreightDirector"].ConnectionString;

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                using (OleDbCommand command = new OleDbCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;

                    // Check if any fields are being updated 
                    if (!string.IsNullOrEmpty(lastName) || !string.IsNullOrEmpty(phoneNumber) || !string.IsNullOrEmpty(newPassword))
                    {
                        command.CommandText = "UPDATE Driver SET driverLName = @LastName, driverPhone = @PhoneNumber, driverPwd = @NewPassword WHERE driverID = @DriverID";

                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                        command.Parameters.AddWithValue("@NewPassword", newPassword);
                        command.Parameters.AddWithValue("@DriverID", driverID);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblUpdateMessage.Text = "Details updated successfully.";
                        }
                        else
                        {
                            lblUpdateMessage.Text = "Update failed.";
                        }
                    }
                    else
                    {
                        lblUpdateMessage.Text = "No fields to update.";
                    }
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Clear form fields
            txtLastName.Text = "";
            txtPhoneNumber.Text = "";
            txtPwd.Text = "";
            txtConfirmPwd.Text = "";
        }

        private void LoadDriverDetails()
        {
            int driverID = Convert.ToInt32(Session["DriverID"]);
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                using (OleDbCommand command = new OleDbCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;

                    command.CommandText = "SELECT driverID, driverFName, driverLName, driverPhone, driverUsername, currentLoad FROM Driver WHERE driverID = @DriverID";
                    command.Parameters.AddWithValue("@DriverID", driverID);

                    connection.Open();

                    using (OleDbDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtDriverID.Text = reader["driverID"].ToString();
                            txtFirstName.Text = reader["driverFName"].ToString();
                            txtLastName.Text = reader["driverLName"].ToString();
                            txtPhoneNumber.Text = reader["driverPhone"].ToString();
                            txtEmail.Text = reader["driverUsername"].ToString();
                            txtCurrLoad.Text = reader["currentLoad"].ToString();
                        }
                    }
                }
            }
        }
    }
}
