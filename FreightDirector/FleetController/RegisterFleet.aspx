<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="RegisterFleet.aspx.cs" Inherits="FreightDirector.RegisterFleet" %>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
        <asp:Menu ID="RegisterFleetMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
    <Items>
        <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/FleetController/FleetControllerDefault.aspx"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Accept Load" Value="AcceptLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Assign Load" Value="AssignLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Update Load" Value="UpdateLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Finalize Load" Value="FinalizeLoad"></asp:MenuItem>
        <asp:MenuItem Text="View Loads" Value="ViewLoads" NavigateUrl="~/ViewLoad.aspx"></asp:MenuItem>
        <asp:MenuItem Text="New Driver" Value="NewDriver" NavigateUrl="~/FleetController/RegisterDriver.aspx"></asp:MenuItem>
        <asp:MenuItem Text="New Fleet" Value="NewFleet" NavigateUrl="~/FleetController/RegisterFleet.aspx" Selected="true"></asp:MenuItem>
         <asp:MenuItem Text="Deregister Fleet" Value="DeregisterFleet" NavigateUrl="~/FleetController/DeregisterFleet.aspx"></asp:MenuItem>
         <asp:MenuItem Text="Deregister Driver" Value="DeregisterDriver" NavigateUrl="~/FleetController/DeregisterDriver.aspx"></asp:MenuItem>
                <asp:MenuItem Text="About Us" Value="Aboutus"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
         <asp:MenuItem Text="Log Out" Value="Logout" NavigateUrl="~/ControllerLogin.aspx"></asp:MenuItem>
    </Items>
</asp:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainHeading" runat="server">
    Vehicle Registration
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
            <asp:Label ID="lblFleetContact" runat="server" Text="Contact number:"></asp:Label>
        
        </th>
         <td>
        <asp:TextBox ID="txtFleetContact" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFleetContact" runat="server" ControlToValidate="txtFleetContact" ErrorMessage="Please enter the fleet contact" ForeColor="Red"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="revFleetContact" runat="server" ControlToValidate="txtFleetContact" ErrorMessage="Please enter a valid cellphone number" ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
    </td>
    </tr>
    <tr>
        <th>
            <asp:Label ID="lblFleetRegistration" runat="server" Text="Main Registration:"></asp:Label>
        </th>
        <td>
            <asp:TextBox ID="txtFleetRegistration" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFleetRegistration" runat="server" ControlToValidate="txtFleetRegistration" ErrorMessage="Please enter the fleet registration" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
       <tr>
           <th>
               <asp:Label ID="lblVmakemodel" runat="server" Text="Vehicle Make and Model:"></asp:Label>
           </th>
           <td>
              <asp:DropDownList ID="ddlMakeModel" runat="server">
    <asp:ListItem Text="Select Make and Model" Value="" />
   
</asp:DropDownList>

               <asp:requiredfieldvalidator ID="rfvmakemodel" runat="server" ControlToValidate="ddlMakeModel" ErrorMessage="Please enter vehicle speficications" ForeColor="Red"></asp:requiredfieldvalidator>
           </td>
       </tr>
    <tr>
        <th>
            <asp:Label ID="lblTrailer1Registration" runat="server" Text="Trailer 1 Registration:"></asp:Label>
        </th>
        <td>
            <asp:TextBox ID="txtTrailer1Registration" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTrailer1Registration" runat="server" ControlToValidate="txtTrailer1Registration" ErrorMessage="Please enter the trailer 1 registration"  ForeColor="red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            <asp:Label ID="lblTrailer2Registration" runat="server" Text="Trailer 2 Registration:"></asp:Label>
        </th>
        <td>
            <asp:TextBox ID="txtTrailer2Registration" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
         <td>
                <asp:Button ID="btnClearForm" runat="server" Text="Clear Form" OnClick="btnClearForm_Click" />
            </td>
        <td>
            <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" />
        </td>
        <td>
            <label ID="lblFeedback" runat="server" Text=""></label>
        </td>
    </tr>
</table>


</asp:Content>
