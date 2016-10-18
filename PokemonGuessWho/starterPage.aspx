<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="starterPage.aspx.cs" Inherits="PokemonGuessWho.starterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pokemon Guess Who</title>
    <link href="starterPageStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <h1 id="startPageTitle">Pokémon Guess Who</h1>
        <div>
            <!-- log in -->
            <p class="logIn">Enter User Name</p>
            <asp:TextBox ID="tbUserName" CssClass="logIn" runat="server"></asp:TextBox>
            <asp:Button ID="btUserName" Text="Find Games" runat="server" OnClick="btUserName_Click" /> <!-- Invisible Button -->

            <p id="break" class="logIn">|</p>
            <p>New Line Added</p>
                <!-- Create a New Game -->
            <asp:TextBox ID="tbNewGamePlayer1" placeholder="Player 1" CssClass="logIn" runat="server"></asp:TextBox>                
            <asp:TextBox ID="tbNewGamePlayer2" placeholder="Player 2" CssClass="logIn" runat="server"></asp:TextBox>               
            <asp:Button ID="bttnAddGame" CssClass="logIn" runat="server" Text="Add Game" OnClick="bttnAddGame_Click"/>
        </div>

        

        <!-- Grid view to display games where the player needs to take their turn -->
        <asp:Label ID="lbPlayerTurnHeading" runat="server">Currently Your Turn</asp:Label>
        <asp:GridView ID="gvDisplayUserGames" runat="server" AutoGenerateColumns="False" DataKeyNames="GameID" DataSourceID="odsCurrentGames" Visible="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="GameID" HeaderText="GameID" InsertVisible="False" ReadOnly="True" SortExpression="GameID" />
                <asp:BoundField DataField="Player1" HeaderText="Player1" SortExpression="Player1" />
                <asp:BoundField DataField="Player2" HeaderText="Player2" SortExpression="Player2" />
                <asp:BoundField DataField="playerTurn" HeaderText="playerTurn" SortExpression="playerTurn" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("GameID", "pokemonWebForm.aspx?game={0}") %>'
                            Text="Play!" Visible='<%# YourTurn(Eval("playerTurn"), Eval("Player1"), Eval("Player2")) %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#3C3C3C" ForeColor="#330099" />
            <HeaderStyle BackColor="#3C3C3C" Font-Bold="True" ForeColor="#E6BC2F" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="#616161" ForeColor="#FFFFFF" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>

        <asp:ObjectDataSource ID="odsCurrentGames" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="getGamesbyUserID" TypeName="DataSetTableAdapters.GamesTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_GameID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Player1" Type="String" />
                <asp:Parameter Name="Player2" Type="String" />
                <asp:Parameter Name="Player1POI" Type="Int32" />
                <asp:Parameter Name="Player2POI" Type="Int32" />
                <asp:Parameter Name="playerTurn" Type="Int32" />
                <asp:Parameter Name="Active" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="tbUserName"  Name="UserName" PropertyName="Text" Type="String" DefaultValue="CheshireCat" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Player1" Type="String" />
                <asp:Parameter Name="Player2" Type="String" />
                <asp:Parameter Name="Player1POI" Type="Int32" />
                <asp:Parameter Name="Player2POI" Type="Int32" />
                <asp:Parameter Name="playerTurn" Type="Int32" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="Original_GameID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <br />
        <br />

        <!-- Grid view to display games where player is waiting on their opponent -->
        <asp:Label ID="lbNotPlayerTurnHeading" runat="server">Waiting On Opponent</asp:Label>
        <asp:GridView ID="gvDisplayUserGamesNotTurn" runat="server" AutoGenerateColumns="False" DataKeyNames="GameID" DataSourceID="odsCurrentGamesNotTurn" Visible="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="GameID" HeaderText="Game ID" InsertVisible="False" ReadOnly="True" SortExpression="GameID" />
                <asp:BoundField DataField="Player1" HeaderText="Player 1" SortExpression="Player1" />
                <asp:BoundField DataField="Player2" HeaderText="Player 2" SortExpression="Player2" />
                <asp:BoundField DataField="playerTurn" HeaderText="Player Turn" SortExpression="playerTurn" />
            </Columns>
            <FooterStyle BackColor="#3C3C3C" ForeColor="#330099" />
            <HeaderStyle BackColor="#3C3C3C" Font-Bold="True" ForeColor="#E6BC2F" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="#616161" ForeColor="#FFFFFF" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>

        <asp:ObjectDataSource ID="odsCurrentGamesNotTurn" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="getGamesbyUserIDNotTurn" TypeName="DataSetTableAdapters.GamesTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_GameID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Player1" Type="String" />
                <asp:Parameter Name="Player2" Type="String" />
                <asp:Parameter Name="Player1POI" Type="Int32" />
                <asp:Parameter Name="Player2POI" Type="Int32" />
                <asp:Parameter Name="playerTurn" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="tbUserName" DefaultValue="CheshireCat" Name="UserName" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Player1" Type="String" />
                <asp:Parameter Name="Player2" Type="String" />
                <asp:Parameter Name="Player1POI" Type="Int32" />
                <asp:Parameter Name="Player2POI" Type="Int32" />
                <asp:Parameter Name="playerTurn" Type="Int32" />
                <asp:Parameter Name="Original_GameID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>


    </div>
    </form>
</body>
</html>
