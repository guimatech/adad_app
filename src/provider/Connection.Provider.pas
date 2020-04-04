unit Connection.Provider;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.IOUtils, FireDAC.Comp.UI;

type
  TConnectionProvider = class(TDataModule)
    FDConnection: TFDConnection;
    qryEvent: TFDQuery;
    qryEventid: TIntegerField;
    qryEventdescription: TStringField;
    qryEventdate: TDateField;
    qryEventday: TWideStringField;
    qryEventdayOfWeek: TWideStringField;
    qryEventmonthOfyear: TWideStringField;
    link: TFDPhysSQLiteDriverLink;
    cursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConnectionProvider: TConnectionProvider;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TConnectionProvider.DataModuleCreate(Sender: TObject);
begin
  qryEvent.Open;
end;

procedure TConnectionProvider.FDConnectionBeforeConnect(Sender: TObject);
begin
{$IFDEF ANDROID || IOS}
  FDConnection.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'ADADApp.sdb');
{$ENDIF}
end;

end.
