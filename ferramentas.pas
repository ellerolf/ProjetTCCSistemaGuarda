unit Ferramentas; {$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Math;

type

  { TSimpl }

  TSimpl = class
    function SoValor(Key: char; PermiteNegativo: Boolean = False): char;
    function FormataValor(AValue: currency; APrecisao: byte; APontoMilhar: boolean = False): string; overload;
    function FormataValor(AValue: String; APrecisao: byte; APontoMilhar: boolean = False): string; overload;
    function Arredonda(AValue: currency; APrecisao: byte): currency;
  end;

  var
    Simpl: TSimpl;

implementation

//================================= SO VALOR =================================\\
function TSimpl.SoValor(Key: char; PermiteNegativo: Boolean): char;
begin
  if (key in ['0'..'9', ',', #8, #13]) then
    Result := key
  else if (key = '.') then
    Result := ','
  else if(PermiteNegativo) and (Key = '-') then
    Result := key
  else
    Result := #0;
end;

//============================== FORMATA VALOR ===============================\\
function TSimpl.FormataValor(AValue: currency; APrecisao: byte; APontoMilhar: boolean): string;
var
  auxValor: currency;
begin
  if (APrecisao > 4) then
    raise Exception.Create('Não é permitido precisão para arrendoamento maior que 4!');

  try
    auxValor := AValue;

    case APrecisao of
      0: auxValor := Arredonda(auxValor, 0);
      1: auxValor := Arredonda(auxValor, 1);
      2: auxValor := Arredonda(auxValor, 2);
      3: auxValor := Arredonda(auxValor, 3);
      4: auxValor := Arredonda(auxValor, 4);
    end;
  except
    case APrecisao of
      0: Result := '0';
      1: Result := '0,0';
      2: Result := '0,00';
      3: Result := '0,000';
      4: Result := '0,0000';
    end;
    Exit;
  end;

  if (APontoMilhar) then
  begin
    case APrecisao of
      0: Result := FormatCurr('#,###,##0', auxValor);
      1: Result := FormatCurr('#,###,##0.0', auxValor);
      2: Result := FormatCurr('#,###,##0.00', auxValor);
      3: Result := FormatCurr('#,###,##0.000', auxValor);
      4: Result := FormatCurr('#,###,##0.0000', auxValor);
    end;
  end
  else
  begin
    case APrecisao of
      0: Result := FormatCurr('#0', auxValor);
      1: Result := FormatCurr('#0.0', auxValor);
      2: Result := FormatCurr('#0.00', auxValor);
      3: Result := FormatCurr('#0.000', auxValor);
      4: Result := FormatCurr('#0.0000', auxValor);
    end;
  end;
end;

//============================== FORMATA VALOR ===============================\\
function TSimpl.FormataValor(AValue: String; APrecisao: byte; APontoMilhar: boolean): string;
begin
  try
    Result := FormataValor(StrToCurr(AValue),APrecisao, APontoMilhar);
  except
    Result := FormataValor(0,APrecisao,APontoMilhar);
  end;
end;

//================================ ARREDONDA =================================\\
function TSimpl.Arredonda(AValue: currency; APrecisao: byte): currency;
begin
if (APrecisao > 4) then
    raise Exception.Create('Não é permitido precisão para arrendoamento maior que 4!');

  case APrecisao of
    0: Result := round(AValue);
    1: Result := RoundTo(AValue, -1);
    2: Result := RoundTo(AValue, -2);
    3: Result := RoundTo(AValue, -3);
    4: Result := RoundTo(AValue, -4);
  end;
end;

//============================================================================\\
end.

