unit UModulo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ExtDlgs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSConsTipoConta: TDataSource;
    DSConsFornCPF: TDataSource;
    DSConsUsuario: TDataSource;
    DSConsFornCNPJ: TDataSource;
    DSConsLancamentos: TDataSource;
    DSConsCentro: TDataSource;
    DSConsBancarias: TDataSource;
    DSConsTransferencia: TDataSource;
    ZFinanceiro: TZConnection;
    ZQConsFornCNPJCODIGOTIP: TLongintField;
    ZQConsFornCNPJPESBAIRRO: TStringField;
    ZQConsFornCNPJPESCELULAR: TStringField;
    ZQConsFornCNPJPESCEP: TStringField;
    ZQConsFornCNPJPESCIDADE: TStringField;
    ZQConsFornCNPJPESCNPJ: TStringField;
    ZQConsFornCNPJPESCODIGO: TLongintField;
    ZQConsFornCNPJPESCOMPLEMENTO: TStringField;
    ZQConsFornCNPJPESCPF: TStringField;
    ZQConsFornCNPJPESDATA_NASCIMENTO: TDateField;
    ZQConsFornCNPJPESEMAIL: TStringField;
    ZQConsFornCNPJPESENDERECO: TStringField;
    ZQConsFornCNPJPESESTADO: TStringField;
    ZQConsFornCNPJPESINSCRICACAO_MUNICIPAL: TLongintField;
    ZQConsFornCNPJPESINSCRICAO_ESTADUAL: TLongintField;
    ZQConsFornCNPJPESNOME: TStringField;
    ZQConsFornCNPJPESNOME_FANTASIA: TStringField;
    ZQConsFornCNPJPESNUMERO: TLongintField;
    ZQConsFornCNPJPESOBSERVACAO: TStringField;
    ZQConsFornCNPJPESRAZAO_SOCIAL: TStringField;
    ZQConsFornCNPJPESSTATUS: TSmallintField;
    ZQConsFornCNPJPESTELEFONE: TStringField;
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
    ZQConsUsuarioCODIGONIV: TLongintField;
    ZQConsUsuarioUSUCODIGO: TLongintField;
    ZQConsUsuarioUSULOGIN: TStringField;
    ZQConsUsuarioUSUNOME: TStringField;
    ZQConsUsuarioUSUSENHA: TStringField;
    ZQConsUsuarioUSUSTATUS: TSmallintField;
    ZQDelBancarias: TZQuery;
    ZQDelCentro: TZQuery;
    ZQDelFornCNPJ: TZQuery;
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
    ZQConsFornCPF: TZQuery;
    ZQDelFornCPF: TZQuery;
    ZQCadFornCNPJ: TZQuery;
    ZQConsTipoConta: TZQuery;
    ZQConsFornCNPJ: TZQuery;
    ZQCadFornCPF: TZQuery;
    ZQAltFornCPF: TZQuery;
    ZQAltFonrCNPJ: TZQuery;
    procedure DSConsFornCNPJDataChange(Sender: TObject; Field: TField);


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

procedure TDM.DSConsFornCNPJDataChange(Sender: TObject; Field: TField);
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

