unit uFrmCadCliente;

interface

uses
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  IPPeerClient,
  IdAttachmentFile,
  IdExplicitTLSClientServerBase,
  IdMessage,
  IdMessageClient,
  IdSMTP,
  IdSMTPBase,
  IdText,
  IniFiles,
  REST.Client,
  REST.Response.Adapter,
  System.Classes,
  System.JSON,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Mask,
  Vcl.Menus,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows,
  Xml.XMLDoc,
  Xml.XMLIntf,
  cxButtons,
  cxControls,
  cxGraphics,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxPC,
  dxBarBuiltInMenu,
  dxSkinOffice2007Silver,
  dxSkinsCore,
  dxSkinscxPCPainter,
  IdBaseComponent,
  IdComponent,
  IdHTTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdTCPClient,
  IdTCPConnection,
//REST.Authenticator.Simple,
//cxContainer,
//cxEdit,
//cxGroupBox,
  uModelCliente, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink;

type
  TfrmCadCliente = class(TForm)
    pnlPrincipal: TPanel;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtEmail: TEdit;
    edtMaskCPF: TMaskEdit;
    cxPageControl1: TcxPageControl;
    tbsEndereco: TcxTabSheet;
    tbsComplemento: TcxTabSheet;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    lblNumero: TLabel;
    lblBairro: TLabel;
    edtBairro: TEdit;
    edtCidade: TEdit;
    lblPais: TLabel;
    lblEstado: TLabel;
    lblCidade: TLabel;
    mmComplemento: TMemo;
    btnGravar: TcxButton;
    cxBtnCancelar: TcxButton;
    cbEstado: TComboBox;
    cbPais: TComboBox;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    edtMaskTelefone: TMaskEdit;
    edtMaskCep: TMaskEdit;
    procedure cxBtnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtMaskCPFExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure edtMaskCepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaskCepExit(Sender: TObject);
  private
    procedure Gravar;
    procedure LimparCampos;
    procedure ValidarDados;

    function EnviarEmail(vpCliente: TModelCliente): Boolean;
    function SalvarArqXml(vpCliente: TModelCliente): Boolean;
    function getPathArquivoXML: string;
  public

  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uRotinas;

{$R *.dfm}

const
  C_BRASIL = 30;
  C_ASSUNTO = 'Cadastro de Clientes!';

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
end;

function TfrmCadCliente.getPathArquivoXML: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'Cadastro.xml';
end;

procedure TfrmCadCliente.cxBtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCliente.edtEmailExit(Sender: TObject);
begin
  if (Trim(edtEmail.Text).Length > 0) and (not TRotinas.ValidarEMail(edtEmail.Text)) then
  begin
    Application.MessageBox('Inserir um email v?lido!', 'Aten??o', MB_OK);
    edtEmail.SetFocus;
  end;
end;

procedure TfrmCadCliente.edtMaskCepExit(Sender: TObject);
var
  viCep: string;
  viJson: TJSONObject;
begin
  viCep := TRotinas.RetornaNumero(edtMaskCep.Text);

  if viCep = EmptyStr then
    Exit;

  if Length(viCep) <> 8 then
  begin
    ShowMessage('CEP inv?lido!');
    edtMaskCep.SetFocus;
    Exit;
  end;

  RESTRequest.Resource := viCep + '/json';
  RESTRequest.Execute;

  if RESTRequest.Response.StatusCode <> 200 then
  begin
    ShowMessage('Erro ao consultar CEP!');
    Exit;
  end;

  if RESTRequest.Response.Content.IndexOf('erro') > 0 then
    ShowMessage('CEP n?o encontrado!')
  else
  begin
    edtNumero.Text := '';

    {
    // Com TFDMenTable achei mais pr?tico!

      edtLogradouro.Text := MemTable.FieldByName('logradouro').AsString;
      edtBairro.Text     := MemTable.FieldByName('bairro').AsString;
      edtCidade.Text     := MemTable.FieldByName('localidade').AsString;
      mmComplemento.Lines.Add(MemTable.FieldByName('complemento').AsString);
      cbEstado.Text      := MemTable.FieldByName('uf').AsString;
    }

    viJson := RESTRequest.Response.JSONValue as TJSONObject;

    if not Assigned(viJson) then
      Exit;

    try
      edtLogradouro.Text := viJson.values['logradouro'].value;
      edtBairro.Text     := viJson.values['bairro'].value;
      edtCidade.Text     := viJson.values['localidade'].value;
      mmComplemento.Lines.Add(viJson.values['complemento'].value);
      cbEstado.ItemIndex := cbEstado.Items.IndexOf(viJson.values['uf'].value);
    finally
       viJson := nil;
    end;
  end;
end;

procedure TfrmCadCliente.edtMaskCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    Key := VK_TAB;
end;

procedure TfrmCadCliente.edtMaskCPFExit(Sender: TObject);
begin
  if TRotinas.RetornaNumero(edtMaskCPF.Text).Length <> 11 then
    Exit;

  if not TRotinas.ValidarCPF(TRotinas.RetornaNumero(edtMaskCPF.Text)) then
  begin
    Application.MessageBox('Inserir um CPF v?lido!', 'Aten??o', MB_OK);
    edtMaskCPF.SetFocus;
  end;
end;

function TfrmCadCliente.EnviarEmail(
  vpCliente: TModelCliente): Boolean;
var
  viIniFile: TIniFile;
  viFrom: string;
  viBccList: string;
  viHost: string;
  viPort: Integer;
  viUserName: string;
  viPassword: string;
  viArquivoAnexo: string;
  viMsg: TIdMessage;
  viText: TIdText;
  viSMTP: TIdSMTP;
  viIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
begin
  viPort := 0;

  try
    viIniFile  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
    try
      viArquivoAnexo := getPathArquivoXML;

      // Cria??o e leitura do arquivo INI com as configura??es
      viFrom     := vpCliente.Email;
      viBccList  := viIniFile.ReadString('Email' , 'BccList'  , viBccList);
      viHost     := viIniFile.ReadString('Email' , 'Host'     , viHost);
      viPort     := viIniFile.ReadInteger('Email', 'Port'     , viPort);
      viUserName := viIniFile.ReadString('Email' , 'UserName' , viUserName);
      viPassword := viIniFile.ReadString('Email' , 'Password' , viPassword);

      // Configura os par?metros necess?rios para SSL
      viIdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      viIdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      viIdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      // Vari?vel referente a mensagem
      viMsg              := TIdMessage.Create(Self);
      viMsg.CharSet      := 'utf-8';
      viMsg.Encoding     := meMIME;
      viMsg.From.Name    := C_ASSUNTO;
      viMsg.From.Address := viFrom;
      viMsg.Priority     := mpNormal;
      viMsg.Subject      := C_ASSUNTO;

      // Add Destinat?rio(s)
      viMsg.Recipients.Add;
      viMsg.Recipients.EMailAddresses := vpCliente.Email;
      viMsg.CCList.EMailAddresses  := '';
      viMsg.BccList.EMailAddresses := viBccList;
      viMsg.BccList.EMailAddresses := ''; //C?pia Oculta

      // Corpo da mensagem
      viText := TIdText.Create(viMsg.MessageParts);
      viText.ContentType := 'text/html';
      viText.CharSet := 'ISO-8859-1';
      viText.Body.Text :=
      '<html>' +
      '<head>' +
      '<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">' +
      '</head><body>' +
      '<p><h3>Cadastro Realizado com Sucesso na InfoSistemas!</h3></p><br>' +
      '<b>Nome:</b> ' + vpCliente.nome + '<br>' +
      '<b>Identidade:</b> ' + vpCliente.identidade + '<br>' +
      '<b>CPF:</b> ' + TRotinas.FormatarCPF(vpCliente.CPF) + '<br>' +
      '<b>Telefone:</b> ' + TRotinas.FormatarTelefone(vpCliente.Telefone) + '<br>' +
      '<b>Email:</b> ' + vpCliente.Email + '<br>' +
      '<b>CEP:</b> ' + TRotinas.FormatarCEP(vpCliente.Cep) + '<br>' +
      '<b>Pais:</b> ' + vpCliente.Pais + '<br>' +
      '<b>Logradouro:</b> ' + vpCliente.Logradouro + '<br>' +
      '<b>N?mero:</b> ' + vpCliente.Numero + '<br>' +
      '<b>Bairro:</b> ' + vpCliente.Bairro + '<br>' +
      '<b>Cidade:</b> ' + vpCliente.Cidade + '<br>' +
      '<b>Estado:</b> ' + vpCliente.Estado + '<br>' +
      '</body>' +
      '</html>';

      // Prepara o Servidor
      viSMTP            := TIdSMTP.Create(Self);
      viSMTP.IOHandler  := viIdSSLIOHandlerSocket;
      viSMTP.UseTLS     := utUseImplicitTLS;
      viSMTP.AuthType   := satDefault;
      viSMTP.Host       := viHost;
      viSMTP.AuthType   := satDefault;
      viSMTP.Port       := viPort;
      viSMTP.Username   := viUserName;
      viSMTP.Password   := viPassword;

      // Conecta e Autentica
      viSMTP.Connect;
      viSMTP.Authenticate;

      if (viArquivoAnexo <> EmptyStr) and (FileExists(viArquivoAnexo)) then
        TIdAttachmentFile.Create(viMsg.MessageParts, viArquivoAnexo);

      // Se a conex?o foi bem sucedida, envia a mensagem
      if viSMTP.Connected then
      begin
        try
          viSMTP.Send(viMsg);
        except on E:Exception do
          begin
            Application.MessageBox(PChar('Erro ao tentar enviar: ' + E.Message), 'Alerta', MB_OK);
          end;
        end;
      end;

      // Depois de tudo pronto, desconecta do servidor SMTP
      if viSMTP.Connected then
        viSMTP.Disconnect;

      Result := True;
    finally
      viIniFile.Free;
      UnLoadOpenSSLLibrary;

      FreeAndNil(viMsg);
      FreeAndNil(viIdSSLIOHandlerSocket);
      FreeAndNil(viSMTP);
    end;
  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  cbPais.ItemIndex := C_BRASIL;
end;

procedure TfrmCadCliente.Gravar;
var
  viCli: TModelCliente;
begin
  viCli := TModelCliente.Create;

  try
    viCli.nome := edtNome.Text;
    viCli.identidade := edtIdentidade.Text;
    viCli.CPF        := TRotinas.RetornaNumero(edtMaskCPF.Text);
    viCli.Telefone   := TRotinas.RetornaNumero(edtMaskTelefone.Text);
    viCli.Email      := edtEmail.Text;
    viCli.Cep        := TRotinas.RetornaNumero(edtMaskCEP.Text);
    viCli.Pais       := cbPais.Text;
    viCli.Logradouro := edtLogradouro.Text;
    viCli.Numero     := edtNumero.Text;
    viCli.Bairro     := edtBairro.Text;
    viCli.Cidade     := edtCidade.Text;
    viCli.Estado     := cbEstado.Text;
    viCli.Complemento := mmComplemento.Lines.ToString;

    try
      if SalvarArqXml(viCli) then
        if EnviarEmail(viCli) then
        begin
          Application.MessageBox(
            'Cadastro realizado com sucesso!' + sLineBreak +
            'Foi enviado uma c?pia de confirma??o para seu email!', 'Alerta', MB_OK);
          LimparCampos;
        end;
    except on E: Exception do
      begin
        Application.MessageBox(PChar(E.Message), 'Erro', MB_OK);
      end;
    end;
  finally
    viCli.Free;
  end;
end;

procedure TfrmCadCliente.LimparCampos;
begin
  edtNome.Clear;
  edtIdentidade.Clear;
  edtMaskCPF.Clear;
  edtMaskTelefone.Clear;
  edtEmail.Clear;
  edtMaskCep.Clear;
  cbPais.ItemIndex := C_BRASIL;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  edtCidade.Clear;
  cbEstado.ItemIndex := -1;
  cbEstado.Refresh;
  mmComplemento.Lines.Clear;
  edtNome.SetFocus;
end;

function TfrmCadCliente.SalvarArqXml(vpCliente: TModelCliente): Boolean;
var
  viPathArquivoXML: string;
  XMLDocument: TXMLDocument;
  NodeCep: IXMLNode;
begin
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;
    NodeCep := XMLDocument.AddChild('xmlcep');
    NodeCep.ChildValues['cep']         := vpCliente.cep;

    if Trim(vpCliente.Numero).IsEmpty then
      NodeCep.ChildValues['logradouro']  := vpCliente.Logradouro
    else
      NodeCep.ChildValues['logradouro']  := vpCliente.Logradouro + ' N? ' +
                                            vpCliente.Numero;

    NodeCep.ChildValues['complemento'] := vpCliente.Complemento;
    NodeCep.ChildValues['bairro']      := vpCliente.bairro;
    NodeCep.ChildValues['localidade']  := vpCliente.cidade;
    NodeCep.ChildValues['uf']          := vpCliente.Estado;
    NodeCep.ChildValues['ibge']        := '';
    NodeCep.ChildValues['gia']         := '';
    NodeCep.ChildValues['ddd']         := '';
    NodeCep.ChildValues['siafi']       := '';

    viPathArquivoXML := getPathArquivoXML;

    if FileExists(viPathArquivoXML) then
      DeleteFile(Pchar(viPathArquivoXML));

    XMLDocument.SaveToFile(viPathArquivoXML);
    Result := FileExists(viPathArquivoXML);
  finally
    XMLDocument.Free;
  end;
end;

procedure TfrmCadCliente.ValidarDados;
begin
  if Trim(edtEmail.Text) = EmptyStr then
  begin
    Application.MessageBox('Informe um endere?o de email v?lido!', 'Alerta', MB_OK);
    edtEmail.SetFocus;
    Abort;
  end;

end;

end.
