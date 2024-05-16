<%@ Page Title="" Language="C#" MasterPageFile="~/FreightDirector.Master" AutoEventWireup="true" CodeBehind="ViewLoad.aspx.cs" Inherits="FreightDirector.ViewLoads" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content2" ContentPlaceHolderID="NavigationContent" runat="server">
    <!-- Navigation Menu for Controller -->
    
    Fleet Controller 
    <hr />
    <asp:Menu ID="ControllerViewMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Controller Home" Value="Home" NavigateUrl="~/FleetController/FleetControllerDefault.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Deregister Driver" Value="DeregisterDriver" NavigateUrl="~/FleetController/DeregisterDriver.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Deregister Fleet" Value="DeregisterFleet" NavigateUrl="~/FleetController/DeregisterFleet.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Accept Load" Value="AcceptLoad"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Assign Load" Value="AssignLoad"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Update Load" Value="UpdateLoad"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Finalize Load" Value="FinalizeLoad"></asp:MenuItem>
            <asp:MenuItem Text="New Driver" Value="NewDriver" NavigateUrl="~/FleetController/RegisterDriver.aspx"></asp:MenuItem>
            <asp:MenuItem Text="New Fleet" Value="NewFleet" NavigateUrl="~/FleetController/RegisterFleet.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="About FD" Value="Aboutus"  NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>

        </Items>
    </asp:Menu>
    Shipper
    <hr />

    <!-- Navigation Menu for Shipper -->
    
    <asp:Menu ID="ShipperViewMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Shipper Home" Value="Home" NavigateUrl="~/Shipper/ShipperDefault.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Tender Load" Value="TenderLoad"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Void Load" Value="VoidLoad"></asp:MenuItem>
            <asp:MenuItem Text="Report Damage" Value="ReportDamage" NavigateUrl="~/Shipper/ReportDamage.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="About FD" Value="AboutFD"></asp:MenuItem>
        </Items>
    </asp:Menu>
    Driver
    <hr />

    <!-- Navigation Menu for Driver -->
    <asp:Menu ID="DriverViewMenu" runat="server" CssClass="menu" StaticDisplayLevels="1">
        <Items>
            <asp:MenuItem Text="Driver Home" Value="Home" NavigateUrl="~/Driver/DriverDefault.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Update Load Status" Value="UpdateLoadStatus"></asp:MenuItem>
            <asp:MenuItem Text="Update Personal Details" Value="UpdatePersonalDetails" NavigateUrl="~/Driver/UpdateDetails.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="Close Load" Value="CloseLoad"></asp:MenuItem>
            <asp:MenuItem Text="Report Incident" Value="ReportIncident" NavigateUrl="~/Driver/ReportIncident.aspx"></asp:MenuItem>
            <asp:MenuItem Selectable="False" Text="About FD" Value="AboutFD"></asp:MenuItem>
          
        </Items>
    </asp:Menu>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainHeading" runat="server">
    Active Loads - <%= DateTime.Now.ToString("dddd, dd MMMM yyyy") %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <asp:TextBox ID="txtFilterFleetID" runat="server" placeholder="Filter by Fleet ID"></asp:TextBox>
    <asp:TextBox ID="txtFilterCollection" runat="server" placeholder="Filter by Collection Location"></asp:TextBox>
    <asp:TextBox ID="txtFilterDropOffLocation" runat="server" placeholder="Filter by Drop-off Location"></asp:TextBox>
    <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" OnClick="btnApplyFilters_Click" />
  
    <asp:ListView ID="lvLoads" runat="server" ItemPlaceholderID="itemPlaceholder" OnSorting="lvLoads_Sorting">
        <LayoutTemplate>
            <table class="load-list-table">
                <thead>
                    <tr>
                        <th><asp:LinkButton ID="lnkLoadID" runat="server" Text="Load ID" CommandArgument="loadID" CommandName="Sort"></asp:LinkButton></th>
                        <th>Shipper ID</th>
                        <th>Driver ID</th>
                        <th><asp:LinkButton ID="lnkFleetID" runat="server" Text="Fleet ID" CommandArgument="fleetID" CommandName="Sort"></asp:LinkButton></th>
                        <th><asp:LinkButton ID="lnkCollectionDate" runat="server" Text="Collection Date" CommandArgument="collectionDate" CommandName="Sort"></asp:LinkButton></th>
                        <th><asp:LinkButton ID="lnkCollectionLocation" runat="server" Text="Collection Location" CommandArgument="collectionLocation" CommandName="Sort"></asp:LinkButton></th>
                        <th><asp:LinkButton ID="lnkDropOffDate" runat="server" Text="Drop-off Date" CommandArgument="dropOffDate" CommandName="Sort"></asp:LinkButton></th>
                        <th><asp:LinkButton ID="lnkDropOffLocation" runat="server" Text="Drop-off Location" CommandArgument="dropOffLocation" CommandName="Sort"></asp:LinkButton></th>
                        <th><asp:LinkButton ID="lnkLoadStatus" runat="server" Text="Load Status" CommandArgument="loadStatus" CommandName="Sort"></asp:LinkButton></th>
                        <th>Incident Contact</th>
                        <th>Damage Contact</th>
                        <th>Delivery Contact</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("loadID") %></td>
                <td><%# Eval("shipperID") %></td>
                <td><%# Eval("driverID") %></td>
                <td><%# Eval("fleetID") %></td>
                <td><%# Eval("collectionDate") %></td>
                <td><%# Eval("collectionLocation") %></td>
                <td><%# Eval("dropOffDate") %></td>
                <td><%# Eval("dropOffLocation") %></td>
                <td><%# Eval("loadStatus") %></td>
                <td><%# Eval("incidentContact") %></td>
                <td><%# Eval("damageContact") %></td>
                <td><%# Eval("deliveryContact") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="dsLoads" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=FreightDirector.accdb;"
        SelectCommand="SELECT * FROM Load"></asp:SqlDataSource>
</asp:Content>