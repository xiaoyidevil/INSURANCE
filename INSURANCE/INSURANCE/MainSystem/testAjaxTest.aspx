<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testAjaxTest.aspx.cs" Inherits="INSURANCE.MainSystem.testAjaxTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="FuncTitle">
            <%--<asp:WebPartManager ID="WebPartManager1" runat="server"></asp:WebPartManager>--%>
          <%--  <h1><%: XYYANG.Web.Utility.Constant.APP.ListOfInsured %></h1>--%>
            <table class="tblInsurance">
                <tr>
                    <td colspan="7">
                    <%: XYYANG.Web.Utility.Constant.InsurancePage.InsuranceCompay %>：
                    <asp:UpdatePanel ID="UPMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlInsuranceCompany" runat="server" Width="200px" AutoPostBack="true" OnTextChanged="ddlInsuranceCompany_TextChanged" OnSelectedIndexChanged="ddlInsuranceCompany_SelectedIndexChanged" ></asp:DropDownList></td>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlInsuranceCompany" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </tr>
                <tr>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.BoatOwner %></td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.BoatNum %></td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                </tr>
            </table>    
        </div>
        <asp:Button ID="btnImportExcel" runat="server" Text="导入数据" OnClick="btnImportExcel_Click" />
    </form>
</body>
</html>
