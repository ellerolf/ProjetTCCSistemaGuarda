unit urlmovimbanc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, RLReport,
  RLParser, RLPDFFilter;

type

  { TFrmRlMovimBanc }

  TFrmRlMovimBanc = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLNomeDaConta: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLSaldoDaConta: TRLLabel;
    RLLSaldoAnterior: TRLLabel;
    RLMovimBanc: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLMovimBancAfterPrint(Sender: TObject);
    procedure RLMovimBancBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

var
  FrmRlMovimBanc: TFrmRlMovimBanc;

implementation

{$R *.lfm}

{ TFrmRlMovimBanc }

uses UMovBanco, UEntrarUsuario, UModulo;

procedure TFrmRlMovimBanc.RLMovimBancBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     FrmRlMovimBanc.RLLabel2.Caption:='Período : '+DateToStr(FrmMovBanco.DTInicial.Date)+' à '+DateToStr(FrmMovBanco.DtFinal.Date);
     FrmRlMovimBanc.RLLabel7.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
     FrmRlMovimBanc.RLLSaldoAnterior.Caption:=FormatCurr('0.00',FrmMovBanco.saldoTotal);
     FrmRlMovimBanc.RLLSaldoDaConta.Caption:=FrmMovBanco.LblValorTotal.Caption;
     FrmRlMovimBanc.RLLNomeDaConta.Caption:='Conta : '+FrmMovBanco.EdtNomeDaConta.Text;
end;

procedure TFrmRlMovimBanc.RLMovimBancAfterPrint(Sender: TObject);
begin
     FrmMovBanco.ativabtnImprimir:='';
     FrmMovBanco.DTInicial.Clear;
     FrmMovBanco.DtFinal.Clear;
     FrmMovBanco.BtnImprimir.Enabled:=False;
end;

end.

