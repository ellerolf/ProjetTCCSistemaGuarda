unit urlcontasareceberefet;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport, RLParser;

type

  { TFrmRlContasAReceberEfet }

  TFrmRlContasAReceberEfet = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLContasAReceberEfet: TRLReport;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLContasAReceberEfetBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private

  public

  end;

var
  FrmRlContasAReceberEfet: TFrmRlContasAReceberEfet;

implementation

{$R *.lfm}

uses UModulo,UEntrarUsuario,UConsBaixa;

{ TFrmRlContasAReceberEfet }

procedure TFrmRlContasAReceberEfet.RLContasAReceberEfetBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
     FrmRlContasAReceberEfet.RLLabel2.Caption:='Período : '+DateToStr(FrmConsBaixa.DTDataInicial.Date)+' à '+DateToStr(FrmConsBaixa.DTDataFinal.Date);
     FrmRlContasAReceberEfet.RLLabel13.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

end.

