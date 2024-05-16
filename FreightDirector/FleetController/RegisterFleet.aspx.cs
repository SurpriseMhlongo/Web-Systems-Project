using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;

namespace FreightDirector
{
    public partial class RegisterFleet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["FreightDirector"].ConnectionString;
                using (OleDbConnection connection = new OleDbConnection(connectionString))
                {
                    connection.Open();

                    string lookupQuery = "SELECT DISTINCT vehicleMakeModel FROM Fleet";
                    using (OleDbCommand lookupCommand = new OleDbCommand(lookupQuery, connection))
                    {
                        using (OleDbDataReader reader = lookupCommand.ExecuteReader())
                        {
                            ddlMakeModel.DataSource = reader;
                            ddlMakeModel.DataTextField = "vehicleMakeModel";
                            ddlMakeModel.DataValueField = "vehicleMakeModel";
                            ddlMakeModel.DataBind();
                        }
                    }

                    connection.Close();
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the values entered by the user
            string selectedMakeModel = ddlMakeModel.SelectedValue;
            string fleetContact = txtFleetContact.Text;
            string fleetRegistration = txtFleetRegistration.Text;
            string trailer1Registration = txtTrailer1Registration.Text;
            string trailer2Registration = txtTrailer2Registration.Text;

            // Check if fleet registration and trailer registrations already exist
            string connectionString = ConfigurationManager.ConnectionStrings["FreightDirector"].ConnectionString;
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                // Check fleet registration
                string checkFleetQuery = "SELECT COUNT(*) FROM Fleet WHERE fleetRegistration = @Registration";
                using (OleDbCommand checkFleetCommand = new OleDbCommand(checkFleetQuery, connection))
                {
                    checkFleetCommand.Parameters.AddWithValue("@Registration", fleetRegistration);
                    int existingFleetCount = (int)checkFleetCommand.ExecuteScalar();
                    if (existingFleetCount > 0)
                    {
                        lblFeedback.InnerText = "Fleet registration already exists.";
                        connection.Close();
                        return;
                    }
                }

                // Check trailer 1 registration
                string checkTrailer1Query = "SELECT COUNT(*) FROM Fleet WHERE trailer1Registration = @Trailer1";
                using (OleDbCommand checkTrailer1Command = new OleDbCommand(checkTrailer1Query, connection))
                {
                    checkTrailer1Command.Parameters.AddWithValue("@Trailer1", trailer1Registration);
                    int existingTrailer1Count = (int)checkTrailer1Command.ExecuteScalar();
                    if (existingTrailer1Count > 0)
                    {
                        lblFeedback.InnerText = "Trailer 1 registration already exists.";
                        connection.Close();
                        return;
                    }
                }

                // Check if trailer2Registration is not empty before checking for duplicates in the database as it is not a req field
                if (!string.IsNullOrEmpty(trailer2Registration))
                {
                    // Check trailer 2 registration
                    string checkTrailer2Query = "SELECT COUNT(*) FROM Fleet WHERE trailer2Registration = @Trailer2";
                    using (OleDbCommand checkTrailer2Command = new OleDbCommand(checkTrailer2Query, connection))
                    {
                        checkTrailer2Command.Parameters.AddWithValue("@Trailer2", trailer2Registration);
                        int existingTrailer2Count = (int)checkTrailer2Command.ExecuteScalar();
                        if (existingTrailer2Count > 0)
                        {
                            lblFeedback.InnerText = "Trailer 2 registration already exists.";
                            connection.Close();
                            return;
                        }
                    }
                }

                // If no duplicate registrations are found, insert the fleet data into the database
                string insertQuery = "INSERT INTO Fleet (fleetContact, vehicleMakeModel, fleetRegistration, trailer1Registration, trailer2Registration) " +
                                     "VALUES (@Contact, @MakeModel, @Registration, @Trailer1, @Trailer2)";

                using (OleDbCommand command = new OleDbCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@Contact", fleetContact);
                    command.Parameters.AddWithValue("@MakeModel", selectedMakeModel);
                    command.Parameters.AddWithValue("@Registration", fleetRegistration);
                    command.Parameters.AddWithValue("@Trailer1", trailer1Registration);
                    command.Parameters.AddWithValue("@Trailer2", trailer2Registration);

                    command.ExecuteNonQuery();
                }

                connection.Close();
            }

            // Clear the input fields
            ddlMakeModel.SelectedIndex = 0;
            txtFleetContact.Text = string.Empty;
            txtFleetRegistration.Text = string.Empty;
            txtTrailer1Registration.Text = string.Empty;
            txtTrailer2Registration.Text = string.Empty;

            // Display a success message or redirect to another page
            lblFeedback.InnerText = "Fleet registered successfully!";
           
        }
        protected void btnClearForm_Click(object sender, EventArgs e)
        {
            ClearRegistrationForm();
        }

        private void ClearRegistrationForm()
        {
            txtFleetContact.Text = string.Empty;
            txtFleetRegistration.Text = string.Empty;
            txtTrailer1Registration.Text = string.Empty;
            txtTrailer2Registration.Text = string.Empty;
            ddlMakeModel.SelectedIndex = 0;

        }
    }
}
