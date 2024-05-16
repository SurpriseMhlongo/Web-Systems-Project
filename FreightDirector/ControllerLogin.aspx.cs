using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;

namespace FreightDirector
{
    public partial class ControllerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtcontrollerUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["FreightDirector"].ConnectionString;

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                using (OleDbCommand command = new OleDbCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;

                    command.CommandText = "SELECT * FROM Fleet_Controller WHERE controllerUsername = @Username AND controllerPwd = @Password";

                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();

                    using (OleDbDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["ControllerID"] = Convert.ToInt32(reader["controllerID"]);
                            //session for greeting
                            Session["ControllerFName"] = Convert.ToString(reader["controllerFName"]);
                            Response.Redirect("~/FleetController/FleetControllerDefault.aspx");
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
