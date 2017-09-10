<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Welcome !"></asp:Label>
        <br />
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" Width="100px" />
    </form>
</body>
</html>
