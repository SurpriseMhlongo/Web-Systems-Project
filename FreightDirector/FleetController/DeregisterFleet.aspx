<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="DeregisterFleet.aspx.cs" Inherits="FreightDirector.DeregisterFleet" %>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="DeregisterFleetMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
    <Items>
        <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/FleetController/FleetControllerDefault.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Deregister Fleet" Value="DeregisterFleet" NavigateUrl="~/FleetController/DeregisterFleet.aspx" Selected="true"></asp:MenuItem>
        <asp:MenuItem Text="Deregister Driver" Value="DeregisterDriver" NavigateUrl="~/FleetController/DeregisterDriver.aspx"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Accept Load" Value="AcceptLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Assign Load" Value="AssignLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Update Load" Value="UpdateLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Finalize Load" Value="FinalizeLoad"></asp:MenuItem>
        <asp:MenuItem Text="View Loads" Value="ViewLoads" NavigateUrl="~/ViewLoad.aspx"></asp:MenuItem>
        <asp:MenuItem Text="New Driver" Value="NewDriver" NavigateUrl="~/FleetController/RegisterDriver.aspx"></asp:MenuItem>
        <asp:MenuItem Text="New Fleet" Value="NewFleet" NavigateUrl="~/FleetController/RegisterFleet.aspx"></asp:MenuItem>
               <asp:MenuItem Text="About Us" Value="Aboutus"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
         <asp:MenuItem Text="Log Out" Value="Logout" NavigateUrl="~/ControllerLogin.aspx"></asp:MenuItem>
        </Items>
</asp:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainHeading" runat="server">
    Fleet Deregistration
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <table>
    <tr>
        <th colspan="2">
            <asp:Label ID="lblFleetDetails" runat="server" Text="Fleet Details:"></asp:Label>
        </th>
    </tr>
    <tr>
        <th>
            <asp:Label ID="lblFleetID" runat="server" Text="Fleet ID:"></asp:Label>
        </th>
        <td>
            <asp:TextBox ID="txtFleetID" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFleetID" runat="server" ErrorMessage="Enter Fleet ID" ControlToValidate="txtFleetID" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
       
    <tr>
        <td colspan="2">
         
            <asp:Button ID="btnFleetSubmit" runat="server" Text="Submit" OnClick="btnFleetSubmit_Click" OnClientClick="return confirm('Are you sure you want to deregister this fleet?');" />

            <asp:Label ID="lblFleetMessage" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
