unit urlcontasareceberpen;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport, RLParser;

type

  { TFrmRlContasAReceberPen }

  TFrmRlContasAReceberPen = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLContasAReceberPen: TRLReport;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLContasAReceberPenBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private

  public

  end;

var
  FrmRlContasAReceberPen: TFrmRlContasAReceberPen;

implementation

{$R *.lfm}

uses UModulo,UEntrarUsuario,UConsBaixa;

{ TFrmRlContasAReceberPen }

procedure TFrmRlContasAReceberPen.RLContasAReceberPenBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
     FrmRlContasAReceberPen.RLLabel2.Caption:='Período : '+DateToStr(FrmConsBaixa.DTDataInicial.Date)+' à '+DateToStr(FrmConsBaixa.DTDataFinal.Date);
     FrmRlContasAReceberPen.RLLabel12.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

end.

