Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxGridLookup

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub gridLookup_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
		Dim gl As ASPxGridLookup = TryCast(sender, ASPxGridLookup)
		If gl.GridView.Selection.Count = gl.GridView.VisibleRowCount Then
			gl.GridView.JSProperties("cp_selected") = True
		End If
	End Sub
End Class