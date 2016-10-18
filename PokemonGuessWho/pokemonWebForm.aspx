<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pokemonWebForm.aspx.cs" Inherits="PokemonGuessWho.pokemonWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="pokemonStyle2.css" rel="stylesheet" type="text/css" />
    <title>Pokemon Guess Who</title>
</head>
<body>
    <form id="form1" runat="server">

    <!-- Error Output -->
    <asp:TextBox ID="tbErrorMessage" runat="server" ReadOnly="true" placeholder="Error Messages"></asp:TextBox>

    <!-- Game Board -->
    <div class="gameBoard">
        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
        <asp:DataList ID="dataListPokemonList" CssClass="pokemonListTemplate" ItemStyle-CssClass="itemPokemonListTemplate" runat="server"
            DataSourceID="xmlPokemonList" RepeatColumns="7" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderWidth="2" CellSpacing="5"
            OnItemCommand="dataListPokemonList_ItemCommand" OnItemDataBound="dataListPokemonList_ItemDataBound">
            <ItemTemplate>
                <!-- Display Pictures -->
                <asp:ImageButton ID="pokemonImage" CommandName="GuessPokemon" CommandArgument='<%# XPath("number") %>'
                    ImageUrl='<%#"Pictures/" + XPath("number") + ".png" %>' Width="150" Height="150" runat="server"/>
                <br />
                <asp:Label ID="lblName" runat="server" Text='<%#XPath("name") %>' ForeColor="#E6BC2F" Font-Size="Large"></asp:Label>
                <asp:Label ID="lblNumber" runat="server" Text='<%#XPath("number") %>' ForeColor="White"></asp:Label>
                
            </ItemTemplate>
        </asp:DataList>

        <asp:XmlDataSource ID="xmlPokemonList" runat="server" DataFile="~/PokemonNames.xml" XPath="pokemon/pokeball"></asp:XmlDataSource>
        <br />
    </div>

    <!-- Questions -->
    <div>
        <!-- Random Questions Drop Down List -->
        <asp:DropDownList ID="ddlRandomQuestions" CssClass="questionsList" runat="server" DataSourceID="odsRandomQuestions" DataTextField="Questions" DataValueField="QuestionsID"></asp:DropDownList>
        <asp:ObjectDataSource ID="odsRandomQuestions" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetRandomQuestions" TypeName="DataSetTableAdapters.RandomQuestionsTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_QuestionsID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Questions" Type="String" />
                <asp:Parameter Name="QuestionCatagory" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Questions" Type="String" />
                <asp:Parameter Name="QuestionCatagory" Type="Int32" />
                <asp:Parameter Name="Original_QuestionsID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="bttnRandomQuestions" runat="server" Text="Guess" OnClick="bttnRandomQuestions_Click" />

        <!-- Type Questions Drop Down List -->
        <asp:DropDownList ID="ddlTypeQuestions" CssClass="questionsList" runat="server" DataSourceID="odsTypeQuestions" DataTextField="Questions" DataValueField="QuestionsID"></asp:DropDownList>
        <asp:ObjectDataSource ID="odsTypeQuestions" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTypeQuestions" TypeName="DataSetTableAdapters.TypeQuestionsTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_QuestionsID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Questions" Type="String" />
                <asp:Parameter Name="QuestionCatagory" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Questions" Type="String" />
                <asp:Parameter Name="QuestionCatagory" Type="Int32" />
                <asp:Parameter Name="Original_QuestionsID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="bttnTypeQuestions" runat="server" Text="Guess" OnClick="bttnTypeQuestions_Click" />
        <asp:Button ID="bttnReturn" runat="server" Text="Return to Login" OnClick="bttnReturn_Click"/>

    </div>
    </form>
</body>
</html>
