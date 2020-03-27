unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  RESTRequest4D.Request.Intf, RESTRequest4D.Request, REST.Types, System.JSON,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmMain = class(TForm)
    lytMainWrapper: TLayout;
    lytNextEvent: TLayout;
    lytListNextEvents: TLayout;
    recNextEvent: TRectangle;
    lblNextEvent: TLabel;
    lblDescriptionEvent: TLabel;
    lblSelectedEvent: TLabel;
    lblDayOfTheWeek: TLabel;
    lblMonthYear: TLabel;
    lvNextEvents: TListView;
    tblEvents: TFDMemTable;
    tblEventsid: TIntegerField;
    tblEventsdescription: TStringField;
    tblEventsdate: TDateField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FRequest: IRequest;
  public
    property Request: IRequest read FRequest write FRequest;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Request := TRequest.Create;
  Request.SetBaseURL('http://localhost:9000');
  Request.SetDataSetAdapter(tblEvents);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Request := nil;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Request.SetMethod(rmGET);
  Request.SetResource('events');
  Request.Execute;
end;


end.
