unit urlcentrocusto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRICentroCusto }

  TFrmRICentroCusto = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLcentrocusto: TRLReport;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    procedure RLcentrocustoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

var
  FrmRICentroCusto: TFrmRICentroCusto;

implementation

{$R *.lfm}

uses uConsCentro,UEntrarUsuario;

{ TFrmRICentroCusto }

procedure TFrmRICentroCusto.RLcentrocustoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
      RLLabel7.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

end.

