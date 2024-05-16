using System;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;

namespace FreightDirector
{
    public partial class ReportIncident : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            // Common code for both initial page load and postbacks.
            if (Session["DriverID"] != null && Session["DriverID"] is int driverID)
            {
                int loadID = GetDriverLoadID(driverID); // Retrieve loadID from Driver table
                string firstName = GetDriverFirstName(driverID);
                bool hasCurrentLoad = HasDriverCurrentLoad(driverID);

                if (!string.IsNullOrEmpty(firstName))
                {
                    lblDriverFirstName.Text = firstName;
                }

                btnRegisterIncident.Enabled = hasCurrentLoad;
                if (!hasCurrentLoad)
                {
                    lblIncidentMessage.Text = "You must have a load assigned to report an incident.";
                    lblIncidentMessage.ForeColor = System.Drawing.Color.Red;
                    btnRegisterIncident.Enabled = false;
                }

                // Display auto-generated Incident ID on the form
                
                lblIncidentID.Text = "Inc-"+GetNextIncidentID().ToString();
                // Retrieve LoadDeparture, LoadDestination, and goods in transit from the database
                string departure = GetLoadDeparture(loadID);
                string destination = GetLoadDestination(loadID);
                string goods = GetGoodsInTransit(loadID);

                // Set the session variables
                Session["LoadDeparture"] = departure;
                Session["LoadDestination"] = destination;
                Session["GoodsDescription"] = goods;
            }
        }

        protected void btnReportIncident_Click(object sender, EventArgs e)
        {
            if (Session["DriverID"] != null && Session["DriverID"] is int driverID)
            {
                int loadID = GetDriverLoadID(driverID);

                if (!HasDriverCurrentLoad(driverID))
                {
                    lblIncidentMessage.Text = "You must have a load assigned to report an incident.";
                    lblIncidentMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                string description = ddlIncidentDescription.SelectedValue;
                string comment = txtIncidentComment.Text;

                string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
                using (OleDbConnection connection = new OleDbConnection(connectionString))
                {
                    connection.Open();

                    int incidentID = GetNextIncidentID();

                    string query = "INSERT INTO Incident (incidentID, loadID, driverID, description, comment) VALUES (@IncidentID, @LoadID, @DriverID, @Description, @Comment)";
                    using (OleDbCommand command = new OleDbCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@IncidentID", incidentID);
                        command.Parameters.AddWithValue("@LoadID", loadID);
                        command.Parameters.AddWithValue("@DriverID", driverID);

                        if (string.IsNullOrEmpty(description))
                        {
                            command.Parameters.AddWithValue("@Description", DBNull.Value);
                        }
                        else
                        {
                            command.Parameters.AddWithValue("@Description", description);
                        }

                        if (string.IsNullOrEmpty(comment))
                        {
                            command.Parameters.AddWithValue("@Comment", DBNull.Value);
                        }
                        else
                        {
                            command.Parameters.AddWithValue("@Comment", comment);
                        }

                        command.ExecuteNonQuery();
                    }
                }

                // Clear the comment box after successful submission
                txtIncidentComment.Text = "";

                lblIncidentMessage.Text = "Received, Our response team will call and locate you momentarily." +
    "Please contact 112 for emergency." +
    "Police 10111" +
    "Ambulance/Fire 10177";
                lblIncidentMessage.ForeColor = System.Drawing.Color.Green;

            }
        }


        private int GetDriverLoadID(int driverID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            int loadID = -1; // Default value in case loadID is not found

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT currentLoad FROM Driver WHERE driverID = @DriverID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        loadID = Convert.ToInt32(result);
                    }
                }
            }

            return loadID;
        }

        private string GetDriverFirstName(int driverID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            string firstName = "";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT driverFName FROM Driver WHERE driverID = @DriverID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {



                    command.Parameters.AddWithValue("@DriverID", driverID);
                    using (OleDbDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            firstName = reader["driverFName"].ToString();
                        }
                    }
                }
            }

            return firstName;
        }

        private bool HasDriverCurrentLoad(int driverID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT currentLoad FROM Driver WHERE driverID = @DriverID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);
                    object result = command.ExecuteScalar();
                    return result != null && result != DBNull.Value;
                }
            }
        }

        private int GetNextIncidentID()
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT MAX(incidentID) FROM Incident";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToInt32(result) + 1;
                    }
                    else
                    {
                        return 1;
                    }
                }
            }
        }
        private string GetLoadDeparture(int loadID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            string departure = "";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT collectionLocation FROM Load WHERE loadID = @LoadID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@LoadID", loadID);
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        departure = result.ToString();
                    }
                }
            }

            return departure;
        }

        private string GetLoadDestination(int loadID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            string destination = "";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT dropOffLocation FROM Load WHERE loadID = @LoadID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@LoadID", loadID);
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        destination = result.ToString();
                    }
                }
            }

            return destination;
        }

        private string GetGoodsInTransit(int loadID)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";
            string goodsDescription = "";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT goodsDescription FROM Load WHERE loadID = @LoadID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@LoadID", loadID);
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        goodsDescription = result.ToString();
                    }
                }
            }

            return goodsDescription;
        }
    }
}