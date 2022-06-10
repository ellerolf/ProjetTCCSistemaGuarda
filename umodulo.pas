unit UModulo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ExtDlgs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
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
    ZQConsFornCNPJ: TZQuery;
    ZQConsLancamentos: TZQuery;
    ZQDelTransferencia: TZQuery;
    ZQConsUsuario: TZQuery;
    ZQCadUsuario: TZQuery;
    ZQCadFornCNPJ: TZQuery;
    ZQCadLancamentos: TZQuery;
    ZQCadCentro: TZQuery;
    ZQCadBancarias: TZQuery;
    ZQAltUsuario: TZQuery;
    ZQAltFornCNPJ: TZQuery;
    ZQAltLancamentos: TZQuery;
    ZQAltCentro: TZQuery;
    ZQAltBancarias: TZQuery;
    ZQDelUsuario: TZQuery;
    ZQCadFornCPF: TZQuery;
    ZQAltFornCPF: TZQuery;
    ZQConsFornCPF: TZQuery;
    ZQDelFornCPF: TZQuery;
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

