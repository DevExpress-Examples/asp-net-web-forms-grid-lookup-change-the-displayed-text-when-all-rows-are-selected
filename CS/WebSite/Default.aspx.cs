using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridLookup;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){
    
    }

    protected void gridLookup_ValueChanged(object sender, EventArgs e)
    {
        ASPxGridLookup gl = sender as ASPxGridLookup;
        if (gl.GridView.Selection.Count == gl.GridView.VisibleRowCount)
            gl.GridView.JSProperties["cp_selected"] = true;
    }
}