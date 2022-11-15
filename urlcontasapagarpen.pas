unit urlcontasapagarpen;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, RLReport,
  RLParser;

type

  { TFrmRlContasAPagarPen }

  TFrmRlContasAPagarPen = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLContasAPagarPen: TRLReport;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
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
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLBand5AfterPrint(Sender: TObject);
    procedure RLContasAPagarPenBeforePrint(Sender: TObject; var PrintIt: Boolean
      );
    procedure RLLabel1AfterPrint(Sender: TObject);


  private

  public

  end;

var
  FrmRlContasAPagarPen: TFrmRlContasAPagarPen;

implementation

{$R *.lfm}

uses UModulo,UEntrarUsuario,UConsBaixa;

{ TFrmRlContasAPagarPen }

procedure TFrmRlContasAPagarPen.RLLabel1AfterPrint(Sender: TObject);
begin

end;

procedure TFrmRlContasAPagarPen.RLContasAPagarPenBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     FrmRlContasAPagarPen.RLLabel2.Caption:='Período : '+DateToStr(FrmConsBaixa.DTDataInicial.Date)+' à '+DateToStr(FrmConsBaixa.DTDataFinal.Date);
     FrmRlContasAPagarPen.RLLabel12.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

procedure TFrmRlContasAPagarPen.RLBand5AfterPrint(Sender: TObject);
begin

end;





end.

