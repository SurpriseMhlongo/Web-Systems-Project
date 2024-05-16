<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="RegisterDriver.aspx.cs" Inherits="FreightDirector.FleetController.RegisterDriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationContent" runat="server">
      <asp:Menu ID="RegisterDriverMenu" runat="server" CssClass="menu" StaticDisplayLevels="1" >
    <Items>
        <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/FleetController/FleetControllerDefault.aspx"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Accept Load" Value="AcceptLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Assign Load" Value="AssignLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Update Load" Value="UpdateLoad"></asp:MenuItem>
        <asp:MenuItem Selectable="False" Text="Finalize Load" Value="FinalizeLoad"></asp:MenuItem>
        <asp:MenuItem Text="View Loads" Value="ViewLoads" NavigateUrl="~/ViewLoad.aspx"></asp:MenuItem>
        <asp:MenuItem Text="New Driver" Value="NewDriver" NavigateUrl="~/FleetController/RegisterDriver.aspx" Selected="true"></asp:MenuItem>
        <asp:MenuItem Text="New Fleet" Value="NewFleet" NavigateUrl="~/FleetController/RegisterFleet.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Deregister Fleet" Value="DeregisterFleet" NavigateUrl="~/FleetController/DeregisterFleet.aspx"></asp:MenuItem>
         <asp:MenuItem Text="Deregister Driver" Value="DeregisterDriver" NavigateUrl="~/FleetController/DeregisterDriver.aspx"></asp:MenuItem>
               <asp:MenuItem Text="About Us" Value="Aboutus"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
         <asp:MenuItem Text="Log Out" Value="Logout" NavigateUrl="~/ControllerLogin.aspx"></asp:MenuItem>
        </Items>
</asp:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHeading" runat="server">
    Driver Registration
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table>
        <tr>
            <th colspan="2">
                <asp:Label ID="lblDriverDetails" runat="server" Text="Driver Details:"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblDriverFName" runat="server" Text="First Name:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtDriverFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDriverFName" runat="server" ControlToValidate="txtDriverFName" ErrorMessage="Please enter the first name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblDriverLName" runat="server" Text="Last Name:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtDriverLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDriverLName" runat="server" ControlToValidate="txtDriverLName" ErrorMessage="Please enter the last name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <th>
                <asp:Label ID="lblDriverPhone" runat="server" Text="Phone:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtDriverPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDriverPhone" runat="server" ControlToValidate="txtDriverPhone" ErrorMessage="Please enter the phone number" ForeColor="Red"></asp:RequiredFieldValidator><br />
           <asp:RegularExpressionValidator ID="revDriverPhone" runat="server" ControlToValidate="txtDriverPhone" ErrorMessage="Please enter a valid cellphone number" ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
   
                </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblDriverUsername" runat="server" Text="Username (Email):"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtDriverUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDriverUsername" runat="server" ControlToValidate="txtDriverUsername" ErrorMessage="Please enter the username (email)" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="revDriverUsername" runat="server" ControlToValidate="txtDriverUsername"
                    ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
       
        <tr>
            <th>
                <asp:Label ID="lblDriverPassword" runat="server" Text="Temporary Password:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtDriverPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDriverPassword" runat="server" ControlToValidate="txtDriverPassword" ErrorMessage="Please assign temporary password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Please confirm password" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtDriverPassword" ErrorMessage="Passwords must match" ForeColor="Red"></asp:CompareValidator>
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
