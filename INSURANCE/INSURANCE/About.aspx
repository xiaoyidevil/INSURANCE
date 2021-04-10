<%@ Page Title="关于" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="INSURANCE.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Your app description page.</h2>
    </hgroup>

    <article>
        <p>        
            Use this area to provide additional information.
        </p>
    </article>

    <aside>
        <h3><%: XYYANG.Web.Utility.Constant.APP.Contact %></h3>
        <p>        
            Use this area to provide additional information.
        </p>
        <ul>
            <li><a runat="server" href="~/"><%: XYYANG.Web.Utility.Constant.APP.DefaultPage %></a></li>
            <li><a runat="server" href="~/About.aspx"><%: XYYANG.Web.Utility.Constant.APP.About %></a></li>
            <li><a runat="server" href="~/Contact.aspx"><%: XYYANG.Web.Utility.Constant.APP.Contact %></a></li>
        </ul>
    </aside>
</asp:Content>