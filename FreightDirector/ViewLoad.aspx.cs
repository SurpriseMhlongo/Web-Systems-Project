using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace FreightDirector
{
    public partial class ViewLoads : System.Web.UI.Page
    {
        private string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|FreightDirector.accdb;";



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView();

                // Determine the user's role based on session variables
                string userRole = GetUserRole();

                // Disable menu items based on the user's role
                DisableMenuItems(userRole);

                // Wire up the ItemDataBound event handler
                lvLoads.ItemDataBound += lvLoads_ItemDataBound;
            }
        }


        private void BindListView()
        {
            string filterFleetID = txtFilterFleetID.Text.Trim();
            string filterCollection = txtFilterCollection.Text.Trim();
            string filterDropOffLocation = txtFilterDropOffLocation.Text.Trim();

            // Check and update load statuses
            UpdateLoadStatus();

            string selectQuery = "SELECT * FROM Load WHERE 1=1";

            if (!string.IsNullOrEmpty(filterFleetID))
                selectQuery += " AND fleetID = @fleetID";

            if (!string.IsNullOrEmpty(filterCollection))
                selectQuery += " AND collectionLocation LIKE '%' + @collectionLocation + '%'";

            if (!string.IsNullOrEmpty(filterDropOffLocation))
                selectQuery += " AND dropOffLocation LIKE '%' + @dropOffLocation + '%'";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                OleDbCommand command = new OleDbCommand(selectQuery, connection);

                // Set the parameters for the query
                if (!string.IsNullOrEmpty(filterFleetID))
                    command.Parameters.AddWithValue("@fleetID", int.Parse(filterFleetID));

                if (!string.IsNullOrEmpty(filterCollection))
                    command.Parameters.AddWithValue("@collectionLocation", filterCollection);

                if (!string.IsNullOrEmpty(filterDropOffLocation))
                    command.Parameters.AddWithValue("@dropOffLocation", filterDropOffLocation);

                connection.Open();
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                lvLoads.DataSource = dt;
                lvLoads.DataBind();
            }
        }

        private void UpdateLoadStatus()
        {
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();
                string updateQuery = "UPDATE Load SET loadStatus = 'OVERDUE' WHERE dropOffDate < @currentDate";
                using (OleDbCommand updateCommand = new OleDbCommand(updateQuery, connection))
                {
                    updateCommand.Parameters.AddWithValue("@currentDate", DateTime.Now.Date);
                    updateCommand.ExecuteNonQuery();
                }

                // Remove completed loads
                string deleteQuery = "DELETE FROM Load WHERE loadStatus = 'complete'";
                using (OleDbCommand deleteCommand = new OleDbCommand(deleteQuery, connection))
                {
                    deleteCommand.ExecuteNonQuery();
                }
            }
        }


        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BindListView();
            }
        }



        protected void lvLoads_Sorting(object sender, ListViewSortEventArgs e)
        {
            if (e.SortExpression == "loadID")
            {
                // Sort by Load ID
                dsLoads.SelectCommand = "SELECT * FROM Load ORDER BY loadID";
            }
            else if (e.SortExpression == "driverID")
            {
                // Sort by Driver ID
                dsLoads.SelectCommand = "SELECT * FROM Load ORDER BY driverID";
            }
            else if (e.SortExpression == "loadStatus")
            {
                // Sort by Load Status
                dsLoads.SelectCommand = "SELECT * FROM Load ORDER BY loadStatus";
            }
        }

        protected void lvLoads_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                // Find the label control that displays the loadStatus in the ListView
                Label statusLabel = (Label)e.Item.FindControl("StatusLabel");

                if (statusLabel != null)
                {
                    // Check if the loadStatus is "OVERDUE" and apply CSS style for red font
                    if (statusLabel.Text == "OVERDUE")
                    {
                        statusLabel.CssClass = "overdue-status";
                    }
                }
            }
        }

        private string GetUserRole()
        {
            if (Session["ControllerID"] != null)
            {
                return "Controller"; // User is a Controller
            }
            else if (Session["ShipperID"] != null)
            {
                return "Shipper"; // User is a Shipper
            }
            else if (Session["DriverID"] != null)
            {
                return "Driver"; // User is a Driver
            }
            else
            {
                // If none of the session variables are set, the user doesn't have a recognized role.
                // In this case, you can return a value that represents an unauthenticated or guest user.
                return "Guest"; // User is not logged in or doesn't have a recognized role
            }
        }


        private void DisableMenuItems(string userRole)
        {
            switch (userRole)
            {
                case "Controller":
                    // Enable Controller menu items and disable others
                    DisableMenuItemsForRole(ShipperViewMenu);
                    DisableMenuItemsForRole(DriverViewMenu);
                    EnableMenuItemsForRole(ControllerViewMenu); // Enable Controller menu
                    break;
                case "Shipper":
                    // Enable Shipper menu items and disable others
                    DisableMenuItemsForRole(ControllerViewMenu);
                    DisableMenuItemsForRole(DriverViewMenu);
                    EnableMenuItemsForRole(ShipperViewMenu); // Enable Shipper menu
                    break;
                case "Driver":
                    // Enable Driver menu items and disable others
                    DisableMenuItemsForRole(ControllerViewMenu);
                    DisableMenuItemsForRole(ShipperViewMenu);
                    EnableMenuItemsForRole(DriverViewMenu); // Enable Driver menu
                    break;
                default:
                    // If the user doesn't have a recognized role, disable all menu items
                    DisableAllMenuItems();
                    break;
            }
        }

        private void DisableAllMenuItems()
        {
            DisableMenuItemsForRole(ControllerViewMenu);
            DisableMenuItemsForRole(ShipperViewMenu);
            DisableMenuItemsForRole(DriverViewMenu);
        }

        private void EnableMenuItemsForRole(Menu menu)
        {
            foreach (MenuItem item in menu.Items)
            {
                item.Enabled = true; // Enable all items in the menu
            }
        }

        private void DisableMenuItemsForRole(Menu menu)
        {
            foreach (MenuItem item in menu.Items)
            {
                item.Enabled = false; // Disable all items in the menu
            }
        }

    }
}

