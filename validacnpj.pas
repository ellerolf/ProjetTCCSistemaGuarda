unit ValidaCNPJ;

interface
function isCNPJ(CNPJ: string): boolean;
function imprimeCNPJ(CNPJ: string): string;

implementation
uses SysUtils; // necessário para utilizar a função "StrToInt"

function isCNPJ(CNPJ: string): boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14))
     then begin
            isCNPJ := false;
            exit;
          end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14]))
       then isCNPJ := true
    else isCNPJ := false;
  except
    isCNPJ := false
  end;
end;

function imprimeCNPJ(CNPJ: string): string;
begin
{ máscara do CNPJ: 99.999.999.9999-99 }
  imprimeCNPJ := copy(CNPJ, 1, 2) + '.' + copy(CNPJ, 3, 3) + '.' +
    copy(CNPJ, 6, 3) + '.' + copy(CNPJ, 9, 4) + '-' + copy(CNPJ, 13, 2);
end;

end.
