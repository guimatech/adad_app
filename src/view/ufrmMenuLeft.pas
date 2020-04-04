unit ufrmMenuLeft;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.MultiView, FMX.Ani, FMX.Layouts,
  FMX.Objects;

type
  TfrmMenuLeft = class(TForm)
    btnMenuLeft: TSpeedButton;
    recMainMenu: TRectangle;
    scrollMenuLeft: TVertScrollBox;
    recCalendar: TRectangle;
    btnCalendar: TSpeedButton;
    lblCalendar: TLabel;
    lytIconCalendar: TLayout;
    iconCalendar: TPath;
    recClassRecordBook: TRectangle;
    btnClassRecordBook: TSpeedButton;
    lblClassRecordBook: TLabel;
    lytClassRecordBook: TLayout;
    iconClassRecordBook: TPath;
    recRegistrations: TRectangle;
    btnRegistrations: TSpeedButton;
    lblRegistrations: TLabel;
    lytRegistrations: TLayout;
    iconRegistrations: TPath;
    recProfileWrapper: TRectangle;
    lytTopProfile: TLayout;
    lytPhotoProfile: TLayout;
    recPhotoProfile: TCircle;
    lytCenterDetailProfile: TLayout;
    lblUser: TLabel;
    Label1: TLabel;
    mvMenuLeft: TMultiView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuLeft: TfrmMenuLeft;

implementation

{$R *.fmx}

end.
