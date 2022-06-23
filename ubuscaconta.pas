unit UBuscaConta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids,UModulo;

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
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
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

procedure TFrmBuscaConta.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQBuscaConta.Active:=false;
end;

procedure TFrmBuscaConta.FormShow(Sender: TObject);
begin
  dm.ZQBuscaConta.Active:=true;
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
    DM.ZQBuscaConta.Close;
    DM.ZQBuscaConta.SQL.Clear;
    DM.ZQBuscaConta.SQL.Add('SELECT * FROM CONTAS WHERE CONSTATUS=1 AND CODIGOTIP=3');
    DM.ZQBuscaConta.Open;
  end
  else
  if(RGBTipoConta.ItemIndex=1) then
  begin
    DBGCaixa.Visible:=false;
    DBGContasBanc.Visible:=true;
    DM.ZQBuscaConta.Close;
    DM.ZQBuscaConta.SQL.Clear;
    DM.ZQBuscaConta.SQL.Add('SELECT * FROM CONTAS WHERE CONSTATUS=1 AND CODIGOTIP=2 OR CODIGOTIP=1');
    DM.ZQBuscaConta.Open;
  end;
end;

end.

