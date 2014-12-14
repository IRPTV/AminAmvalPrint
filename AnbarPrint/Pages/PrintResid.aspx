<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintResid.aspx.cs" Inherits="AnbarPrint.Pages.PrintResid"  ViewStateMode="Disabled" EnableViewState="false" EnableViewStateMac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head  enableviewstate="false">
    <title></title>
    <link href="../Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
        <div dir="rtl">
             <asp:Label runat="server" ID="LblNoData" Text="  اموالی در حساب شما یافت نشد" Font-Names="Arial" ForeColor="Red" Font-Bold="true" Font-Size="16"></asp:Label>
            <asp:GridView EnableViewState="false" Visible="false" ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemTemplate>
                            <asp:Label ID="LblRowNumber" runat="server" CssClass="lbl" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="40" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شماره رسید">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("ID") %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="نام و نام خانوادگی">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# AnbarPrint.PublicInfo.GetEmpNameByCode(int.Parse(Eval("EmployeeID").ToString())) %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="160px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="کارمندی">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeID") %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="واحد">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# AnbarPrint.PublicInfo.GetDepById(decimal.Parse(Eval("DEP").ToString())) %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="160px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="تاریخ">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DateConversion.GD2JD(DateTime.Parse(Eval("DATETIME").ToString())) %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="اتاق">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ROOMNUMBER") %>' CssClass="lbl"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="نوع">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# AnbarPrint.PublicInfo.GetKindTitle(Eval("KIND")) %>' CssClass="lbl"></asp:Label>
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
             
            </asp:GridView>
        </div>
        <asp:GridView EnableViewState="false" ID="GridView2" runat="server" GridLines="None"  AutoGenerateColumns="False" Width="100%" ShowHeader="false" ShowFooter="false" DataKeyNames="ID" OnRowDataBound="GridView2_RowDataBound" OnDataBound="GridView2_DataBound" OnRowCreated="GridView2_RowCreated">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table style="direction: rtl; width: 100%;padding:0;margin:0;">
                            <tr>
                                <td class="tdheaderddd">ردیف</td>
                                <td class="tdheaderddd">شماره رسید</td>
                                <td class="tdheaderddd">نام و نام خانوادگی </td>
                                <td class="tdheaderddd">کارمندی</td>
                                <td class="tdheaderddd">واحد</td>
                                <td class="tdheaderddd">تاریخ</td>
                                <td class="tdheaderddd">اتاق </td>
                                <td class="tdheaderddd">نوع </td>

                            </tr>
                            <tr style="background-color:#efeeee">
                                <td style="width: 40px; height:10px; margin:0;padding:0;">
                                    <asp:Label ID="LblRowNumber" runat="server" CssClass="lbl" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                </td>
                                <td style="width: 80px;">
                                    <asp:Label ID="LblIDResid" runat="server" Font-Bold="true" Text='<%# Eval("ID") %>' CssClass="lbl"></asp:Label>
                                </td>
                                <td style="width: 140px;">
                                    <asp:Label ID="Label2" runat="server" Text='<%# AnbarPrint.PublicInfo.GetEmpNameByCode(int.Parse(Eval("EmployeeID").ToString())) %>' CssClass="lbl"></asp:Label>
                                </td>
                                <td style="width: 100px;">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("EmployeeID") %>' CssClass="lbl"></asp:Label>
                                </td>
                                <td style="width: 150px;">
                                    <asp:Label ID="Label6" runat="server" Text='<%# AnbarPrint.PublicInfo.GetDepById(decimal.Parse(Eval("DEP").ToString())) %>' CssClass="lbl"></asp:Label></td>
                                <td style="width: 90px;">
                                    <asp:Label ID="Label5" runat="server" Text='<%# DateConversion.GD2JD(DateTime.Parse(Eval("DATETIME").ToString())) %>' CssClass="lbl"></asp:Label>

                                </td>
                                <td style="width: 60px;">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("ROOMNUMBER") %>' CssClass="lbl"></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# AnbarPrint.PublicInfo.GetKindTitle(Eval("KIND")) %>' CssClass="lbl"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="8">
                                    <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="100%" RowStyle-Height="10">
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ردیف">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblRowNumber" runat="server" CssClass="lbl" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="40" />
                                                <ItemStyle HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="اموال">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="true"  Text='<%# Eval("amvalcode") %>' CssClass="lbl"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="90px" HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="نوع">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>' CssClass="lbl"></asp:Label>
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
                                        <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="White" Font-Names="B Yekan" Font-Size="7pt" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                        <EmptyDataTemplate>
                                           ----
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </td>
                            </tr>                                              
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
