using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quiz11_AspBlog
{
    public partial class Quiz : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"server=DAMLA\MYSERVER;database=Site;trusted_connection=true;");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlDataAdapter da = new SqlDataAdapter("select * from Konular", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            repeater_konu.DataSource = dt;
            repeater_konu.DataBind();

            SqlDataAdapter adtr = new SqlDataAdapter("select * from Sozler where sozID=@id", con);
            adtr.SelectCommand.Parameters.AddWithValue("id", DateTime.Now.Minute);
            DataTable soztb = new DataTable();
            adtr.Fill(soztb);
            repeater_soz.DataSource = soztb;
            repeater_soz.DataBind();

            SqlDataAdapter proadapter = new SqlDataAdapter("select * from Kisi", con);
            DataTable protb = new DataTable();
            proadapter.Fill(protb);
            repeater_profil.DataSource = protb;
            repeater_profil.DataBind();

          


        }

        protected void repeater_konu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int id = int.Parse((e.Item.DataItem as DataRowView).Row["konuID"].ToString());
            Repeater r = e.Item.FindControl("repeater_altkonu") as Repeater;
            SqlDataAdapter da = new SqlDataAdapter("select * from AltKonu where konuID=@id", con);
            da.SelectCommand.Parameters.AddWithValue("id", id);
            DataTable dt = new DataTable();
            da.Fill(dt);
            r.DataSource = dt;
            r.DataBind();
            
        }

        protected void repeater_profil_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int id =Convert.ToInt32((e.Item.DataItem as DataRowView).Row["kisiID"].ToString());
            //Repeater r = e.Item.FindControl("repeater_profilayrinti") as Repeater;
            SqlDataAdapter profadapter = new SqlDataAdapter("select * from Kisi k join Meslek m on k.meslekID=m.meslekID where kisiID=@id", con);
            //profadapter.SelectCommand.Parameters.AddWithValue("id", Session["kisiID"]);
            profadapter.SelectCommand.Parameters.AddWithValue("id",id);
            DataTable dt = new DataTable();
            profadapter.Fill(dt);
            repeater_profilayrinti.DataSource = dt;
            repeater_profilayrinti.DataBind();
        }


    }
}