<%@ Page Title="保单录入" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsuranceInput.aspx.cs" Inherits="INSURANCE.MainSystem.InsuranceInput" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <div class="FuncTitle">
        <h1><%: XYYANG.Web.Utility.Constant.APP.ListOfInsured %></h1>
        <table class="tblInsurance">
            <tr>
                <td><%: XYYANG.Web.Utility.Constant.InsurancePage.InsuranceCompay %></td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td><%: XYYANG.Web.Utility.Constant.InsurancePage.BoatOwner %></td>
                <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                <td><%: XYYANG.Web.Utility.Constant.InsurancePage.BoatNum %></td>
                <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>
