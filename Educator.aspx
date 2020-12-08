<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Educator.aspx.cs" Inherits="test.Educator" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
    .button {
    color : #FFF;
    display: block;
    text-shadow: -1px -1px 1px #000000;
    filter: dropshadow(color=#000000, offx=-1, offy=-1);
    -webkit-box-shadow: inset 0px -2px 2px #666;
    -moz-box-shadow: inset 0px -2px 2px #666;
    box-shadow: inset 0px -2px 2px #666;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    margin: 5px;
    border: solid 1px #666;
}
.button:hover {
        border: solid 1px #333;
}
.button:active {
    -webkit-box-shadow: inset 0px -1px 1px #666;
    -moz-box-shadow: inset 0px -1px 1px #666;
    box-shadow: inset 0px -1px 1px #666; 
}

   
     .small {
    height: 30px;
    width: 100px;
    line-height: 30px;
    text-align: center;
    font-size: 18px;
    text-decoration: none;
}
.blue {
    background: #b8e1fc; 
    background: -moz-linear-gradient(top, #b8e1fc 0%, #a9d2f3 10%, #90bae4 25%, #90bcea 37%, #90bff0 50%, #6ba8e5 51%, #a2daf5 83%, #bdf3fd 100%); 
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#b8e1fc), color-stop(10%,#a9d2f3), color-stop(25%,#90bae4), color-stop(37%,#90bcea), color-stop(50%,#90bff0), color-stop(51%,#6ba8e5), color-stop(83%,#a2daf5), color-stop(100%,#bdf3fd)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b8e1fc', endColorstr='#bdf3fd',GradientType=0 ); /* ie */
}
        </style>

   <asp:Label   runat="server"  Text="Здравствуйте, "> </asp:Label>
    <asp:Label ID="SName" runat="server" Text=""> </asp:Label>
     <asp:Label ID="Name" runat="server" Text=""> </asp:Label>
     <asp:Label ID="PName" runat="server" Text="">  </asp:Label> 

     <asp:Label   runat="server"  Text="Группа № "> </asp:Label>
    <asp:Label ID="grupaN" runat="server" Text=""> </asp:Label>
     <asp:Label ID="grupaI" runat="server" Text=""> </asp:Label> 
     <br />

     <asp:Wizard ID="Wizard1" runat="server" 
            BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana"
            CellPadding="5" ActiveStepIndex="2" Font-Size="Small"  >

            <HeaderTemplate>
                <h3 style="color:green"><%= Wizard1.ActiveStep.Title %></h3>
            </HeaderTemplate>
            <SideBarTemplate>
                <div class="sideBar">
                    <asp:DataList runat="server" ID="SideBarList">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="SideBarButton" />
                        </ItemTemplate>
                        <SelectedItemStyle Font-Bold="True" />
                    </asp:DataList>
                </div>
            </SideBarTemplate>
            <NavigationStyle CssClass="navigation" />
          <StartNavigationTemplate>
            </StartNavigationTemplate>
            <StepNavigationTemplate>
            </StepNavigationTemplate>
            <FinishNavigationTemplate>
            </FinishNavigationTemplate>
            <%--<StartNavigationTemplate>
                <asp:Button runat="server" Text="Далее" CommandName="MoveNext" CssClass="navigationButton" />
            </StartNavigationTemplate>
            <StepNavigationTemplate>
                <asp:Button runat="server" Text="Назад" CommandName="MovePrevious" CssClass="navigationButton" />
                <asp:Button runat="server" Text="Далее" CommandName="MoveNext" CssClass="navigationButton" />
            </StepNavigationTemplate>
            <FinishNavigationTemplate>
                <asp:Button runat="server" Text="Назад" CommandName="MovePrevious" CssClass="navigationButton" />
                <asp:Button runat="server" Text="Добавить заказ" 
                    CommandName="MoveComplete" CssClass="navigationButton" />
            </FinishNavigationTemplate>--%>
         
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Список группы">
                    <asp:SqlDataSource ID="ListGr" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="Select &quot;Surname&quot;, &quot;Name&quot;, &quot;Patronymic&quot;, &quot;Date_of_birth&quot;, &quot;Address&quot; from &quot;Pupils&quot;  where &quot;ID_Group&quot; = (SELECT &quot;ID_Group&quot; FROM  &quot;Educators&quot; where &quot;ID&quot; = 0)"></asp:SqlDataSource>
                      <br />
                    <asp:GridView runat="server" ID="GridGr" AllowPaging="True" AllowSorting="True" DataSourceID="ListGr" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Patronymic" HeaderText="Patronymic" SortExpression="Patronymic" />
                            <asp:BoundField DataField="Date_of_birth" HeaderText="Date_of_birth" SortExpression="Date_of_birth" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        </Columns>
                      </asp:GridView>
                    <br />
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Контактные данные">
                    
                    <asp:Label runat="server" Text="Выберите ребёнка"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="FIO" DataTextField="ФИО" DataValueField="ID_Pupil" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    
                        </asp:DropDownList>
                    <asp:SqlDataSource ID="FIO" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="Select &quot;ID_Pupil&quot;, &quot;Surname&quot; || ' ' || &quot;Name&quot; || ' ' || &quot;Patronymic&quot; as &quot;ФИО&quot; from &quot;Pupils&quot;  where &quot;ID_Group&quot; = (SELECT &quot;ID_Group&quot; FROM  &quot;Educators&quot; where &quot;ID&quot; = 0)"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="contact" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="SELECT  &quot;Surname&quot;, &quot;Name&quot;, &quot;Patronymic&quot;,&quot;Phone_number&quot;,&quot;Degree_of_relationship&quot;  from &quot;Relatives&quot; where &quot;ID_Pupil&quot;  = 0 "></asp:SqlDataSource>
                    <asp:GridView ID="GVcontact" runat="server" AutoGenerateColumns="False" DataSourceID="contact" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Patronymic" HeaderText="Patronymic" SortExpression="Patronymic" />
                            <asp:BoundField DataField="Phone_number" HeaderText="Phone_number" SortExpression="Phone_number" />
                            <asp:BoundField DataField="Degree_of_relationship" HeaderText="Degree_of_relationship" SortExpression="Degree_of_relationship" />
                        </Columns>
                    </asp:GridView>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Температурный режим">
                    <asp:Label ID="tempKab" runat="server" Text="Температура в кабинете"></asp:Label> &nbsp;  <asp:TextBox ID="TBtempKab" runat="server"></asp:TextBox>
                   <br/>
                    <asp:Label ID="tempSpal" runat="server" Text="Температура в спальне"></asp:Label> &nbsp; <asp:TextBox ID="TBtempSpal" runat="server"></asp:TextBox>
                    <br/>
                    <asp:Button ID="AddTemp" runat="server" Text="Добавить" OnClick="AddTemp_Click" /> &nbsp; <asp:Label ID="ExData" runat="server" Text=""></asp:Label>
                    <asp:SqlDataSource ID="SDSTemp" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="Select  &quot;Date&quot; ,&quot;Time&quot;, &quot;Cabinet&quot;, &quot;Bedroom&quot;  from &quot;Temperature_indicators&quot; where &quot;ID_Group&quot; = (SELECT &quot;ID_Group&quot; FROM  &quot;Educators&quot; where &quot;ID&quot; = 0)" DeleteCommand="DELETE FROM [Температурный_режим] WHERE [Дата] = ?" InsertCommand="INSERT INTO [Температурный_режим] ([Дата], [Время], [ТемператураКабинет], [ТемператураСпальня]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE &quot;Temperature_indicators&quot; SET &quot;Date&quot; = ?, &quot;Time&quot; = ?, &quot;Cabinet&quot; = ?, &quot;Bedroom&quot; = ? where &quot;Date&quot;=? ">
                        
                    </asp:SqlDataSource>
                    <asp:GridView ID="GVTemp" runat="server" AutoGenerateColumns="False" DataSourceID="SDSTemp" AllowPaging="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataFormatString="{0:dd.MM.yyyy}" DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField  DataField="Time" HeaderText="Time" SortExpression="Time" />
                            <asp:BoundField DataField="Cabinet" HeaderText="Cabinet" SortExpression="Cabinet" />
                            <asp:BoundField DataField="Bedroom" HeaderText="Bedroom" SortExpression="Bedroom" />
                        </Columns>
                    </asp:GridView>
                     </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="Прогулка" >
                    <asp:Label ID="ChildKol" runat="server" Text="Колличество детей"></asp:Label>  &nbsp; <asp:TextBox ID="TBChildKol" runat="server"></asp:TextBox> 
                    <br/>
                    
                    <asp:Label ID="Koment" runat="server" Text="Комментарий для возвращения"></asp:Label> &nbsp; <asp:TextBox ID="TBKoment" runat="server" Text=" "></asp:TextBox>
                    <br/>
                  
                     <asp:Button ID="OutputPr" runat="server" Text="Выйти/вернуться" class="button blue small" href="#"   Width="136px" OnClick="OutputPr_Click" /> &nbsp; 
                    <asp:SqlDataSource ID="SDSProgulka" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="Select &quot;Date&quot;, &quot;Exit_time&quot;, &quot;Out_of_children&quot;, &quot;Time_of_return&quot;, &quot;Return_children&quot;, &quot;Comment&quot; from &quot;Walks&quot; where &quot;ID_Group&quot; = (SELECT &quot;ID_Group&quot; FROM  &quot;Educators&quot; where &quot;ID&quot; = 0) " DeleteCommand="DELETE FROM [Прогулки] WHERE [ID] = ?" InsertCommand="INSERT INTO [Прогулки] ([Дата], [Время_выхода], [Кол_во_детей_вых], [Время_прихода], [Кол_во_детей_прих], [Комментарий], [ID]) VALUES (?, ?, ?, ?, ?, ?, ?)"   UpdateCommand="UPDATE &quot;Walks&quot;  SET &quot;Date&quot; = ?, &quot;Exit_time&quot; = ?, &quot;Out_of_children&quot; = ?, &quot;Time_of_return&quot; = ?, &quot;Return_children&quot; = ?, &quot;Comment&quot; = ? ">    
                    </asp:SqlDataSource>
                    <asp:GridView ID="GVProgulka" runat="server" DataSourceID="SDSProgulka" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" >
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="Exit_time" HeaderText="Exit_time" SortExpression="Exit_time" />
                            <asp:BoundField DataField="Out_of_children" HeaderText="Out_of_children" SortExpression="Out_of_children" />
                            <asp:BoundField DataField="Time_of_return" HeaderText="Time_of_return" SortExpression="Time_of_return" />
                            <asp:BoundField DataField="Return_children" HeaderText="Return_children" SortExpression="Return_children" />
                            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                        </Columns>
                    </asp:GridView>
                </asp:WizardStep>
                 <asp:WizardStep ID="WizardStep5" runat="server" Title="Табель посещаемости">
                     <asp:Label  runat="server" Text="Имя"></asp:Label>  &nbsp;  <asp:TextBox ID="NProp" runat="server"></asp:TextBox> <br/>
                     <asp:Label  runat="server" Text="Фамилия"></asp:Label>   &nbsp;  <asp:TextBox ID="FProp" runat="server"></asp:TextBox> <br/>
                     <asp:Label  runat="server" Text="Причина"></asp:Label>   &nbsp;  <asp:TextBox ID="TBProp" runat="server"></asp:TextBox>
                     <br/>
                     <asp:Button   ID="AddProp" runat="server" Text="Добавить" OnClick="AddProp_Click" />  &nbsp; <asp:Label ID="LEX" runat="server" Text=""></asp:Label>
                     <br/>
                     <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                          <asp:ListItem Value="0">Выбор...</asp:ListItem>
                          <asp:ListItem Value="1">Январь</asp:ListItem>
                          <asp:ListItem Value="2">Февраль</asp:ListItem>
                          <asp:ListItem Value="3">Март</asp:ListItem>
                          <asp:ListItem Value="4">Апрель</asp:ListItem>
                          <asp:ListItem Value="5">Май</asp:ListItem>
                          <asp:ListItem Value="6">Июнь</asp:ListItem>
                          <asp:ListItem Value="7">Июль</asp:ListItem>
                          <asp:ListItem Value="8">Август</asp:ListItem>
                          <asp:ListItem Value="9">Сентябрь</asp:ListItem>
                          <asp:ListItem Value="10">Октябрь</asp:ListItem>
                          <asp:ListItem Value="11">Ноябрь</asp:ListItem>
                          <asp:ListItem Value="12">Декабрь</asp:ListItem>
                     </asp:DropDownList>
                    <br />
                    <%-- <asp:SqlDataSource ID="SDSProp" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="SELECT &quot;Date&quot;, &quot;Surname&quot;, &quot;Name&quot;,  &quot;Reason&quot; FROM &quot;Оmissions&quot;   WHERE extract(month from &quot;Date&quot;) = 13 " UpdateCommand="UPDATE &quot;Оmissions&quot; SET &quot;Date&quot; = ?, &quot;Surname&quot; = ?, &quot;Name&quot; = ?, &quot;Reason&quot;=?" DeleteCommand="DELETE FROM [Пропуски] WHERE [Код] = ?" InsertCommand="INSERT INTO [Пропуски] ([Код], [Дата], [IDВоспитанника], [Причина_отсутствия]) VALUES (?, ?, ?, ?)">
                     </asp:SqlDataSource>--%>
                     <%--<asp:GridView ID="GVProp" runat="server" AutoGenerateColumns="False" DataSourceID="SDSProp"  AllowPaging="True" AllowSorting="True">
                         <Columns>
                             <asp:CommandField ShowEditButton="True" />
                             <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                             <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                             <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                             <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                             
                         </Columns>--%>
                         
                     <%--</asp:GridView>--%>
                     <asp:SqlDataSource ID="test" runat="server" ConnectionString="<%$ ConnectionStrings:courseworkMWP %>" ProviderName="<%$ ConnectionStrings:courseworkMWP.ProviderName %>" SelectCommand="SELECT &quot;Date&quot;, &quot;Surname&quot;, &quot;Name&quot;,  &quot;Reason&quot; FROM &quot;Оmissions&quot;   WHERE extract(month from &quot;Date&quot;) = 13 " UpdateCommand="UPDATE &quot;Оmissions&quot; SET &quot;Date&quot; = ?, &quot;Surname&quot; = ?, &quot;Name&quot; = ?, &quot;Reason&quot;=?" ></asp:SqlDataSource>
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="test" AutoGenerateColumns="False">
                         <Columns>
                             <asp:CommandField ShowEditButton="True" />
                             <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                             <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                             <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                             <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                         </Columns>
                     </asp:GridView> 

                 </asp:WizardStep>
                
            </WizardSteps>
            <SideBarStyle VerticalAlign="Top" />

        </asp:Wizard>
</asp:Content>
