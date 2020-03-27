program ADADApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'src\view\ufrmMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
