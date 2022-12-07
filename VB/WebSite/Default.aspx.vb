Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

     Protected Sub gridLookup_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
        SpecifyJSProperties(TryCast(sender, ASPxGridLookup))
     End Sub

    Protected Sub gridLookup_CustomJSProperties(ByVal sender As Object, ByVal e As CustomJSPropertiesEventArgs)
        SpecifyJSProperties(TryCast(sender, ASPxGridLookup))
    End Sub
    Protected Sub SpecifyJSProperties(ByVal gl As ASPxGridLookup)
        If gl.GridView.Selection.Count = gl.GridView.VisibleRowCount Then
            gl.GridView.JSProperties("cp_selected") = True
        End If
    End Sub

    Protected Sub gridLookup_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack Then
            TryCast(sender, ASPxGridLookup).GridView.Selection.SelectAll()
        End If
    End Sub
End Class