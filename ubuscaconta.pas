unit UBuscaConta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmBuscaConta }

  TFrmBuscaConta = class(TForm)
    BtnConsulta: TSpeedButton;
    BtnSelecione: TSpeedButton;
    BtnSelecione1: TSpeedButton;
    DBGCaixa: TDBGrid;
    DBGContasBanc: TDBGrid;
    EdtConsulta: TEdit;
    Panel1: TPanel;
    RGBTipoConta: TRadioGroup;
    procedure BtnSelecione1Click(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
    procedure RGBTipoContaChangeBounds(Sender: TObject);
    procedure RGBTipoContaClick(Sender: TObject);
  private

  public

  end;

var
  FrmBuscaConta: TFrmBuscaConta;

implementation

{$R *.lfm}

{ TFrmBuscaConta }

procedure TFrmBuscaConta.BtnSelecione1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmBuscaConta.BtnSelecioneClick(Sender: TObject);
begin

end;

procedure TFrmBuscaConta.RGBTipoContaChangeBounds(Sender: TObject);
begin

end;

procedure TFrmBuscaConta.RGBTipoContaClick(Sender: TObject);
begin
   if (RGBTipoConta.ItemIndex=0) then
  begin
    DBGCaixa.Visible:=true;
    DBGContasBanc.Visible:=false;
  end
  else
  if(RGBTipoConta.ItemIndex=1) then
  begin
    DBGCaixa.Visible:=false;
    DBGContasBanc.Visible:=true;
  end;
end;

end.

