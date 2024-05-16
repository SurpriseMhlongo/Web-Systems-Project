using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;

namespace FreightDirector.FleetController
{
    public partial class RegisterDriver : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the values entered by the user
            string driverFName = txtDriverFName.Text;
            string driverLName = txtDriverLName.Text;
            string driverPwd = txtDriverPassword.Text;
            string driverPhone = txtDriverPhone.Text;
            string driverUsername = txtDriverUsername.Text;

            // Check if the email already exists
            string connectionString = ConfigurationManager.ConnectionStrings["FreightDirector"].ConnectionString;
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();
                string checkUsernameQuery = "SELECT COUNT(*) FROM Driver WHERE driverUsername = @Username";
                using (OleDbCommand checkUsernameCommand = new OleDbCommand(checkUsernameQuery, connection))
                {
                    checkUsernameCommand.Parameters.AddWithValue("@Username", driverUsername);
                    int existingUsernameCount = (int)checkUsernameCommand.ExecuteScalar();
                    if (existingUsernameCount > 0)
                    {
                        lblFeedback.InnerText = "Username already exists.";
                        connection.Close();
                        return;
                    }
                }

                // Insert the driver data into the database
                string insertQuery = "INSERT INTO Driver (driverFName, driverLName, driverPwd, driverPhone, driverUsername) " +
                                     "VALUES (@FName, @LName, @Pwd, @Phone, @Username)";
                using (OleDbCommand command = new OleDbCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@FName", driverFName);
                    command.Parameters.AddWithValue("@LName", driverLName);
                    command.Parameters.AddWithValue("@Pwd", driverPwd);
                    command.Parameters.AddWithValue("@Phone", driverPhone);
                    command.Parameters.AddWithValue("@Username", driverUsername);

                    command.ExecuteNonQuery();
                }

                connection.Close();
            }

            // Clear fields
            ClearRegistrationForm();

            lblFeedback.InnerText = "Registration successful!";
        }

        protected void btnClearForm_Click(object sender, EventArgs e)
        {
            ClearRegistrationForm();
        }


        private void ClearRegistrationForm()
        {
            txtDriverFName.Text = string.Empty;
            txtDriverLName.Text = string.Empty;
            txtDriverPassword.Text = string.Empty;
            txtDriverPhone.Text = string.Empty;
            txtDriverUsername.Text = string.Empty;
            lblFeedback.InnerText = string.Empty;
        }

    }
}
