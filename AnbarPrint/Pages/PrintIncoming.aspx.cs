using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnbarPrint.MyDBTableAdapters;

namespace AnbarPrint.Pages
{
    public partial class PrintIncoming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string Condition = "";

            try
            {
                Condition = Request.QueryString["Query"].ToString();
            }
            catch 
            {
               
            }
               
          //  LblTest.Text = Condition;
            try
            {
                AmvalTableAdapter Am_Ta = new AmvalTableAdapter();
                MyDB.AmvalDataTable Am_Dt = Am_Ta.Incoming_Search(Condition);
                GridView1.DataSource = Am_Dt;
                GridView1.DataBind();
            }
            catch 
            {
                
            }
          
        }
    }
}