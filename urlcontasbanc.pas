unit uRlContasBanc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRlContasBanc }

  TFrmRlContasBanc = class(TForm)
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
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLContasbancarias: TRLReport;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLContasbancariasBeforePrint(Sender: TObject; var PrintIt: Boolean
      );
    procedure RLDBText1AfterPrint(Sender: TObject);
  private

  public

  end;

var
  FrmRlContasBanc: TFrmRlContasBanc;

implementation

{$R *.lfm}

uses UModulo, UEntrarUsuario;

{ TFrmRlContasBanc }

procedure TFrmRlContasBanc.RLDBText1AfterPrint(Sender: TObject);
begin

end;

procedure TFrmRlContasBanc.RLContasbancariasBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     RLLabel8.Caption:='Impresso por : '+FrmEntrarUsuario.usuarios;
end;

end.

