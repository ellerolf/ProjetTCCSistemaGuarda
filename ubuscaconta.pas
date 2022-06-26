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
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSelecione1Click(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
    procedure DBGContasBancCellClick(Column: TColumn);
    procedure EdtConsultaChange(Sender: TObject);
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
uses uCadContasBancarias;

procedure TFrmBuscaConta.BtnSelecione1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmBuscaConta.BtnConsultaClick(Sender: TObject);
begin
  if (RGBTipoConta.ItemIndex=0) then
  begin
    dm.ZQBuscaConta.Close;
    dm.ZQBuscaConta.SQL.Clear;
    dm.ZQBuscaConta.SQL.Add('select * from vwcontas where CODIGOTIP=3 AND CONNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
    DM.ZQBuscaConta.Open;
  end
  Else If (RGBTipoConta.ItemIndex=1) then
  begin
    dm.ZQBuscaConta.Close;
    dm.ZQBuscaConta.SQL.Clear;
    dm.ZQBuscaConta.SQL.Add('select * from vwcontas where CODIGOTIP<3 AND CONNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
    DM.ZQBuscaConta.Open;
  end;


end;

procedure TFrmBuscaConta.BtnSelecioneClick(Sender: TObject);
begin
  If(FrmCadContasBancarias.AcionaBtnO='o') then
  begin
  FrmCadContasBancarias.EdtCodContaO.Text:=dm.ZQBuscaContaCONCODIGO.AsString;
  FrmCadContasBancarias.AcionaBtnO:='';
  FrmBuscaConta.close;
  end;

  If(FrmCadContasBancarias.AcionaBtnD='d') then
  begin
  FrmCadContasBancarias.EdtCodContaDes.Text:=dm.ZQBuscaContaCONCODIGO.AsString;
  FrmCadContasBancarias.AcionaBtnD:='';
  FrmBuscaConta.close;
  end;
end;

procedure TFrmBuscaConta.DBGContasBancCellClick(Column: TColumn);
begin

end;

procedure TFrmBuscaConta.EdtConsultaChange(Sender: TObject);
begin

end;

procedure TFrmBuscaConta.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQBuscaConta.Active:=false;
  dm.ZQConsTipoConta.Active:=false;
end;

procedure TFrmBuscaConta.FormShow(Sender: TObject);
begin
  dm.ZQBuscaConta.Active:=true;
  dm.ZQConsTipoConta.Active:=true;
end;

procedure TFrmBuscaConta.RGBTipoContaChangeBounds(Sender: TObject);
begin

end;

procedure TFrmBuscaConta.RGBTipoContaClick(Sender: TObject);
begin
   if (RGBTipoConta.ItemIndex=0) then
  begin
    EdtConsulta.Clear;
    DBGCaixa.Visible:=true;
    DBGContasBanc.Visible:=false;
    DM.ZQBuscaConta.Close;
    DM.ZQBuscaConta.SQL.Clear;
    DM.ZQBuscaConta.SQL.Add('SELECT * from vwcontas WHERE CONSTATUS=1 AND CODIGOTIP=3');
    DM.ZQBuscaConta.Open;
  end
  else
  if(RGBTipoConta.ItemIndex=1) then
  begin
    EdtConsulta.Clear;
    DBGCaixa.Visible:=false;
    DBGContasBanc.Visible:=true;
    DM.ZQBuscaConta.Close;
    DM.ZQBuscaConta.SQL.Clear;
    DM.ZQBuscaConta.SQL.Add('SELECT * from vwcontas WHERE CONSTATUS=1 AND CODIGOTIP=2 OR CODIGOTIP=1');
    DM.ZQBuscaConta.Open;
  end;
end;

end.

