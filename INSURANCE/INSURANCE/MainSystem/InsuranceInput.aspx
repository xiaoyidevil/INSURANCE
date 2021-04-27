<%@ Page Title="保单录入" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsuranceInput.aspx.cs" Inherits="INSURANCE.MainSystem.InsuranceInput" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../Scripts/common.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">    
        <div class="FuncTitle">
            <%--<asp:WebPartManager ID="WebPartManager1" runat="server"></asp:WebPartManager>--%>
            <h1><%: XYYANG.Web.Utility.Constant.APP.ListOfInsured %></h1>
            <table class="tblInsurance">
                <tr>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.InsuranceCompay %>：</td>
                    <td><asp:TextBox ID="txtInsuranceCompany" runat="server" AutoPostBack="true" Width="180" OnTextChanged="txtInsuranceCompany_TextChanged"></asp:TextBox></td>
                    <td ><asp:DropDownList ID="ddlInsuranceCompany" runat="server" AutoPostBack="true" Width="180"
                        OnSelectedIndexChanged="ddlInsuranceCompany_SelectedIndexChanged" ></asp:DropDownList></td>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.InsuranceType %></td>
                    <td colspan="3">
                        <asp:DropDownList ID="ddlInsuranceType" runat="server" Width="180"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.BoatOwner %></td>
                    <td><asp:TextBox ID="txtBoatOwner" runat="server" AutoPostBack="true" Width="180" OnTextChanged="txtBoatOwner_TextChanged"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlBoatOwner" runat="server" AutoPostBack="true" Width="180" OnSelectedIndexChanged="ddlBoatOwner_SelectedIndexChanged"></asp:DropDownList></td>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.BoatNum %></td>
                    <td><asp:TextBox ID="txtBoatNum" runat="server" AutoPostBack="true" Width="180" OnTextChanged="txtBoatNum_TextChanged"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlBoatNum" runat="server" AutoPostBack="true" Width="180" OnSelectedIndexChanged="ddlBoatNum_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><%: XYYANG.Web.Utility.Constant.InsurancePage.EffectiveStartDate %></td>
                    <td>
                        <asp:Label ID="lblStartDate" runat="server" Text="" Width="150"></asp:Label>
                        <img src="../Images/calender.jpg" ID="imgStart" onclick="javascript:showStartCalender(); return false;" />
                    </td>
                    <td style="width:400px">
                        <asp:Calendar ID="calStartDate" runat="server" CssClass="DTcalender" OnSelectionChanged="calStartDate_SelectionChanged"></asp:Calendar>
                    </td>
                    <td>
                        <%: XYYANG.Web.Utility.Constant.InsurancePage.EffectiveEndDate %>
                    </td>
                    <td><asp:Label ID="lblEndDate" runat="server" Text="" Width="150"></asp:Label>
                         <img src="../Images/calender.jpg" ID="imgEnd" runat="server" onclick="javascript:showEndCalender(); return false;"/>
                    </td>
                    <td style="width:400px;">
                        <asp:Calendar ID="calEndDate" runat="server" CssClass="DTcalender" OnSelectionChanged="calEndDate_SelectionChanged"></asp:Calendar>
                    </td>
                </tr>
            </table>  
            <asp:FileUpload ID="FUupload" runat="server"/><asp:Button ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click" />
            <asp:GridView ID="gvPersonList" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="InsurancePolicyName" />
                    <asp:BoundField HeaderText="身份证" DataField="InsurancePolicyIdentity" />
                </Columns>
            </asp:GridView>
            <asp:Table ID="tblPersonList" runat="server" CssClass="tblInsurance">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell RowSpan="3"><%: XYYANG.Web.Utility.Constant.InsurancePage.SequenceNo %></asp:TableHeaderCell>
                    <asp:TableHeaderCell RowSpan="3"><%: XYYANG.Web.Utility.Constant.InsurancePage.InsurancePersonName %></asp:TableHeaderCell>
                    <asp:TableHeaderCell RowSpan="3"><%: XYYANG.Web.Utility.Constant.InsurancePage.IdentityNo %></asp:TableHeaderCell>
                    <asp:TableHeaderCell RowSpan="3"><%: XYYANG.Web.Utility.Constant.InsurancePage.Age %></asp:TableHeaderCell>
                    <asp:TableHeaderCell RowSpan="3"><%: XYYANG.Web.Utility.Constant.InsurancePage.Occupation %></asp:TableHeaderCell>
                    <asp:TableHeaderCell ColumnSpan="2"><%: XYYANG.Web.Utility.Constant.InsurancePage.InsuranceTotalAmount %></asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell><%: XYYANG.Web.Utility.Constant.InsurancePage.GroupAccidentInjury %></asp:TableHeaderCell>
                    <asp:TableHeaderCell><%: XYYANG.Web.Utility.Constant.InsurancePage.GroupAccidentMedicalCare %></asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell><%: XYYANG.Web.Utility.Constant.InsurancePage.AccidentInjury %></asp:TableHeaderCell>
                    <asp:TableHeaderCell><%: XYYANG.Web.Utility.Constant.InsurancePage.AccidentMedicalCare %></asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        <br />
        <div class="ControlPanel">
            <asp:Button ID="btnImport" runat="server" Text="导入" OnClientClick="return checkImport();" OnClick="btnImport_Click" />
        </div>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>
