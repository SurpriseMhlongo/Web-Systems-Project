using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreightDirector
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.UrlReferrer != null)
                {
                    lnkPreviousPage.NavigateUrl = Request.UrlReferrer.ToString();
                }
                else
                {
                    lnkPreviousPage.Enabled = false;
                    lnkPreviousPage.Text = "No Previous Page";
                }
            }
        }

    }
}