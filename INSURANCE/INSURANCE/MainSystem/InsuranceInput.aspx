﻿<%@ Page Title="保单录入" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsuranceInput.aspx.cs" Inherits="INSURANCE.MainSystem.InsuranceInput" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">    
        <div class="FuncTitle">
            <%--<asp:WebPartManager ID="WebPartManager1" runat="server"></asp:WebPartManager>--%>
            <h1><%: XYYANG.Web.Utility.Constant.APP.ListOfInsured %></h1>
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
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>
