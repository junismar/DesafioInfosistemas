program DesafioInfoSistemas;

uses
  Vcl.Forms,
  uFrmSistemas in 'view\uFrmSistemas.pas' {frmPrincipal},
  uFrmCadCliente in 'view\uFrmCadCliente.pas' {frmCadCliente},
  uModelCliente in 'model\uModelCliente.pas',
  uRotinas in 'model\uRotinas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
