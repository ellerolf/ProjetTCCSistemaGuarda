unit UTranfContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TFrmTranfContas }

  TFrmTranfContas = class(TForm)
    BtnConsulta: TSpeedButton;
    BtnSelecione: TSpeedButton;
    BtnSelecione1: TSpeedButton;
    DBGCaixa: TDBGrid;
    DBGContasBanc: TDBGrid;
    EdtConsulta: TEdit;
    Panel1: TPanel;
    RGBTipoConta: TRadioGroup;
    procedure BtnSelecioneClick(Sender: TObject);
  private

  public

  end;

var
  FrmTranfContas: TFrmTranfContas;

implementation

{$R *.lfm}

{ TFrmTranfContas }

procedure TFrmTranfContas.BtnSelecioneClick(Sender: TObject);
begin

end;

end.

