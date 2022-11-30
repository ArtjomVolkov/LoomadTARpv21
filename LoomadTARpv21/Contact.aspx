<%@ Page Title="Loomade lisamine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LoomadTARpv21.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Looma lisamine</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="335px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="loomID" DataSourceID="SqlDataSource1_loomad" DefaultMode="Insert" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="loomID" HeaderText="loomID" InsertVisible="False" ReadOnly="True" SortExpression="loomID" />
                <asp:BoundField DataField="loomanimi" HeaderText="loomanimi" SortExpression="loomanimi" />
                <asp:TemplateField HeaderText="synniaeg" SortExpression="synniaeg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("synniaeg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" SelectedDate='<%# Bind("synniaeg") %>' Width="330px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                            <DayStyle BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                            <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        </asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("synniaeg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="omanikID" SortExpression="omanikID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("omanikID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1_omanik" DataTextField="nimi" DataValueField="omanikID" SelectedValue='<%# Bind("omanikID") %>' Width="138px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_omanik" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudVolkovConnectionString1 %>" DeleteCommand="DELETE FROM [omanik] WHERE [omanikID] = @omanikID" InsertCommand="INSERT INTO [omanik] ([nimi]) VALUES (@nimi)" SelectCommand="SELECT [nimi], [omanikID] FROM [omanik]" UpdateCommand="UPDATE [omanik] SET [nimi] = @nimi WHERE [omanikID] = @omanikID">
                            <DeleteParameters>
                                <asp:Parameter Name="omanikID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="nimi" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="nimi" Type="String" />
                                <asp:Parameter Name="omanikID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("omanikID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CancelText="Loobu" InsertText="Lisa" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1_loomad" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudVolkovConnectionString1 %>" DeleteCommand="DELETE FROM [loomad] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [loomad] ([loomanimi], [synniaeg], [omanikID]) VALUES (@loomanimi, @synniaeg, @omanikID)" SelectCommand="SELECT * FROM [loomad]" UpdateCommand="UPDATE [loomad] SET [loomanimi] = @loomanimi, [synniaeg] = @synniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
            <DeleteParameters>
                <asp:Parameter Name="loomID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="loomanimi" Type="String" />
                <asp:Parameter DbType="Date" Name="synniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="loomanimi" Type="String" />
                <asp:Parameter DbType="Date" Name="synniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
                <asp:Parameter Name="loomID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
