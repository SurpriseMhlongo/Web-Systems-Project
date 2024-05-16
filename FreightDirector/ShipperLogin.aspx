<%@ Page Title="Login" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="ShipperLogin.aspx.cs" Inherits="FreightDirector.ShipperLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="ShipperLoginMainMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Login as Driver" Value="DriverLogin" NavigateUrl="~/DriverLogin.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Login as Fleet Controller" Value="ControllerLogin" NavigateUrl="~/ControllerLogin.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Login as Shipper" Value="ShipperLogin" NavigateUrl="~/ShipperLogin.aspx"></asp:MenuItem>
            <asp:MenuItem Text="About Us" Value="About"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHeading" runat="server">
    Shipper Login
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table>
        <tr>
            <th colspan="2">
                <asp:Label ID="lblLoginDetails" runat="server" Text="Login Details:"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblUsername" runat="server" Text="Username (Email):"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUsername"
                    ErrorMessage="Enter a valid email address" ForeColor="Red" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
