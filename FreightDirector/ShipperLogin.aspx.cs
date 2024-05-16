using System;
using System.Configuration;
using System.Data.OleDb;
using System.Data;

namespace FreightDirector
{
    public partial class ShipperLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["FreightDirector"].ConnectionString;

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                using (OleDbCommand command = new OleDbCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;

                    command.CommandText = "SELECT * FROM Shipper WHERE shipperUsername = @Username AND shipperPwd = @Password";

                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();

                    using (OleDbDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        { //session for detail display on page load
                            Session["ShipperID"] = Convert.ToInt32(reader["shipperID"]);
                            //session for greeting line
                            Session["ShipperFName"] = Convert.ToString(reader["shipperFName"]);
                            Response.Redirect("~/Shipper/ShipperDefault.aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid Username or Password";
                            lblError.Visible = true;
                        }
                    }
                }
            }
        }
    }
}
