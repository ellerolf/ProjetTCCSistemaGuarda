unit urlcontascaixa;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRlContasCaixa }

  TFrmRlContasCaixa = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLContasCaixa: TRLReport;
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
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLContasCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

var
  FrmRlContasCaixa: TFrmRlContasCaixa;

implementation

{$R *.lfm}

uses UModulo,UEntrarUsuario;

{ TFrmRlContasCaixa }

procedure TFrmRlContasCaixa.RLContasCaixaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     RLLabel5.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

end.

