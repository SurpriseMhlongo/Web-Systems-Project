<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="UpdateDetails.aspx.cs" Inherits="FreightDirector.Driver.UpdateDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationContent" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainHeading" runat="server">
    Update Personal Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <p>Please note: <br />Username and FirstName can only be changed by your registration officer.<br />Re-enter all details you wish to keep.</p>
    <table>
        <tr>
            <th>
                <asp:Label ID="lblDriverID" runat="server" Text="Driver ID:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtDriverID" runat="server" Text="" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" Text="" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblLastName" runat="server" Text="New Last Name:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" 
                    ErrorMessage="Enter existing/ new LastName" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblPhoneNumber" runat="server" Text="New Phone Number:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" 
                    ErrorMessage="Enter old/ new Phone Number" ForeColor="Red"></asp:RequiredFieldValidator><br />
                          <asp:RegularExpressionValidator ID="revDriverPhone" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please enter a valid cellphone number" ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblPwd" runat="server" Text="New Password:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" 
                    ErrorMessage="Enter old or new Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblConfirmPwd" runat="server" Text="Confirm Password:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" 
                    ErrorMessage="Please Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:CompareValidator ID="cvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" 
                    ControlToCompare="txtPwd" ErrorMessage="Passwords do not match." ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblEmail" runat="server" Text="Username (Email):"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Text="" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblCurrLoad" runat="server" Text="Assigned Load:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtCurrLoad" runat="server" Text="" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="btnUpdateDetails" runat="server" Text="Update Details" OnClick="btnUpdateDetails_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                <asp:Label ID="lblUpdateMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
