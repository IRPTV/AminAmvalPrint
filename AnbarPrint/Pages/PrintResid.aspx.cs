using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnbarPrint.MyDBTableAdapters;
using System.IO;
using System.Text.RegularExpressions;

namespace AnbarPrint.Pages
{
    public partial class PrintResid : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            this.EnableViewState = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
          
            string Condition = Request.QueryString["Query"].ToString();
            AmvalTableAdapter Am_Ta = new AmvalTableAdapter();
            MyDB.AmvalDataTable Am_Dt = Am_Ta.Resid_Search(Condition);

            if(Am_Dt.Rows.Count>0)
            {
                LblNoData.Visible = false;
            }

            GridView1.DataSource = Am_Dt;
            GridView1.DataBind();
            GridView2.DataSource = Am_Dt;
            GridView2.DataBind();
        }
        protected override void Render(HtmlTextWriter output)
        {
            StringWriter stringWriter = new StringWriter();

            HtmlTextWriter textWriter = new HtmlTextWriter(stringWriter);
            base.Render(textWriter);

            textWriter.Close();

            string strOutput = stringWriter.GetStringBuilder().ToString();

            strOutput = Regex.Replace(strOutput, "<input[^>]*id=\"__VIEWSTATE\"[^>]*>", "", RegexOptions.Singleline);
            strOutput = Regex.Replace(strOutput, "<input[^>]*id=\"__VIEWSTATEENCRYPTED\"[^>]*>", "", RegexOptions.Singleline);

            

            output.Write(strOutput);
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {


            //GridView2.DataKeys[0].Value.ToString();
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                Label LblVal = (Label)GridView2.Rows[i].FindControl("LblIDResid");
                AmvalTableAdapter Am_Ta = new AmvalTableAdapter();
                MyDB.AmvalDataTable Am_Dt = Am_Ta.Resid_Details_ByRSDID(int.Parse(LblVal.Text));

                GridView Gr = (GridView)GridView2.Rows[i].FindControl("GridView3");
                Gr.DataSource = Am_Dt;
                Gr.DataBind();
            }

        }

    }
}