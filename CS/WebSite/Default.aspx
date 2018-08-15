<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
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
            if (s.GetGridView().cp_selected) {
                s.GetInputElement().value = "(Select All)";
                delete (s.GetGridView().cp_selected);
            }
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <dx:ASPxGridLookup ID="gridLookup" runat="server" ClientInstanceName="lookup" KeyFieldName="CategoryID" DataSourceID="ads"
            SelectionMode="Multiple" Width="300px" OnValueChanged="gridLookup_ValueChanged" TextFormatString="{0}">

            <ClientSideEvents EndCallback="OnEndCallback" />
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
