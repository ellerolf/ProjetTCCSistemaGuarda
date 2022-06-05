unit UModulo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ExtDlgs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSConsUsuario: TDataSource;
    DSConsForncedores: TDataSource;
    DSConsLancamentos: TDataSource;
    DSConsCentro: TDataSource;
    DSConsBancarias: TDataSource;
    DSConsTransferencia: TDataSource;
    ZFinanceiro: TZConnection;
    ZQConsForncedoresCODIGOTIP: TLongintField;
    ZQConsForncedoresPESBAIRRO: TStringField;
    ZQConsForncedoresPESCELULAR: TStringField;
    ZQConsForncedoresPESCEP: TStringField;
    ZQConsForncedoresPESCIDADE: TStringField;
    ZQConsForncedoresPESCNPJ: TStringField;
    ZQConsForncedoresPESCODIGO: TLongintField;
    ZQConsForncedoresPESCOMPLEMENTO: TStringField;
    ZQConsForncedoresPESCPF: TStringField;
    ZQConsForncedoresPESDATA_NASCIMENTO: TDateField;
    ZQConsForncedoresPESEMAIL: TStringField;
    ZQConsForncedoresPESENDERECO: TStringField;
    ZQConsForncedoresPESESTADO: TStringField;
    ZQConsForncedoresPESINSCRICACAO_MUNICIPAL: TLongintField;
    ZQConsForncedoresPESINSCRICAO_ESTADUAL: TLongintField;
    ZQConsForncedoresPESNOME: TStringField;
    ZQConsForncedoresPESNOME_FANTASIA: TStringField;
    ZQConsForncedoresPESNUMERO: TLongintField;
    ZQConsForncedoresPESOBSERVACAO: TStringField;
    ZQConsForncedoresPESRAZAO_SOCIAL: TStringField;
    ZQConsForncedoresPESSTATUS: TSmallintField;
    ZQConsForncedoresPESTELEFONE: TStringField;
    ZQConsBancariasCODIGOTIP: TLongintField;
    ZQConsBancariasCONAGENCIA: TStringField;
    ZQConsBancariasCONCODIGO: TLongintField;
    ZQConsBancariasCONNOME: TStringField;
    ZQConsBancariasCONNUMERO_CONTA: TStringField;
    ZQConsBancariasCONSALDO_INICIAL: TFloatField;
    ZQConsBancariasCONSTATUS: TSmallintField;
    ZQDelBancarias: TZQuery;
    ZQDelCentro: TZQuery;
    ZQDelForncedores: TZQuery;
    ZQDelLancamentos: TZQuery;
    ZQConsTransferencia: TZQuery;
    ZQCadTransferencia: TZQuery;
    ZQAltTransferencia: TZQuery;
    ZQConsBancarias: TZQuery;
    ZQConsCentro: TZQuery;
    ZQConsForncedores: TZQuery;
    ZQConsLancamentos: TZQuery;
    ZQDelTransferencia: TZQuery;
    ZQConsUsuario: TZQuery;
    ZQCadUsuario: TZQuery;
    ZQCadFornecedores: TZQuery;
    ZQCadLancamentos: TZQuery;
    ZQCadCentro: TZQuery;
    ZQCadBancarias: TZQuery;
    ZQAltUsuario: TZQuery;
    ZQAltForncedores: TZQuery;
    ZQAltLancamentos: TZQuery;
    ZQAltCentro: TZQuery;
    ZQAltBancarias: TZQuery;
    ZQDelUsuario: TZQuery;
    procedure DSConsForncedoresDataChange(Sender: TObject; Field: TField);


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

procedure TDM.DSConsForncedoresDataChange(Sender: TObject; Field: TField);
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

