unit Sync.Utils;

interface

uses
  RESTRequest4D.Request.Intf, RESTRequest4D.Request, REST.Types, System.JSON,
  Data.DB, Connection.Provider;

type
  TSyncUtils = class
  private
    FRequest: IRequest;
    procedure GetEvents;
  public
    function SetDataSetAdapter(const ADataSet: TDataSet): IRequest;
    procedure Syncronizer;
    constructor Create;
    destructor Destroy; override;
    property Request: IRequest read FRequest write FRequest;
  end;

implementation

{ TSyncUtils }

uses
  Constant.Utils;

constructor TSyncUtils.Create;
begin
  Request := TRequest.Create;
  Request.SetBaseURL(sBASE_URL_SERVER);
end;

destructor TSyncUtils.Destroy;
begin
  Request := nil;
end;

procedure TSyncUtils.GetEvents;
begin
  ConnectionProvider.FDConnection.StartTransaction;
  try
    Request.SetMethod(rmGET);
    ConnectionProvider.FDConnection.ExecSQL('DELETE FROM event');
    SetDataSetAdapter(ConnectionProvider.qryEvent);
    Request.SetResource(sRESOURCE_NEXT_EVENTS);
    Request.Execute;
    ConnectionProvider.FDConnection.Commit;
    ConnectionProvider.qryEvent.Refresh;
  except
    ConnectionProvider.FDConnection.Rollback;
  end;
end;

function TSyncUtils.SetDataSetAdapter(const ADataSet: TDataSet): IRequest;
begin
  Result := Request.SetDataSetAdapter(ADataSet);
end;

procedure TSyncUtils.Syncronizer;
begin
  GetEvents;
end;

end.
