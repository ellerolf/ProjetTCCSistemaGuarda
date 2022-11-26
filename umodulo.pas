unit UModulo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ExtDlgs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSConsExtrato: TDataSource;
    DSFormaPagto: TDataSource;
    DSValidCadContaBanc: TDataSource;
    DSConsVerParc: TDataSource;
    DSConsSomaParcBaixada: TDataSource;
    DSConsLancamento2: TDataSource;
    DSConsBaixaEfet: TDataSource;
    DSConsBaixaPen: TDataSource;
    DSConsLanData: TDataSource;
    DSBuscaTipoDoc: TDataSource;
    DSBuscaUsuario: TDataSource;
    DSBuscaCentro: TDataSource;
    DSBuscaConta: TDataSource;
    DSConsTipoConta: TDataSource;
    DSConsUsuario: TDataSource;
    DSConsPessoas: TDataSource;
    DSConsLancamentos: TDataSource;
    DSConsCentro: TDataSource;
    DSConsBancarias: TDataSource;
    DSConsTransferencia: TDataSource;
    ZFinanceiro: TZConnection;
    ZQBuscaCentroCENCODIGO: TLongintField;
    ZQBuscaCentroCENNOME: TStringField;
    ZQBuscaCentroCENSTATUS: TSmallintField;
    ZQBuscaCentroCODIGOTIP: TLongintField;
    ZQBuscaCentroSTATUS: TStringField;
    ZQBuscaCentroTIPOCEN: TStringField;
    ZQBuscaContaCODIGOTIP: TLongintField;
    ZQBuscaContaCONAGENCIA: TStringField;
    ZQBuscaContaCONCODIGO: TLongintField;
    ZQBuscaContaCONNOME: TStringField;
    ZQBuscaContaCONNUMERO_CONTA: TStringField;
    ZQBuscaContaCONSALDO_INICIAL: TFloatField;
    ZQBuscaContaCONSTATUS: TSmallintField;
    ZQBuscaContaSTATUS: TStringField;
    ZQBuscaContaTIPNOME: TStringField;
    ZQBuscaTipoDocDOCCODIGO: TLongintField;
    ZQBuscaTipoDocDOCNOME: TStringField;
    ZQBuscaTipoDocDOCTIPO: TSmallintField;
    ZQBuscaUsuarioCODIGONIV: TLongintField;
    ZQBuscaUsuarioNIVILACESSO: TStringField;
    ZQBuscaUsuarioSTATUS: TStringField;
    ZQBuscaUsuarioUSUCODIGO: TLongintField;
    ZQBuscaUsuarioUSULOGIN: TStringField;
    ZQBuscaUsuarioUSUNOME: TStringField;
    ZQBuscaUsuarioUSUSENHA: TStringField;
    ZQBuscaUsuarioUSUSTATUS: TSmallintField;
    ZQConsBaixaEfetBAICODIGO: TLongintField;
    ZQConsBaixaEfetBAIDATAPGTO: TDateField;
    ZQConsBaixaEfetBAIDATAVEN: TDateField;
    ZQConsBaixaEfetBAIDESCONTO: TFloatField;
    ZQConsBaixaEfetBAIMULTA_JUROS: TFloatField;
    ZQConsBaixaEfetBAISTATUS: TSmallintField;
    ZQConsBaixaEfetBAIVALOR: TFloatField;
    ZQConsBaixaEfetBAIVALORPAGO: TFloatField;
    ZQConsBaixaEfetCENCODIGO: TLongintField;
    ZQConsBaixaEfetCENNOME: TStringField;
    ZQConsBaixaEfetCODIGOCON: TLongintField;
    ZQConsBaixaEfetCODIGODOC: TLongintField;
    ZQConsBaixaEfetCODIGOFOR: TLongintField;
    ZQConsBaixaEfetCODIGOLAN: TLongintField;
    ZQConsBaixaEfetCODIGOPES: TLongintField;
    ZQConsBaixaEfetCODIGOTIP: TLongintField;
    ZQConsBaixaEfetCODIGOUSU: TLongintField;
    ZQConsBaixaEfetCONAGENCIA: TStringField;
    ZQConsBaixaEfetCONNOME: TStringField;
    ZQConsBaixaEfetCONNUMERO_CONTA: TStringField;
    ZQConsBaixaEfetDOCNOME: TStringField;
    ZQConsBaixaEfetFORNOME: TStringField;
    ZQConsBaixaEfetLANDOCUMENTO: TDateField;
    ZQConsBaixaEfetLANNUMERO_DOCUMENTO: TStringField;
    ZQConsBaixaEfetLANOBSERVACAO: TStringField;
    ZQConsBaixaEfetLANTIPO: TSmallintField;
    ZQConsBaixaEfetLANVALOR_DOCUMENTO: TFloatField;
    ZQConsBaixaEfetPESNOME: TStringField;
    ZQConsBaixaEfetSTATUS: TStringField;
    ZQConsBaixaEfetTIPNOME: TStringField;
    ZQConsBaixaEfetTIPO: TStringField;
    ZQConsBaixaEfetUSUNOME: TStringField;
    ZQConsBaixaPenBAICODIGO: TLongintField;
    ZQConsBaixaPenBAIDATAVEN: TDateField;
    ZQConsBaixaPenBAISTATUS: TSmallintField;
    ZQConsBaixaPenBAIVALOR: TFloatField;
    ZQConsBaixaPenCENCODIGO: TLongintField;
    ZQConsBaixaPenCENNOME: TStringField;
    ZQConsBaixaPenCODIGODOC: TLongintField;
    ZQConsBaixaPenCODIGOLAN: TLongintField;
    ZQConsBaixaPenCODIGOPES: TLongintField;
    ZQConsBaixaPenCODIGOUSU: TLongintField;
    ZQConsBaixaPenDOCNOME: TStringField;
    ZQConsBaixaPenLANDOCUMENTO: TDateField;
    ZQConsBaixaPenLANNUMERO_DOCUMENTO: TStringField;
    ZQConsBaixaPenLANOBSERVACAO: TStringField;
    ZQConsBaixaPenLANTIPO: TSmallintField;
    ZQConsBaixaPenLANVALOR_DOCUMENTO: TFloatField;
    ZQConsBaixaPenPESNOME: TStringField;
    ZQConsBaixaPenSTATUS: TStringField;
    ZQConsBaixaPenTIPO: TStringField;
    ZQConsBaixaPenUSUNOME: TStringField;
    ZQConsBancariasCODIGOTIP: TLongintField;
    ZQConsBancariasCONAGENCIA: TStringField;
    ZQConsBancariasCONCODIGO: TLongintField;
    ZQConsBancariasCONNOME: TStringField;
    ZQConsBancariasCONNUMERO_CONTA: TStringField;
    ZQConsBancariasCONSALDO_INICIAL: TFloatField;
    ZQConsBancariasCONSTATUS: TSmallintField;
    ZQConsBancariasSTATUS: TStringField;
    ZQConsBancariasTIPNOME: TStringField;
    ZQConsCentroCENCODIGO: TLongintField;
    ZQConsCentroCENNOME: TStringField;
    ZQConsCentroCENSTATUS: TSmallintField;
    ZQConsCentroCODIGOTIP: TLongintField;
    ZQConsExtratoconta: TLongintField;
    ZQConsExtratodata: TDateField;
    ZQConsExtratodescricao: TStringField;
    ZQConsExtratodocumento: TStringField;
    ZQConsExtratooperacao: TStringField;
    ZQConsExtratovalor: TFloatField;
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
    ZQConsLancamento2CODIGOCEN: TLongintField;
    ZQConsLancamento2CODIGODOC: TLongintField;
    ZQConsLancamento2CODIGOPES: TLongintField;
    ZQConsLancamento2CODIGOUSU: TLongintField;
    ZQConsLancamento2LANCODIGO: TLongintField;
    ZQConsLancamento2LANDOCUMENTO: TDateField;
    ZQConsLancamento2LANNUMERO_DOCUMENTO: TStringField;
    ZQConsLancamento2LANOBSERVACAO: TStringField;
    ZQConsLancamento2LANTIPO: TSmallintField;
    ZQConsLancamento2LANVALOR_DOCUMENTO: TFloatField;
    ZQConsLancamentosCODIGOCEN: TLongintField;
    ZQConsLancamentosCODIGODOC: TLongintField;
    ZQConsLancamentosCODIGOPES: TLongintField;
    ZQConsLancamentosCODIGOUSU: TLongintField;
    ZQConsLancamentosLANCODIGO: TLongintField;
    ZQConsLancamentosLANDOCUMENTO: TDateField;
    ZQConsLancamentosLANNUMERO_DOCUMENTO: TStringField;
    ZQConsLancamentosLANOBSERVACAO: TStringField;
    ZQConsLancamentosLANTIPO: TSmallintField;
    ZQConsLancamentosLANVALOR_DOCUMENTO: TFloatField;
    ZQConsLanDataBAICODIGO: TLongintField;
    ZQConsLanDataBAIDATAVEN: TDateField;
    ZQConsLanDataBAIDESCONTO: TFloatField;
    ZQConsLanDataBAIMULTA_JUROS: TFloatField;
    ZQConsLanDataBAISTATUS: TSmallintField;
    ZQConsLanDataBAIVALOR: TFloatField;
    ZQConsLanDataCODIGOCON: TLongintField;
    ZQConsLanDataCODIGOFOR: TLongintField;
    ZQConsLanDataCODIGOLAN: TLongintField;
    ZQConsLanDataCODIGOUSU: TLongintField;
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
    ZQConsSomaParcBaixadasumBAIVALOR: TFloatField;
    ZQConsTipoContaTIPCODIGO: TLongintField;
    ZQConsTipoContaTIPNOME: TStringField;
    ZQConsTransferenciaAGENCIADACONTADEdestino: TStringField;
    ZQConsTransferenciaAGENCIADACONTADEORIGEM: TStringField;
    ZQConsTransferenciaCODIGODACONTADEDESTINO: TLongintField;
    ZQConsTransferenciaCODIGODACONTADEORIGEM: TLongintField;
    ZQConsTransferenciaNCONTADEDESTINO: TStringField;
    ZQConsTransferenciaNCONTADEORIGEM: TStringField;
    ZQConsTransferenciaNOMEDACONTADEDESTINO: TStringField;
    ZQConsTransferenciaNOMEDACONTADEORIGEM: TStringField;
    ZQConsTransferenciaSTATUS: TStringField;
    ZQConsTransferenciaTIPODACONTADEDESTINO: TStringField;
    ZQConsTransferenciaTIPODACONTADEORIGEM: TStringField;
    ZQConsTransferenciaTRACODIGO: TLongintField;
    ZQConsTransferenciaTRADATA: TDateField;
    ZQConsTransferenciaTRANUMERO_DOCUMENTO: TStringField;
    ZQConsTransferenciaTRASTATUS: TSmallintField;
    ZQConsTransferenciaTRAVALOR: TFloatField;
    ZQConsUsuarioCODIGONIV: TLongintField;
    ZQConsUsuarioUSUCODIGO: TLongintField;
    ZQConsUsuarioUSULOGIN: TStringField;
    ZQConsUsuarioUSUNOME: TStringField;
    ZQConsUsuarioUSUSENHA: TStringField;
    ZQConsUsuarioUSUSTATUS: TSmallintField;
    ZQConsVerParcBAICODIGO: TLongintField;
    ZQConsVerParcBAIDATAVEN: TDateField;
    ZQConsVerParcBAISTATUS: TSmallintField;
    ZQConsVerParcBAIVALOR: TFloatField;
    ZQConsVerParcCODIGOLAN: TLongintField;
    ZQConsVerParcLANTIPO: TSmallintField;
    ZQConsVerParcLANVALOR_DOCUMENTO: TFloatField;
    ZQConsVerParcPESCODIGO: TLongintField;
    ZQConsVerParcPESNOME: TStringField;
    ZQConsVerParcSTATUS: TStringField;
    ZQConsVerParcTIPO: TStringField;
    ZQDelBancarias: TZQuery;
    ZQDelCentro: TZQuery;
    ZQDelPessoas: TZQuery;
    ZQDelLancamentos: TZQuery;
    ZQConsTransferencia: TZQuery;
    ZQCadTransferencia: TZQuery;
    ZQAltTransferencia: TZQuery;
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
    ZQConsCentro: TZQuery;
    ZQBuscaUsuario: TZQuery;
    ZQBuscaCentro: TZQuery;
    ZQBuscaTipoDoc: TZQuery;
    ZQConsLanData: TZQuery;
    ZQCadLanData: TZQuery;
    ZQDelDataLan: TZQuery;
    ZQDelParcEspecif: TZQuery;
    ZQConsBaixaPen: TZQuery;
    ZQConsBaixaEfet: TZQuery;
    ZQAltValorLanc: TZQuery;
    ZQConsLancamento2: TZQuery;
    ZQConsSomaParcBaixada: TZQuery;
    ZQDelParcPen: TZQuery;
    ZQConsVerParc: TZQuery;
    ZQAltBaixaDeParcela: TZQuery;
    ZQFormaPagto: TZQuery;
    ZQFormaPagtoFORCODIGO: TLongintField;
    ZQFormaPagtoFORNOME: TStringField;
    ZQConsExtrato: TZQuery;
    ZQValidCadContaBanc: TZQuery;
    procedure DSBuscaTipoDocDataChange(Sender: TObject; Field: TField);
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

procedure TDM.DSBuscaTipoDocDataChange(Sender: TObject; Field: TField);
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

