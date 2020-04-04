unit ufrmCalendar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  ufrmMenuLeft, FMX.Objects, FMX.Layouts, FMX.MultiView, FMX.Ani,
  FMX.Controls.Presentation, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmCalendar = class(TfrmMenuLeft)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    BindSourceDB1: TBindSourceDB;
    btnAdd: TCircle;
    lblAdd: TLabel;
    btnSync: TSpeedButton;
    lytMainWrapper: TLayout;
    lytNextEvent: TLayout;
    recNextEvent: TRectangle;
    lblNextEvent: TLabel;
    lblDescriptionEvent: TLabel;
    lblSelectedEvent: TLabel;
    lblDayOfWeek: TLabel;
    lblMonthYear: TLabel;
    lytListNextEvents: TLayout;
    lvNextEvents: TListView;
    lytMenuAdd: TLayout;
    recMenuAdd: TRectangle;
    AnimaMenuAdd: TFloatAnimation;
    btnAddPhoto: TCircle;
    iconCamera: TPath;
    btnEdit: TCircle;
    IconEdit: TPath;
    btnBookmark: TCircle;
    iconBookmark: TPath;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure AnimaMenuAddFinish(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure recMenuAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalendar: TfrmCalendar;

implementation

{$R *.fmx}

uses
  Sync.Utils;

procedure TfrmCalendar.AnimaMenuAddFinish(Sender: TObject);
begin
  if AnimaMenuAdd.Inverse then
    lytMenuAdd.Visible := False;
end;

procedure TfrmCalendar.btnAddClick(Sender: TObject);
begin
  lytMenuAdd.Position.Y := Height + 20;
  lytMenuAdd.Visible := True;

  AnimaMenuAdd.Inverse := False;
  AnimaMenuAdd.StartValue := Height + 20;
  AnimaMenuAdd.StopValue := 0;
  AnimaMenuAdd.Start;
end;

procedure TfrmCalendar.btnSyncClick(Sender: TObject);
var
  oSyncUtils: TSyncUtils;
begin
  oSyncUtils := TSyncUtils.Create;
  try
    oSyncUtils.Syncronizer;
  finally
    FreeAndNil(oSyncUtils);
  end;
end;

procedure TfrmCalendar.FormCreate(Sender: TObject);
begin
  lytMenuAdd.Visible := False;
end;

procedure TfrmCalendar.recMenuAddClick(Sender: TObject);
begin
  AnimaMenuAdd.Inverse := True;
  AnimaMenuAdd.Start;
end;

end.
