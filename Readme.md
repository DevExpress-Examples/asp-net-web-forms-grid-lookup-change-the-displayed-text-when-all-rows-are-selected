<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128530864/13.1.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4862)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->

# GridLookup for ASP.NET Web Forms - How to display a custom text when all rows are selected

This example illustrates how to display a custom text inside [ASPxGridLookup](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridLookup) when all its rows are selected.

![Custom Select All Text](select-all.png)

To implement this scenario, follow the steps below:

1. Handle the [ASPxGridLookup.ValueChanged](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxEdit.ValueChanged) event to pass a flag to the client. The flag indicates whether all rows are selected.

    ```js
    protected void gridLookup_ValueChanged(object sender, EventArgs e)
    {
        ASPxGridLookup gl = sender as ASPxGridLookup;
        if (gl.GridView.Selection.Count == gl.GridView.VisibleRowCount)
            gl.GridView.JSProperties["cp_selected"] = true;
    }

    ```

2. On the client, handle the [ASPxClientGridLookup.EndCallback](https://docs.devexpress.com/AspNet/js-ASPxClientGridLookup.EndCallback) event and specify a custom text if the flag returns true.


    ```js
    function OnEndCallback(s, e) {
        if (s.GetGridView().cp_selected) {
            s.GetInputElement().value = "(Select All)";
            delete (s.GetGridView().cp_selected);
        }
    }
    ```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-lookup-change-the-displayed-text-when-all-rows-are-selected&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-lookup-change-the-displayed-text-when-all-rows-are-selected&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
