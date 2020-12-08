using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class _Default : Page
    {
        //OleDbConnection dbase;
        //OleDbCommand dbcom;
        //public string query;
        //OleDbDataReader reader;
        //string connString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Антон/Documents/MWP.accdb");

        public NpgsqlConnection conn;
        string connString = String.Format("Server=localhost;Port=5432;User Id=anton;Password=anton;Database=MWP; ");
        private NpgsqlCommand cmd;
        public string query;
        //DataTable DT;
        //NpgsqlDataAdapter da;
        NpgsqlDataReader pgReader;
        protected void login_Click(object sender, EventArgs e)
        {
            
            LogPasEx.Text = "";
            LogEx.Text = "";
            PasEx.Text = "";

            if (Logine.Text != "" && Passworde.Text != "")
            {
                conn = new NpgsqlConnection(connString);
                conn.Open();
                query = string.Format("SELECT \"ID\" FROM \"Educators\" where \"Login\" = '{0}'", Logine.Text);
                cmd = new NpgsqlCommand(query, conn);
                pgReader = cmd.ExecuteReader();
                pgReader.Read();

                if (pgReader.HasRows)
                {
                    conn.Close();
                    conn = new NpgsqlConnection(connString);
                    conn.Open();
                    query = string.Format("SELECT \"ID\" FROM \"Educators\" where \"Password\" = '{0}'", Passworde.Text);
                    cmd = new NpgsqlCommand(query, conn);
                    pgReader = cmd.ExecuteReader();
                    pgReader.Read();
                    if (pgReader.HasRows)
                    {
                        SessionFacade.UserId = Convert.ToInt32(pgReader["ID"].ToString());
                        Response.Redirect("~/Educator.aspx?");
                    }
                    else
                    {
                        PasEx.Text = "неверный пароль";
                    }
                }
                else
                {
                    LogEx.Text = "неверный логин";
                    conn.Close();
                    conn = new NpgsqlConnection(connString);
                    conn.Open();
                    query = string.Format("SELECT \"ID\" FROM \"Educators\" where \"Password\" = '{0}'", Passworde.Text);
                    cmd = new NpgsqlCommand(query, conn);
                    pgReader = cmd.ExecuteReader();
                    pgReader.Read();
                    if (pgReader.HasRows == false)
                    {
                        PasEx.Text = "неверный пароль";
                    }


                }
            }



            else if (Logine.Text == "" && Passworde.Text == "")
                LogPasEx.Text = "введите логин и пароль";
            else if (Logine.Text == "")
                LogEx.Text = "введите логин";
            else if (Passworde.Text == "")
                PasEx.Text = "введите пароль";



        }
    }
}