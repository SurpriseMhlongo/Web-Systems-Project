<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="ShipperDefault.aspx.cs" Inherits="FreightDirector.ShipperDefault" %>

<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
    <asp:Menu ID="ShipperMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Shipper/ShipperDefault.aspx" Selected="True"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Tender Load" Value="TenderLoad"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Void Load" Value="VoidLoad"></asp:MenuItem>
            <asp:MenuItem Text="Report Damage" Value="ReportDamage" NavigateUrl="~/Shipper/ReportDamage.aspx"></asp:MenuItem>
            <asp:MenuItem Text="View Load" Value="ViewLoad" NavigateUrl="~/ViewLoad.aspx"></asp:MenuItem>
            <asp:MenuItem Text="About Us" Value="Aboutus" NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Log Out" Value="Logout" NavigateUrl="~/ShipperLogin.aspx"></asp:MenuItem>
            </Items>
    </asp:Menu>
</asp:Content>

<asp:Content ID="MainHeading" ContentPlaceHolderID="MainHeading" runat="server">
    Home
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
   
          <% 
           
            string name = Convert.ToString(Session["ShipperFName"]);
            Response.Write("Welcome, " + name.ToString()+" (Shipper)");
        %>
            <p>As a Shipper, you play a crucial role in the transportation process. You can tender and manage loads, report any damage that occurs during transit, and view the status of your shipments. Your partnership ensures the safe and timely delivery of goods. Use the menu items to access the tools you need to make informed decisions and maintain a smooth supply chain.</p>
 <h3>Our Current Routes:</h3>
    <iframe src="https://www.google.com/maps/embed?pb=!1m76!1m12!1m3!1d7158220.858125824!2d18.715018711620765!3d-28.832159735296585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m61!3e0!4m5!1s0x1e7ad25f6ca9bab5%3A0xbada9b8025d8e8c2!2sPort%20Elizabeth%20Central%2C%20Gqeberha!3m2!1d-33.9619098!2d25.6095234!4m5!1s0x1e950fea3bcb63e3%3A0xe091321f86df6af2!2sNelspruit%20Road!3m2!1d-26.255389599999997!2d28.093631499999997!4m5!1s0x1e950c21e0fabb17%3A0x3af7aaba0fc6da84!2sJohannesburg%20Park%20Station!3m2!1d-26.19765!2d28.04232!4m5!1s0x1c215343cca886bd%3A0x35af56a16b1925a4!2sUpington!3m2!1d-28.395267699999998!2d21.236808399999997!4m5!1s0x1dd5c186eab513b5%3A0x8d4347748e08eb61!2sOudtshoorn!3m2!1d-33.600722499999996!2d22.202634699999997!4m5!1s0x1c38b99de75f02fb%3A0x60a9f0f905e4ea4f!2sPort%20Nolloth%2C%20Port%20Nolloth!3m2!1d-29.260301499999997!2d16.9012478!4m5!1s0x1e9b190a2f3576ab%3A0xed5f10a085517fcf!2sKimberley%20Airport!3m2!1d-28.794126!2d24.7729298!4m5!1s0x1e5fd0abee53004d%3A0x2886533cc3066b36!2sQueenstown%20Rd%2C%20Umtata%20Part%201%2C%20Mthatha!3m2!1d-31.5810316!2d28.7714084!4m5!1s0x1ef7a9c7cd824ddf%3A0xdf4136545b0fb717!2sDurban%20Central%2C%20Durban!3m2!1d-29.857405099999998!2d31.021597999999997!4m5!1s0x1ec6d829a3dab669%3A0x732ed8f0c9f3f666!2sPolokwane%20Central%2C%20Polokwane!3m2!1d-23.909992499999998!2d29.4600834!5e0!3m2!1sen!2sza!4v1695789839289!5m2!1sen!2sza" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

</asp:Content>
