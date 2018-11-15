using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        public int count = 0; 
        DBC a = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                a.DT.Clear();
                a.ExcecuteQuery("select * from ProductTable t1 inner join CategoryTable t2 on t1.P_cat=t2.Cat_id");

                rptData.DataSource = a.DT;
                rptData.DataBind();

            }
        }
        protected void logout(object sender, EventArgs e)
        {
            
        }

        protected void refresh(object sender, EventArgs e)
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from ProductTable t1 inner join CategoryTable t2 on t1.P_cat=t2.Cat_id");

            rptData.DataSource = a.DT;
            rptData.DataBind();
        }
    }
}