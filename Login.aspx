<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .auto-style1 {
            text-align: center;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 class="auto-style1">Login Page</h1>
    <br />
        Username:<br />
        <asp:TextBox ID="username" runat="server" Width="200px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter a username" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Password:<br />
        <asp:TextBox ID="password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="please enter the password" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Login" Width="100px" />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Spot_Registration.aspx">new user register here</asp:HyperLink>
        <br />
        

    </div>
    </form>
</body>
</html>
