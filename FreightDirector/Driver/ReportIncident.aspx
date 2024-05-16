<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="ReportIncident.aspx.cs" Inherits="FreightDirector.ReportIncident" %>

<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="ReportIncidentMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Driver/DriverDefault.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Update Load Status" Value="UpdateLoadStatus"></asp:MenuItem>
            <asp:MenuItem Text="Update Personal Details" Value="UpdatePersonalDetails" NavigateUrl="~/Driver/UpdateDetails.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Close Load" Value="CloseLoad"></asp:MenuItem>
            <asp:MenuItem Text="Report Incident" Value="ReportIncident" NavigateUrl="~/Driver/ReportIncident.aspx" Selected="true"></asp:MenuItem>
            <asp:MenuItem Text="View Loads" Value="ViewLoads" NavigateUrl="~/ViewLoad.aspx"></asp:MenuItem>
                 <asp:MenuItem Text="About Us" Value="Aboutus"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Log Out" Value="Logout" NavigateUrl="~/DriverLogin.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainHeading" runat="server">
    Incident Report
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <table>
        <tr>
            <th colspan="2">
                <asp:Label ID="lblIncidentDetails" runat="server" Text="Incident Details:"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblDriverName" runat="server" Text="Reporting as:"></asp:Label>
            </th>
            <td>
                <asp:Label ID="lblDriverFirstName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                <asp:label id="lblDetails" runat="server" text="Load Details:"></asp:label>
            </th>
            <td>
                <asp:Label ID="lblLoadDetails" runat="server" Text=""></asp:Label>
                 <% 
                     //load details
                     
                     string departure = Convert.ToString(Session["LoadDeparture"]);
                     string destination = Convert.ToString(Session["LoadDestination"]);
                     string goods = Convert.ToString(Session["GoodsDescription"]);
                     Response.Write("<br>Route: "+departure.ToString()+" to "+ destination.ToString()+"<br>Goods: "+goods.ToString());
        %>
            </td>
        </tr>
        <tr>
            <th>
                <%--reference code is Inc-IncidenceID--%>
                <asp:Label ID="lblIncidentIDLabel" runat="server" Text="Reference Code:"></asp:Label>
            </th>
            <td>
                <asp:Label ID="lblIncidentID" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblIncidentDescription" runat="server" Text="Description:"></asp:Label>
            </th>
            <td>
                <asp:DropDownList ID="ddlIncidentDescription" runat="server">
                    <asp:ListItem Value="Fire">Fire</asp:ListItem>
                    <asp:ListItem Value="Collision">Collision</asp:ListItem>
                    <asp:ListItem Value="Contamination">Contamination</asp:ListItem>
                    <asp:ListItem Value="Spoilage">Spoilage</asp:ListItem>
                    <asp:ListItem Value="Breakage">Breakage</asp:ListItem>
                    <asp:ListItem Value="Theft">Theft</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblIncidentComment" runat="server" Text="Comment:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtIncidentComment" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Button ID="btnRegisterIncident" runat="server" Text="Report" OnClick="btnReportIncident_Click" />
            </th>
            <td>
                
                <asp:Label ID="lblIncidentMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
