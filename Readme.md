<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128530864/13.1.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4862)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridLookup - How to change the displayed text when all rows are selected
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4862/)**
<!-- run online end -->


<p>This example illustrates how to display a custom text inside ASPxGridLookup when all rows are selected.</p><br />
<p>To implement this scenario, perform the following steps:</p><br />
<p>Handle the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsASPxEdit_ValueChangedtopic">ASPxGridLookup.ValueChanged</a> event to pass some flag to the client side based on the lookup selection:</p><p><br />


```js
    protected void gridLookup_ValueChanged(object sender, EventArgs e)
    {
        ASPxGridLookup gl = sender as ASPxGridLookup;
        if (gl.GridView.Selection.Count == gl.GridView.VisibleRowCount)
            gl.GridView.JSProperties["cp_selected"] = true;
    }

```

 </p><p>Then handle the client-side EndCallback event and set a custom text if our flag has the "true" value (i.e. all rows are selected):</p><br />


```js
        function OnEndCallback(s, e) {
            if (s.GetGridView().cp_selected) {
                s.GetInputElement().value = "(Select All)";
                delete (s.GetGridView().cp_selected);
            }
        }
```

<p> </p>

<br/>


