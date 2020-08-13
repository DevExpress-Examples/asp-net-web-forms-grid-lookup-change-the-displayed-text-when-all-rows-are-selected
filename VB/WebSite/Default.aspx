<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function OnCheckedChanged(s, e) {
            if (s.GetChecked())
                lookup.GetGridView().SelectRows();
            else
                lookup.GetGridView().UnselectRows();

        }

                function OnEndCallback(s, e) {
            SetSelectAll(s);
        }

        function OnInit(s, e) {
            SetSelectAll(s);
        }

        function SetSelectAll(lookup) {
            if (lookup.GetGridView().cp_selected) {
                lookup.GetInputElement().value = "(Select All)";
                delete (lookup.GetGridView().cp_selected);
                cb.SetChecked(true);
            }
            else
                cb.SetChecked(false);
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <dx:ASPxGridLookup ID="gridLookup" runat="server" ClientInstanceName="lookup" KeyFieldName="CategoryID" DataSourceID="ads"
            SelectionMode="Multiple" Width="300px" OnCustomJSProperties="gridLookup_CustomJSProperties" OnDataBound="gridLookup_DataBound"
			OnValueChanged="gridLookup_ValueChanged" TextFormatString="{0}">
            <ClientSideEvents EndCallback="OnEndCallback" Init="OnInit" />
            <Columns>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" Width="20px">
                    <HeaderTemplate>
                        <dx:ASPxCheckBox ID="checkBoxSelectAll" runat="server" AutoPostBack="false"
                            ClientInstanceName="cb">
                            <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                        </dx:ASPxCheckBox>
                    </HeaderTemplate>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataColumn FieldName="CategoryName">
                    <HeaderTemplate>(Select All)</HeaderTemplate>
                    <Settings AllowSort="False" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Description" Visible="false">
                </dx:GridViewDataColumn>
            </Columns>
            <GridViewProperties>
                <SettingsPager NumericButtonCount="5">
                    <Summary Visible="false" />
                </SettingsPager>
            </GridViewProperties>
        </dx:ASPxGridLookup>

        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
    </form>
</body>
</html>