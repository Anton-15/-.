<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="test._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <style>
    .myTable {
        margin: auto;
    }
</style>

         <div class="jumbotron">
             <table class="myTable"  >
                 <tr >
                     <td class="form-group"  > 
                         <div  margin: 0 auto; width: 100px;  class="form-group">
    <label for="exampleInputEmail1">Логин<br />
    <asp:TextBox  type="email"  class="form-control" ID="Logine"  aria-describedby="emailHelp" Text="" placeholder="Enter email" runat="server" Width="238px"></asp:TextBox> </label>
        &nbsp;<asp:Label ID="LogEx" runat="server" Text=""></asp:Label>  &nbsp;
           </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Пароль<br /> 
    <asp:TextBox   type="password" class="form-control" ID="Passworde"  placeholder="Password" runat="server" Width="238px"></asp:TextBox> </label> 
    &nbsp;<asp:Label ID="PasEx" runat="server" Text=""></asp:Label>
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Запомнить меня</label>
       </div> 
     &nbsp; <asp:Label ID="LogPasEx" runat="server" Text=""></asp:Label>

  <div>   <asp:Button class="btn btn-primary" ID="input" runat="server" Text="Войти"
  OnClick="login_Click" />
    </div>

                     </td>
                     <td class="form-group">
                         <asp:Image ID="Image1" runat="server" class="img-responsive" ImageUrl="~/Image/123.png" Height="290px" Width="349px" /></td>

                 </tr>
             </table>
                 
                 
             
        
       
   </div>
    
 
      
</asp:Content>
