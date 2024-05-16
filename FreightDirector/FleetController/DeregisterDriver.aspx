<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="DeregisterDriver.aspx.cs" Inherits="FreightDirector.DeregisterDriver" %>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="DeregisterDriverMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
    <Items>
        <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/FleetController/FleetControllerDefault.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Deregister Driver" Value="DeregisterDriver" NavigateUrl="~/FleetController/DeregisterDriver.aspx" Selected="true"></asp:MenuItem>
         <asp:MenuItem Text="Deregister Fleet" Value="DeregisterFleet" NavigateUrl="~/FleetController/DeregisterFleet.aspx"></asp:MenuItem>
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
    Driver Deregistration
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
   
<table>
    <tr>
        <th colspan="2">
            <asp:Label ID="lblDriverDetails" runat="server" Text="Driver Details:"></asp:Label>
        </th>
    </tr>
    <tr>
        <th>
            <asp:Label ID="lblDriverID" runat="server" Text="Driver ID:"></asp:Label>
        </th>
        <td>
            <asp:TextBox ID="txtDriverID" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDriverID" runat="server" ErrorMessage="Enter Driver ID" ControlToValidate="txtDriverID"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnDriverSubmit" runat="server" Text="Submit" OnClick="btnDriverSubmit_Click" OnClientClick="return confirm('Are you sure you want to deregister this driver?');" />
            <asp:Label ID="lblDriverMessage" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>




</asp:Content>
