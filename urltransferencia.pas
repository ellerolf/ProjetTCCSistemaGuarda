unit urltransferencia;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRlTransferencia }

  TFrmRlTransferencia = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
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
    RLTransferencia: TRLReport;
    procedure RLTransferenciaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

var
  FrmRlTransferencia: TFrmRlTransferencia;

implementation

{$R *.lfm}

uses UModulo,UEntrarUsuario, UTranfContas;

{ TFrmRlTransferencia }

procedure TFrmRlTransferencia.RLTransferenciaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     FrmRlTransferencia.RLLabel2.Caption:='Período : '+DateToStr(FrmTranfContas.DTInicial.Date)+' à '+DateToStr(FrmTranfContas.DTFinal.Date);
     FrmRlTransferencia.RLLabel11.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

end.

