<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="ReportDamage.aspx.cs" Inherits="FreightDirector.ReportDamage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="ReportDamageMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Shipper Home" Value="Home" NavigateUrl="~/Shipper/ShipperDefault.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Tender Load" Value="TenderLoad"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Void Load" Value="VoidLoad"></asp:MenuItem>
            <asp:MenuItem Text="Report Damage" Value="ReportDamage" NavigateUrl="~/Shipper/ReportDamage.aspx" Selected="true"></asp:MenuItem>
            <asp:MenuItem Text="View Load" Value="ViewLoad" NavigateUrl="~/ViewLoad.aspx"></asp:MenuItem>
            <asp:MenuItem Text="About Us" Value="Aboutus" NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
         <asp:MenuItem Text="Log Out" Value="Logout" NavigateUrl="~/ShipperLogin.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainHeading" runat="server">
    Damage Report
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <table>
        <tr>
            <th colspan="2">
                <asp:Label ID="lblDamageReport" runat="server" Text="Damage Report"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblReportingAS" runat="server" Text="Reporting as:"></asp:Label>
            </th>
            <td>
                <asp:Label ID="lblShipperName" runat="server" Text=""></asp:Label>
                 
            </td>
        </tr>
         <tr>
            <th>
                <%--reference code is Dam-DamageID--%>
                <asp:Label ID="lblDamageIDLabel" runat="server" Text="Reference Code:"></asp:Label>

            </th>
            <td>
                <asp:Label ID="lblDamageID" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
    <th>
        <asp:Label ID="lblLoadIDLabel" runat="server" Text="Load Details:"></asp:Label>
    </th>
    <td>
        <asp:Label ID="lblLoadID" runat="server" Text=""></asp:Label>
        
          <% 
           //more load details
            string departure = Convert.ToString(Session["LoadDeparture"]);
              string destination = Convert.ToString(Session["LoadDestination"]);
              string goods = Convert.ToString(Session["GoodsDescription"]);
            Response.Write("<br>Route: "+departure.ToString()+" to "+ destination.ToString()+"<br>Goods: "+goods.ToString());
        %>
    </td>
</tr>

        <tr>
            <th>
                <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            </th>
            <td>
                <asp:DropDownList ID="ddlDescription" runat="server">
                    <asp:ListItem Text="Incomplete"></asp:ListItem>
                    <asp:ListItem Text="Late"></asp:ListItem>
                    <asp:ListItem Text="Does not match specs"></asp:ListItem>
                    <asp:ListItem Text="Other"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="Select Description" ControlToValidate="ddlDescription" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblComment" runat="server" Text="Comment:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="btnReportDamage" runat="server" Text="Report" OnClick="btnReportDamage_Click" />
                <asp:Label ID="lblDamageMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
