using System;
using System.Data.OleDb;
using System.Web.UI;

namespace FreightDirector
{
    public partial class DeregisterFleet : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnFleetSubmit_Click(object sender, EventArgs e)
        {
            string fleetID = txtFleetID.Text.Trim();

            if (!string.IsNullOrEmpty(fleetID))
            {
                try
                {
                    if (DeregisterFleetByID(fleetID))
                    {
                        txtFleetID.Text = "";
                        lblFleetMessage.Text = "Fleet deregistered successfully.";
                        lblFleetMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        txtFleetID.Text = "";
                        lblFleetMessage.Text = "Fleet ID not found";
                          lblFleetMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (OleDbException ex)
                {
                    if (ex.Message.Contains("foreign key constraint"))
                    {
                        lblFleetMessage.Text = "You cannot deregister a fleet currently in use";
                        lblFleetMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblFleetMessage.Text = "You cannot deregister a fleet currently in use";
                        lblFleetMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else
            {
                lblFleetMessage.Text = "Please enter a valid Fleet ID.";
                lblFleetMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool DeregisterFleetByID(string fleetID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "DELETE FROM Fleet WHERE fleetID = @FleetID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FleetID", fleetID);

                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }
    }
}
