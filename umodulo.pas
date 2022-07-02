unit UModulo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ExtDlgs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSBuscaConta: TDataSource;
    DSConsTipoConta: TDataSource;
    DSConsUsuario: TDataSource;
    DSConsPessoas: TDataSource;
    DSConsLancamentos: TDataSource;
    DSConsCentro: TDataSource;
    DSConsBancarias: TDataSource;
    DSConsTransferencia: TDataSource;
    ZFinanceiro: TZConnection;
    ZQBuscaContaCODIGOTIP: TLongintField;
    ZQBuscaContaCONAGENCIA: TStringField;
    ZQBuscaContaCONCODIGO: TLongintField;
    ZQBuscaContaCONNOME: TStringField;
    ZQBuscaContaCONNUMERO_CONTA: TStringField;
    ZQBuscaContaCONSALDO_INICIAL: TFloatField;
    ZQBuscaContaCONSTATUS: TSmallintField;
    ZQBuscaContaTIPNOME: TStringField;
    ZQConsBancariasCODIGOTIP: TLongintField;
    ZQConsBancariasCONAGENCIA: TStringField;
    ZQConsBancariasCONCODIGO: TLongintField;
    ZQConsBancariasCONNOME: TStringField;
    ZQConsBancariasCONNUMERO_CONTA: TStringField;
    ZQConsBancariasCONSALDO_INICIAL: TFloatField;
    ZQConsBancariasCONSTATUS: TSmallintField;
    ZQConsCentroCENCODIGO: TLongintField;
    ZQConsCentroCENNOME: TStringField;
    ZQConsCentroCENSTATUS: TSmallintField;
    ZQConsCentroCODIGOTIP: TLongintField;
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
    ZQConsPessoasINSCRIOESTADUAL: TLongintField;
    ZQConsPessoasINSCRIOMUNICIPAL: TLongintField;
    ZQConsPessoasNMERO: TLongintField;
    ZQConsPessoasNOME: TStringField;
    ZQConsPessoasNOMEFANTASIA: TStringField;
    ZQConsPessoasOBSERVAO: TStringField;
    ZQConsPessoasSTATUS: TStringField;
    ZQConsPessoasTELEFONE: TStringField;
    ZQConsPessoasTIPO: TStringField;
    ZQConsTipoContaTIPCODIGO: TLongintField;
    ZQConsTipoContaTIPNOME: TStringField;
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
    ZQConsCentro: TZQuery;
    ZQConsLancamentos: TZQuery;
    ZQDelTransferencia: TZQuery;
    ZQConsUsuario: TZQuery;
    ZQCadUsuario: TZQuery;
    ZQCadLancamentos: TZQuery;
    ZQCadBancarias: TZQuery;
    ZQAltUsuario: TZQuery;
    ZQAltLancamentos: TZQuery;
    ZQAltCentro: TZQuery;
    ZQAltBancarias: TZQuery;
    ZQDelUsuario: TZQuery;
    ZQConsTipoConta: TZQuery;
    ZQConsPessoas: TZQuery;
    ZQCadCentro: TZQuery;
    ZQCadPessoas: TZQuery;
    ZQAltPessoas: TZQuery;
    ZQBuscaConta: TZQuery;
    ZQConsBancarias: TZQuery;
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

