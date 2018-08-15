using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridLookup;
using DevExpress.Web.ASPxClasses;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){
    
    }

     protected void gridLookup_ValueChanged(object sender, EventArgs e) {
        SpecifyJSProperties(sender as ASPxGridLookup);
    }

    protected void gridLookup_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e) {
        SpecifyJSProperties(sender as ASPxGridLookup);
    }
    protected void SpecifyJSProperties(ASPxGridLookup gl) {
        if (gl.GridView.Selection.Count == gl.GridView.VisibleRowCount)
            gl.GridView.JSProperties["cp_selected"] = true;
    }

    protected void gridLookup_DataBound(object sender, EventArgs e) {
        if (!IsPostBack)
            (sender as ASPxGridLookup).GridView.Selection.SelectAll();
    }
}