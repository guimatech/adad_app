program ADADApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  Sync.Utils in 'src\utils\Sync.Utils.pas',
  Constant.Utils in 'src\utils\Constant.Utils.pas',
  Connection.Provider in 'src\provider\Connection.Provider.pas' {ConnectionProvider: TDataModule},
  ufrmMenuLeft in 'src\view\ufrmMenuLeft.pas' {frmMenuLeft},
  ufrmCalendar in 'src\view\ufrmCalendar.pas' {frmCalendar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TConnectionProvider, ConnectionProvider);
  Application.CreateForm(TfrmCalendar, frmCalendar);
  Application.Run;
end.
