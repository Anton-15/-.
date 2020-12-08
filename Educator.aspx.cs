using Npgsql;
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Educator : Page
    {

        public NpgsqlConnection conn;
        string connString = String.Format("Server=localhost;Port=5432;User Id=anton;Password=anton;Database=MWP; ");
        private NpgsqlCommand cmd;
        public string query;
        NpgsqlDataReader pgReader;

        //static DateTime dt = DateTime.Now;
        //string date = dt.ToShortDateString();
        //string time = dt.ToLongTimeString();

        int a = 0;
          


        public void Page_Load(object sender, EventArgs e)
            {

            


            ExData.Text = "";
            conn = new NpgsqlConnection(connString);
            conn.Open();
            query = string.Format("SELECT \"Surname\", \"Name\", \"Patronymic\" FROM \"Educators\" where \"ID\" = {0} ", SessionFacade.UserId);
            cmd = new NpgsqlCommand(query, conn);
            pgReader = cmd.ExecuteReader();
            pgReader.Read();
            
                 
            SName.Text = pgReader["Surname"].ToString();
                Name.Text = pgReader["Name"].ToString();
                PName.Text = pgReader["Patronymic"].ToString();
                conn.Close();


            conn.Open();
            query = string.Format("Select \"Number\" from \"Groups\" where \"ID_Group\" = (SELECT \"ID_Group\" FROM \"Educators\" where \"ID\" = {0}) ", SessionFacade.UserId);
            cmd = new NpgsqlCommand(query, conn);
            pgReader = cmd.ExecuteReader();
            pgReader.Read();
            int id = Convert.ToInt32(pgReader["Number"].ToString());
            grupaN.Text = id.ToString();
            conn.Close();

            conn.Open();
            query = string.Format("Select \"Title\" from \"Groups\" where \"ID_Group\" = (SELECT \"ID_Group\" FROM \"Educators\" where \"ID\" = {0}) ", SessionFacade.UserId);
            cmd = new NpgsqlCommand(query, conn);
            pgReader = cmd.ExecuteReader();
            pgReader.Read();
            grupaI.Text = pgReader["Title"].ToString();
            conn.Close();
            
                

                if (IsPostBack)
                {
                    GVcontact.DataBind();
                }

            ListGr.SelectCommand = string.Format("Select \"Surname\", \"Name\", \"Patronymic\", \"Date_of_birth\", \"Address\" from \"Pupils\"  where \"ID_Group\" = (SELECT \"ID_Group\" FROM  \"Educators\" where \"ID\" = {0}) ", SessionFacade.UserId);

                ListItem listItem = new ListItem("Выбор ...", string.Empty);
                if (DropDownList1.Items.Contains(listItem) == false)
                { DropDownList1.Items.Insert(0, listItem); }
                if (IsPostBack)
                {
                    GVcontact.DataBind();
                }
                FIO.SelectCommand = string.Format("Select \"ID_Pupil\", \"Surname\" || ' ' || \"Name\" || ' ' || \"Patronymic\" as \"ФИО\" from \"Pupils\"  where \"ID_Group\" = (SELECT \"ID_Group\" FROM  \"Educators\" where \"ID\" = {0}) ", SessionFacade.UserId);

                if (DropDownList1.SelectedValue == "")
                {
                    contact.SelectCommand = string.Format("SELECT \"Surname\", \"Name\", \"Patronymic\",\"Phone_number\",\"Degree_of_relationship\"  from \"Relatives\" where \"ID_Pupil\"  = 0 ");

                  

                }
                else
                {

                    contact.SelectCommand = string.Format("SELECT \"Surname\", \"Name\", \"Patronymic\",\"Phone_number\",\"Degree_of_relationship\"  from \"Relatives\" where \"ID_Pupil\" = {0} ", DropDownList1.SelectedValue);
                   
                }


                SDSTemp.SelectCommand = string.Format("Select  \"Date\" ,\"Time\", \"Cabinet\", \"Bedroom\"  from \"Temperature_indicators\" where \"ID_Group\" = (SELECT \"ID_Group\" FROM  \"Educators\" where \"ID\" = {0}) ", SessionFacade.UserId);
                SDSProgulka.SelectCommand = string.Format("Select \"Date\", \"Exit_time\", \"Out_of_children\", \"Time_of_return\", \"Return_children\", \"Comment\" from \"Walks\" where \"ID_Group\" = (SELECT \"ID_Group\" FROM  \"Educators\" where \"ID\" = {0}) ", SessionFacade.UserId);


               
                if (IsPostBack)
                {
                    //GVProp.DataBind();
                     GridView1.DataBind();
                }

                if (DropDownList2.SelectedValue == "0")
                {
                    //SDSProp.SelectCommand = string.Format("SELECT \"Date\",  \"Surname\", \"Name\", \"Reason\"  FROM \"Оmissions\"   WHERE extract(month from \"Date\")  = 13");
                test.SelectCommand = string.Format("SELECT \"Date\",  \"Surname\", \"Name\", \"Reason\"  FROM \"Оmissions\"   WHERE extract(month from \"Date\")  = 13");


            }
                else
                {

                    //SDSProp.SelectCommand = string.Format("SELECT \"Date\",  \"Surname\", \"Name\", \"Reason\"  FROM \"Оmissions\"   WHERE extract(month from \"Date\") = {0} and \"ID_Group\" = (SELECT \"ID_Group\" FROM  \"Educators\" where \"ID\" = {1})", DropDownList2.SelectedValue, SessionFacade.UserId);
                    test.SelectCommand= string.Format("SELECT \"Date\",  \"Surname\", \"Name\", \"Reason\"  FROM \"Оmissions\"   WHERE extract(month from \"Date\") = {0} and \"ID_Group\" = (SELECT \"ID_Group\" FROM  \"Educators\" where \"ID\" = {1})", DropDownList2.SelectedValue, SessionFacade.UserId);
            }


            }



            /// <summary>
            /// Конструктор формы
            /// </summary>


            /// <summary>
            /// Подключаемся к базе данных
            /// </summary>
            public void DBConnect()
            {

            }

            protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
            {

            }

            protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
            {

                
            }

            protected void AddTemp_Click(object sender, EventArgs e)
            {
            DateTime dt = DateTime.Now;
            string date = dt.ToShortDateString();
            string time = dt.ToLongTimeString();
            //conn = new NpgsqlConnection(connString);
            conn.Open();
            query = string.Format("SELECT \"Date\" FROM \"Temperature_indicators\" WHERE \"Date\" = '{0}'", date);
            cmd = new NpgsqlCommand(query, conn);
            pgReader = cmd.ExecuteReader();
            pgReader.Read();


            if (pgReader.HasRows == false)
                {
                    conn.Close();
                    conn.Open();
                    query = string.Format("insert into \"Temperature_indicators\"   values ('{0}', '{1}', {2},{3},{4}) ", date , time, Convert.ToInt32(TBtempKab.Text), Convert.ToInt32(TBtempSpal.Text), SessionFacade.UserId);
                    cmd = new NpgsqlCommand(query, conn);
                    cmd.ExecuteReader();
                    conn.Close();
                    GVTemp.DataBind();
               
                }
                else
                {
                    ExData.Text = "Сегодня уже добавлена температура";
                }

                TBtempKab.Text = "";
                TBtempSpal.Text = "";
            }

            protected void OutputPr_Click(object sender, EventArgs e)
            {
            DateTime dt = DateTime.Now;
            string date = dt.ToShortDateString();
            string time = dt.ToLongTimeString();

            conn.Open();
            query = string.Format("SELECT \"Date\" FROM \"Walks\" WHERE \"Date\" = '{0}' and \"Time_of_return\"= '00:00:00'", date);
            cmd = new NpgsqlCommand(query, conn);
            pgReader = cmd.ExecuteReader();
            pgReader.Read();

            if (pgReader.HasRows == true)
                {
                   
                  
                conn.Close();
                conn.Open();
                query = string.Format("Update \"Walks\" SET \"Return_children\"= {0}, \"Time_of_return\"='{1}', \"Comment\"='{2}' where\"Return_children\"= 0  ", Convert.ToInt32(TBChildKol.Text), time, TBKoment.Text);
                cmd = new NpgsqlCommand(query, conn);
                cmd.ExecuteReader();
                conn.Close();
                GVTemp.DataBind();
                GVProgulka.DataBind();
                }
                else
                {
  
                conn.Close();
                conn.Open();
                query = string.Format("insert into \"Walks\"  values ('{0}','{1}', {2},'00:00:00',{3},'-',{4}) ", date, time, Convert.ToInt32(TBChildKol.Text), a, SessionFacade.UserId);
                cmd = new NpgsqlCommand(query, conn);
                cmd.ExecuteReader();
                conn.Close();
                GVProgulka.DataBind();

                }
                TBChildKol.Text = " ";
                TBKoment.Text = " ";
            }

            protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
            {

            }

            protected void AddProp_Click(object sender, EventArgs e)
            {
            DateTime dt = DateTime.Now;
            string date = dt.ToShortDateString();
            string time = dt.ToLongTimeString();

            LEX.Text = " ";

               

            conn.Close();
            conn.Open();
            query = string.Format("select \"ID_Pupil\" from \"Pupils\" where \"Name\"='{0}' and \"Surname\"='{1}' ", NProp.Text, FProp.Text);
            cmd = new NpgsqlCommand(query, conn);
            pgReader = cmd.ExecuteReader();
            pgReader.Read();


            if (pgReader.HasRows == true)
                {
                    int id = Convert.ToInt32(pgReader["ID_Pupil"]);
                    

                conn.Close();
                conn.Open();
                query = string.Format("insert into \"Оmissions\" (\"Date\",\"ID_Group\",  \"Reason\", \"Name\",\"Surname\") values  ('{0}', {1},'{2}','{3}','{4}')", date, SessionFacade.UserId, TBProp.Text, NProp.Text,FProp.Text);
                cmd = new NpgsqlCommand(query, conn);
                cmd.ExecuteReader();
                conn.Close();

            }
                else
                {
                    LEX.Text = "Не удалось добавить!";

                }
                NProp.Text = " ";
                FProp.Text = " ";
                TBProp.Text = " ";
            }
        }
    }
