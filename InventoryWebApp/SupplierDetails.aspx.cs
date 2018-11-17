using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InventoryWebApp
{
    public partial class SupplierDetails : System.Web.UI.Page
    {
        DBC a = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SearchSupplier();
            }
        }
       
        protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            Grid.CurrentPageIndex = e.NewPageIndex;
            this.SearchSupplier();
        }
        private void SearchSupplier()
        {
            using (a.conn)
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT S_name,S_address,S_phone,Balance From SupplierTable";
                    if (!string.IsNullOrEmpty(txtSupplierName.Text.Trim()))
                    {
                        sql += " WHERE S_name LIKE @S_name + '%'";
                        cmd.Parameters.AddWithValue("@S_name", txtSupplierName.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = a.conn;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Grid.DataSource = dt;
                        Grid.DataBind();
                    }
                }
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            this.SearchSupplier();
        }
        protected void logout(object sender, EventArgs e)
        {

        }
    }
}