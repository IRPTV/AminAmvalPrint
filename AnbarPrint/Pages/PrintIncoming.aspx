<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintIncoming.aspx.cs" Inherits="AnbarPrint.Pages.PrintIncoming" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div dir="rtl">
            <%-- <asp:Label Font-Size="7pt" runat="server" ID="LblTest"></asp:Label>--%>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" RowStyle-Height="10px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <%--     <asp:TemplateField HeaderText="کد">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' CssClass="lbl"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemTemplate>
                            <asp:Label ID="LblRowNumber" runat="server" CssClass="lbl" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="40" />
                        <ItemStyle HorizontalAlign="Center" Height="10" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="اموال">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="11pt" Text='<%# Eval("amvalcode") %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="90px" HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="نوع">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# AnbarPrint.PublicInfo.GetObjectTitleById(int.Parse(Eval("objectid").ToString())) %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="مارک">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("brand") %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="130px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="سریال">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("serial") %>' CssClass="lblen"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="مدل">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("model") %>' CssClass="lblen"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="تاریخ">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DateConversion.GD2JD(DateTime.Parse(Eval("DATETIME").ToString())) %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="White" Font-Names="B Yekan" Font-Size="9pt" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                <EmptyDataTemplate>
                    No Data
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
