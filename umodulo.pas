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
    ZQTipoDaContaTIPCODIGO: TLongintField;
    ZQTipoDaContaTIPNOME: TStringField;
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

procedure TDM.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDM.DSConsBancariasDataChange(Sender: TObject; Field: TField);
begin

end;

end.

