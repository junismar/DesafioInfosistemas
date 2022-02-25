unit uModelCliente;

interface

type
  TModelCliente = class(TObject)

  private
    FNome: string;
    FIdentidade: string;
    FCPF: string;
    FTelefone: string;
    FEmail: string;
    FEndereco: string;
    FCep: string;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FEstado: string;
    FPais: string;

  protected
    function getNome: string;
    procedure setNome(const value: string);

    function getIdentidade: string;
    procedure setIdentidade(const value: string);

    function getCPF: string;
    procedure setCPF(const value: string);

    function getTelefone: string;
    procedure setTelefone(const value: string);

    function getEmail: string;
    procedure setEmail(const value: string);

    function getEndereco: string;
    procedure setEndereco(const value: string);

    function getCep: string;
    procedure setCep(const value: string);

    function getLogradouro: string;
    procedure setLogradouro(const value: string);

    function getNumero: string;
    procedure setNumero(const value: string);

    function getComplemento: string;
    procedure setComplemento(const value: string);

    function getBairro: string;
    procedure setBairro(const value: string);

    function getCidade: string;
    procedure setCidade(const value: string);

    function getEstado: string;
    procedure setEstado(const value: string);

    function getPais: string;
    procedure setPais(const value: string);
  public
    property nome: string read getNome write setNome;
    property identidade:  string read getIdentidade write setIdentidade;
    property CPF:  string read getCPF write setCPF;
    property Telefone:  string read getTelefone write setTelefone;
    property Email:  string read getEmail write setEmail;
    property Endereco:  string read getEndereco write setEndereco;
    property Cep:  string read getCep write setCep;
    property Logradouro:  string read getLogradouro write setLogradouro;
    property Numero:  string read getNumero write setNumero;
    property Complemento:  string read getComplemento write setComplemento;
    property Bairro:  string read getBairro write setBairro;
    property Cidade: string read getCidade write setCidade;
    property Estado:  string read getEstado write setEstado;
    property Pais:  string read getPais write setPais;
end;

implementation

{ TModelCliente }

function TModelCliente.getBairro: string;
begin
  Result := FBairro;
end;

function TModelCliente.getCep: string;
begin
  Result := FCep;
end;

function TModelCliente.getCidade: string;
begin
  Result := FCidade;
end;

function TModelCliente.getComplemento: string;
begin
  Result := FComplemento;
end;

function TModelCliente.getCPF: string;
begin
  Result := FCPF;
end;

function TModelCliente.getEmail: string;
begin
  Result := FEmail;
end;

function TModelCliente.getEndereco: string;
begin
  Result := FEndereco;
end;

function TModelCliente.getEstado: string;
begin
  Result := FEstado;
end;

function TModelCliente.getIdentidade: string;
begin
  Result := FIdentidade;
end;

function TModelCliente.getLogradouro: string;
begin
  Result := FLogradouro;
end;

function TModelCliente.getNome: string;
begin
  Result := FNome;
end;

function TModelCliente.getNumero: string;
begin
  Result := FNumero;
end;

function TModelCliente.getPais: string;
begin
  Result := FPais;
end;

function TModelCliente.getTelefone: string;
begin
  Result := FTelefone;
end;

procedure TModelCliente.setBairro(const value: string);
begin
  FBairro := value;
end;

procedure TModelCliente.setCep(const value: string);
begin
  FCep := value;
end;

procedure TModelCliente.setCidade(const value: string);
begin
  FCidade := value;
end;

procedure TModelCliente.setComplemento(const value: string);
begin
  FComplemento := value;
end;

procedure TModelCliente.setCPF(const value: string);
begin
  FCPF := value;
end;

procedure TModelCliente.setEmail(const value: string);
begin
  FEmail := value;
end;

procedure TModelCliente.setEndereco(const value: string);
begin
  FEndereco := value;
end;

procedure TModelCliente.setEstado(const value: string);
begin
  FEstado := value;
end;

procedure TModelCliente.setIdentidade(const value: string);
begin
  FIdentidade := value;
end;

procedure TModelCliente.setLogradouro(const value: string);
begin
  FLogradouro := value;
end;

procedure TModelCliente.setNome(const value: string);
begin
  FNome := value;
end;

procedure TModelCliente.setNumero(const value: string);
begin
  FNumero := value;
end;

procedure TModelCliente.setPais(const value: string);
begin
  FPais := value;
end;

procedure TModelCliente.setTelefone(const value: string);
begin
  FTelefone := value;
end;

end.
