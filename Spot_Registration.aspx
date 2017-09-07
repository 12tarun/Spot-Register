<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Spot_Registration.aspx.cs" Inherits="Spot_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        Username :
        <br />
        <asp:TextBox ID="username" runat="server" Width="200px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter a username" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Email-id :<br />
        <asp:TextBox ID="email" runat="server" Width="200px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="please enter a valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter an email id" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Password :<br />
        <asp:TextBox ID="password" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="password" ErrorMessage="password must contain atleast one digit, one special character and should be of minimum 8 and maximum 20 characters long" ValidationExpression="((?=.*\d)(?=.*\W).{8,20})" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="please enter a password" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Confirm Password :<br />
        <asp:TextBox ID="confirmpassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmpassword" ErrorMessage="confirm password and password do not match" ForeColor="Red"></asp:CompareValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please enter the same password again" ControlToValidate="confirmpassword" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Country :<br />
        <asp:DropDownList ID="country" runat="server" Width="150px">
            <asp:ListItem>select country</asp:ListItem>
            <asp:ListItem>INDIA</asp:ListItem>
            <asp:ListItem>USA</asp:ListItem>
            <asp:ListItem>UK</asp:ListItem>
            <asp:ListItem>JAPAN</asp:ListItem>
            <asp:ListItem>RUSSIA</asp:ListItem>
            <asp:ListItem>CHINA</asp:ListItem>
            <asp:ListItem>AUSTRALIA</asp:ListItem>
            <asp:ListItem>GERMANY</asp:ListItem>
            <asp:ListItem>FRANCE</asp:ListItem>
            <asp:ListItem>SPAIN</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please select a country name" ControlToValidate="country" InitialValue="select country" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="100px" />
    </form>
</body>
</html>
