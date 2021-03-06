unit uFrmSistemas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    imgCadCliente: TImage;
    lblTitulo: TLabel;
    procedure imgCadClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uFrmCadCliente;

{$R *.dfm}

procedure TfrmPrincipal.imgCadClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadCliente, FrmCadCliente);

  try
    frmCadCliente.ShowModal;
  finally
    FreeAndNil(frmCadCliente);
  end;
end;

end.
