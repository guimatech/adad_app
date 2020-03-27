unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Ani;

type
  TfrmMain = class(TForm)
    lytMainWrapper: TLayout;
    lytNextEvent: TLayout;
    lytListNextEvents: TLayout;
    recNextEvent: TRectangle;
    lblNextEvent: TLabel;
    lblDescriptionEvent: TLabel;
    lblSelectedEvent: TLabel;
    lblDayOfWeek: TLabel;
    lblMonthYear: TLabel;
    lvNextEvents: TListView;
    btnAdd: TCircle;
    lblAdd: TLabel;
    btnSync: TSpeedButton;
    btnMenuLeft: TSpeedButton;
    lytMenuAdd: TLayout;
    recMenuAdd: TRectangle;
    AnimaMenuAdd: TFloatAnimation;
    btnAddPhoto: TCircle;
    btnEdit: TCircle;
    btnBookmark: TCircle;
    iconCamera: TPath;
    iconBookmark: TPath;
    IconEdit: TPath;
    tblEvents: TFDMemTable;
    tblEventsid: TIntegerField;
    tblEventsdescription: TStringField;
    tblEventsdate: TDateField;
    tblEventsday: TStringField;
    tblEventsdayOfWeek: TStringField;
    tblEventsmonthOfyear: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure AnimaMenuAddFinish(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure recMenuAddClick(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  Sync.Utils;

procedure TfrmMain.AnimaMenuAddFinish(Sender: TObject);
begin
  if AnimaMenuAdd.Inverse then
    lytMenuAdd.Visible := False;
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
begin
  lytMenuAdd.Position.Y := frmMain.Height + 20;
  lytMenuAdd.Visible := True;

  AnimaMenuAdd.Inverse := False;
  AnimaMenuAdd.StartValue := frmMain.Height + 20;
  AnimaMenuAdd.StopValue := 0;
  AnimaMenuAdd.Start;
end;

procedure TfrmMain.btnSyncClick(Sender: TObject);
var
  oSyncUtils: TSyncUtils;
begin
  oSyncUtils := TSyncUtils.Create;
  try
    oSyncUtils.SetDataSetAdapter(tblEvents);
    oSyncUtils.Syncronizer;
  finally
    FreeAndNil(oSyncUtils);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  lytMenuAdd.Visible := False;
end;

procedure TfrmMain.recMenuAddClick(Sender: TObject);
begin
  AnimaMenuAdd.Inverse := True;
  AnimaMenuAdd.Start;
end;

end.
