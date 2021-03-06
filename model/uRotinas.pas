unit uRotinas;

interface

uses
  System.SysUtils;

type
 TRotinas = class
   public
     class function RetornaNumero(vpValor: string): string;
     class function ValidarCPF(vpCPF: string): Boolean;
     class function ValidarEMail(vpEmail: string): Boolean;
     class function FormatarCPF(vpCPF: string): string;
     class function FormatarTelefone(vpTelefone: string): string;
     class function FormatarCEP(vpCEP: string): string;
 end;

implementation

{ TRotinas }

class function TRotinas.FormatarCEP(vpCEP: string): string;
begin
  vpCEP := RetornaNumero(vpCEP);

  if vpCEP = EmptyStr then
    Result := vpCEP
  else
    if vpCEP.Length = 8 then
      Result := Copy(vpCEP, 1, 5) + '-' +
                Copy(vpCEP, 6, 3);
end;

class function TRotinas.FormatarCPF(vpCPF: string): string;
begin
  if Trim(vpCPF) = EmptyStr then
    Result := vpCPF
  else
    Result := Copy(vpCPF, 1, 3) + '.' +
              Copy(vpCPF, 4, 3) + '.' +
              Copy(vpCPF, 7, 3) + '-' +
              Copy(vpCPF, 10, 2);
end;

class function TRotinas.FormatarTelefone(vpTelefone: string): string;
begin
  vpTelefone := RetornaNumero(vpTelefone);

  if vpTelefone = EmptyStr then
    Result := vpTelefone
  else if Length(vpTelefone) = 8 then
      Result := Copy(vpTelefone, 1, 4) + '-' + Copy(vpTelefone, 5, 4)
  else if Length(vpTelefone) = 9 then
      Result := Copy(vpTelefone, 1, 5) + '-' + Copy(vpTelefone, 6, 4)
  else if Length(vpTelefone) = 11 then
  begin
      Result := '(' + Copy(vpTelefone, 1, 2) + ')' +
                      Copy(vpTelefone, 3, 5) + '-' +
                      Copy(vpTelefone, 8, 4);
  end;
end;

class function TRotinas.RetornaNumero(vpValor: string): string;
var
  i: Integer;
begin
  Result := '';

  for i := 1 to Length(vpValor) do
    if CharInSet(vpValor[i], ['0'..'9']) then
       Result := Result + vpValor[i];
end;

class function TRotinas.ValidarCPF(vpCPF: string): Boolean;
var
  n1: Integer;
  n2: Integer;
  n3: Integer;
  n4: Integer;
  n5: Integer;
  n6: Integer;
  n7: Integer;
  n8: Integer;
  n9: Integer;
  d1: Integer;
  d2: Integer;
  digitado: string;
  calculado: string;
begin
  n1 := StrToInt(vpCPF[1]);
  n2 := StrToInt(vpCPF[2]);
  n3 := StrToInt(vpCPF[3]);
  n4 := StrToInt(vpCPF[4]);
  n5 := StrToInt(vpCPF[5]);
  n6 := StrToInt(vpCPF[6]);
  n7 := StrToInt(vpCPF[7]);
  n8 := StrToInt(vpCPF[8]);
  n9 := StrToInt(vpCPF[9]);

  d1 := n9*2 + n8*3 + n7*4 + n6*5 + n5*6 + n4*7 + n3*8 + n2*9 + n1*10;
  d1 := 11-(d1 mod 11);

  if d1>=10 then
    d1:=0;

  d2:= d1*2 + n9*3 + n8*4 + n7*5 + n6*6 + n5*7 + n4*8 + n3*9 + n2*10 + n1*11;
  d2:= 11-(d2 mod 11);

  if d2>=10 then d2:=0;
    calculado:= IntToStr(d1) + IntToStr(d2);

  digitado := vpCPF[10] + vpCPF[11];
  Result := calculado = digitado;
end;


class function TRotinas.ValidarEMail(vpEmail: string): Boolean;
begin
 vpEmail := Trim(UpperCase(vpEmail));

 if Pos('@', vpEmail) > 1 then
 begin
   Delete(vpEmail, 1, pos('@', vpEmail));
   Result := (Length(vpEmail) > 0) and (Pos('.', vpEmail) > 2);
 end
 else
   Result := False;
end;

end.
