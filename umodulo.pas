unit UModulo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ExtDlgs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSConsTipoConta: TDataSource;
    DSConsUsuario: TDataSource;
    DSConsPessoas: TDataSource;
    DSConsLancamentos: TDataSource;
    DSConsCentro: TDataSource;
    DSConsBancarias: TDataSource;
    DSConsTransferencia: TDataSource;
    ZFinanceiro: TZConnection;
    ZQConsBancariasCODIGOTIP: TLongintField;
    ZQConsBancariasCONAGENCIA: TStringField;
    ZQConsBancariasCONCODIGO: TLongintField;
    ZQConsBancariasCONNOME: TStringField;
    ZQConsBancariasCONNUMERO_CONTA: TStringField;
    ZQConsBancariasCONSALDO_INICIAL: TFloatField;
    ZQConsBancariasCONSTATUS: TSmallintField;
    ZQConsFornCPFCODIGOTIP: TLongintField;
    ZQConsFornCPFPESBAIRRO: TStringField;
    ZQConsFornCPFPESCELULAR: TStringField;
    ZQConsFornCPFPESCEP: TStringField;
    ZQConsFornCPFPESCIDADE: TStringField;
    ZQConsFornCPFPESCNPJ: TStringField;
    ZQConsFornCPFPESCODIGO: TLongintField;
    ZQConsFornCPFPESCOMPLEMENTO: TStringField;
    ZQConsFornCPFPESCPF: TStringField;
    ZQConsFornCPFPESDATA_NASCIMENTO: TDateField;
    ZQConsFornCPFPESEMAIL: TStringField;
    ZQConsFornCPFPESENDERECO: TStringField;
    ZQConsFornCPFPESESTADO: TStringField;
    ZQConsFornCPFPESINSCRICACAO_MUNICIPAL: TLongintField;
    ZQConsFornCPFPESINSCRICAO_ESTADUAL: TLongintField;
    ZQConsFornCPFPESNOME: TStringField;
    ZQConsFornCPFPESNOME_FANTASIA: TStringField;
    ZQConsFornCPFPESNUMERO: TLongintField;
    ZQConsFornCPFPESOBSERVACAO: TStringField;
    ZQConsFornCPFPESRAZAO_SOCIAL: TStringField;
    ZQConsFornCPFPESSTATUS: TSmallintField;
    ZQConsFornCPFPESTELEFONE: TStringField;
    ZQConsPessoasATIVO: TSmallintField;
    ZQConsPessoasBAIRRO: TStringField;
    ZQConsPessoasCELULAR: TStringField;
    ZQConsPessoasCEP: TStringField;
    ZQConsPessoasCIDADE: TStringField;
    ZQConsPessoasCNPJ: TStringField;
    ZQConsPessoasCODIGO: TLongintField;
    ZQConsPessoasCODIGOTIP: TLongintField;
    ZQConsPessoasCOMPLEMENTO: TStringField;
    ZQConsPessoasCPF: TStringField;
    ZQConsPessoasDATANASCIMENTO: TDateField;
    ZQConsPessoasEMAIL: TStringField;
    ZQConsPessoasENDEREO: TStringField;
    ZQConsPessoasESTADO: TStringField;
    ZQConsPessoasINSCRICACAO_MUNICIPAL: TLongintField;
    ZQConsPessoasINSCRIOESTADUAL: TLongintField;
    ZQConsPessoasNMERO: TLongintField;
    ZQConsPessoasNOME: TStringField;
    ZQConsPessoasNOMEFANTASIA: TStringField;
    ZQConsPessoasOBSERVAO: TStringField;
    ZQConsPessoasRAZOSOCIAL: TStringField;
    ZQConsPessoasTELEFONE: TStringField;
    ZQConsPessoasTIPO: TStringField;
    ZQConsUsuarioCODIGONIV: TLongintField;
    ZQConsUsuarioUSUCODIGO: TLongintField;
    ZQConsUsuarioUSULOGIN: TStringField;
    ZQConsUsuarioUSUNOME: TStringField;
    ZQConsUsuarioUSUSENHA: TStringField;
    ZQConsUsuarioUSUSTATUS: TSmallintField;
    ZQDelBancarias: TZQuery;
    ZQDelCentro: TZQuery;
    ZQDelPessoas: TZQuery;
    ZQDelLancamentos: TZQuery;
    ZQConsTransferencia: TZQuery;
    ZQCadTransferencia: TZQuery;
    ZQAltTransferencia: TZQuery;
    ZQConsBancarias: TZQuery;
    ZQConsCentro: TZQuery;
    ZQConsLancamentos: TZQuery;
    ZQDelTransferencia: TZQuery;
    ZQConsUsuario: TZQuery;
    ZQCadUsuario: TZQuery;
    ZQCadLancamentos: TZQuery;
    ZQCadCentro: TZQuery;
    ZQCadBancarias: TZQuery;
    ZQAltUsuario: TZQuery;
    ZQAltLancamentos: TZQuery;
    ZQAltCentro: TZQuery;
    ZQAltBancarias: TZQuery;
    ZQDelUsuario: TZQuery;
    ZQCadPessoas: TZQuery;
    ZQConsTipoConta: TZQuery;
    ZQConsPessoas: TZQuery;
    ZQAltPessoas: TZQuery;
    procedure DSConsPessoasDataChange(Sender: TObject; Field: TField);


    procedure DataModuleCreate(Sender: TObject);
    procedure DSConsBancariasDataChange(Sender: TObject; Field: TField);
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.DSConsPessoasDataChange(Sender: TObject; Field: TField);
begin

end;

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDM.DSConsBancariasDataChange(Sender: TObject; Field: TField);
begin

end;

end.

