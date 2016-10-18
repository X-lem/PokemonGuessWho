<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="winnerPage.aspx.cs" Inherits="PokemonGuessWho.winnerPage" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
            <p>You Have Won!</p>
            <p>Their Person was:</p>
            <asp:Image ID="winningPokemon" Width="150" Height="150" runat="server" />

            <br />
            <asp:Button ID="bttnReturn" runat="server" Text="Return to Login" OnClick="bttnReturn_Click"/>

    </div>
    </form>
</body>
</html>
