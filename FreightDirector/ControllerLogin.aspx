<%@ Page Title="Controller Login" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="ControllerLogin.aspx.cs" Inherits="FreightDirector.ControllerLogin" %>

<asp:Content ID="NavigationContent" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="ControllerLoginMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Login as Driver" Value="DriverLogin" NavigateUrl="~/DriverLogin.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Login as Fleet Controller" Value="ControllerLogin" NavigateUrl="~/ControllerLogin.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Login as Shipper" Value="ShipperLogin" NavigateUrl="~/ShipperLogin.aspx"></asp:MenuItem>
            <asp:MenuItem Text="About Us" Value="Aboutus"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>

<asp:Content ID="MainHeading" ContentPlaceHolderID="MainHeading" runat="server">
    Controller Login
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
    <table>
        
        <tr>
            <th>
                <asp:Label ID="lblLoginDetails" runat="server" Text="Login Details:"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblcontrollerUsername" runat="server" Text="Username (Email):"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtcontrollerUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtcontrollerUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcontrollerUsername"
                 ErrorMessage="Enter a valid email address" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
               
                
            </td>
        </tr>
        <tr>
            <th>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </th>
            <td>
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
