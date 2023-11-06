<%@ Page Title="Card Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CardsEmp.aspx.cs" Inherits="TripActions.CardsEmp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="MIS531DataSource">
                <ItemTemplate>
                    CARDNUM:
                    <asp:Label ID="CARDNUMLabel" runat="server" Text='<%# Eval("CARDNUM") %>' />
                    <br />
                    CARDTYPE:
                    <asp:Label ID="CARDTYPELabel" runat="server" Text='<%# Eval("CARDTYPE") %>' />
                    <br />
                    CATEGORY:
                    <asp:Label ID="CATEGORYLabel" runat="server" Text='<%# Eval("CATEGORY") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="MIS531DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="select cs.cardnum, cardtype, category from card_subscriptions cs join cards c on
cs.cardnum = c.cardnum
where empid = :EMPID">
            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
