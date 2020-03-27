program ADADApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'src\view\ufrmMain.pas' {frmMain},
  Sync.Utils in 'src\utils\Sync.Utils.pas',
  Constant.Utils in 'src\utils\Constant.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
