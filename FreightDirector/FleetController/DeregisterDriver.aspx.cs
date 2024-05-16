using System;
using System.Data.OleDb;
using System.Web.UI;

namespace FreightDirector
{
    public partial class DeregisterDriver : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnDriverSubmit_Click(object sender, EventArgs e)
        {
            string driverID = txtDriverID.Text.Trim();

            if (!string.IsNullOrEmpty(driverID))
            {
                if (CanDeregisterDriver(driverID))
                {
                    if (DeregisterDriverByID(driverID))
                    {
                        txtDriverID.Text = "";
                        lblDriverMessage.Text = "Driver deregistered successfully.";
                        lblDriverMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblDriverMessage.Text = "Failed to deregister driver. Please check the provided Driver ID.";
                        lblDriverMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblDriverMessage.Text = "Driver is currently assigned a job. Please wait until they are done.";
                    lblDriverMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblDriverMessage.Text = "Please enter a valid Driver ID.";
                lblDriverMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool CanDeregisterDriver(string driverID)
        {
            // Check if the driver has a job (currentLoad is not empty)
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Driver WHERE driverID = @DriverID AND currentLoad IS NOT NULL";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);

                    int count = (int)command.ExecuteScalar();
                    return count == 0;
                }
            }
        }

        private bool DeregisterDriverByID(string driverID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string deleteQuery = "DELETE FROM Driver WHERE driverID = @DriverID";

                using (OleDbCommand command = new OleDbCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);
                    int rowsAffected = command.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }
    }
}
