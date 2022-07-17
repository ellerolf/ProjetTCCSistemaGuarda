unit UTranfContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, UModulo,uCadContasBancarias;

type

  { TFrmTranfContas }

  TFrmTranfContas = class(TForm)
    BtnCancela: TSpeedButton;
    BtnSeleciona: TSpeedButton;
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton3: TSpeedButton;
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
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

procedure TFrmTranfContas.BtnSelecionaClick(Sender: TObject);
begin
  FrmCadContasBancarias.OpecadOuAltTransf:='U';

  //se o status da transferência for 0(inativo)
  if (dm.ZQConsTransferenciaTRASTATUS.AsInteger=0) then
  begin
    FrmCadContasBancarias.RdbCadConta.Enabled:=False;
    FrmCadContasBancarias.RdbCadTrans.Checked:=true;
    FrmCadContasBancarias.RdbCadTrans.Caption:='Alteração da Transferência';
    FrmCadContasBancarias.RGBStatusTransf.Visible:=True;
    FrmCadContasBancarias.RGBStatusTransf.ItemIndex:=1;
    FrmCadContasBancarias.DtDataTransf.Date:=DM.ZQConsTransferenciaTRADATA.AsDateTime;
    FrmCadContasBancarias.EdtNDoc.Text:=DM.ZQConsTransferenciaTRANUMERO_DOCUMENTO.Text;
    FrmCadContasBancarias.EdtVlrTras.Text:=FormatCurr('0.00',dm.ZQConsTransferenciaTRAVALOR.AsCurrency);
    FrmCadContasBancarias.EdtCodContaO.Text:=dm.ZQConsTransferenciaTRACODIGO_CONORI.Text;
    FrmCadContasBancarias.EdtCodContaDes.Text:=dm.ZQConsTransferenciaTRACODIGO_CONDES.Text;
    FrmCadContasBancarias.Show;
  end;

  // se o status da transferência for 1(ativo)
  if (dm.ZQConsTransferenciaTRASTATUS.AsInteger=1) then
  begin
    FrmCadContasBancarias.RdbCadConta.Enabled:=False;
    FrmCadContasBancarias.RdbCadTrans.Checked:=true;
    FrmCadContasBancarias.RdbCadTrans.Caption:='Alteração da Transferência';
    FrmCadContasBancarias.RGBStatusTransf.Visible:=True;
    FrmCadContasBancarias.RGBStatusTransf.ItemIndex:=0;
    FrmCadContasBancarias.DtDataTransf.Date:=DM.ZQConsTransferenciaTRADATA.AsDateTime;
    FrmCadContasBancarias.EdtNDoc.Text:=DM.ZQConsTransferenciaTRANUMERO_DOCUMENTO.Text;
    FrmCadContasBancarias.EdtVlrTras.Text:=FormatCurr('0.00',dm.ZQConsTransferenciaTRAVALOR.AsCurrency);
    FrmCadContasBancarias.EdtCodContaO.Text:=dm.ZQConsTransferenciaTRACODIGO_CONORI.Text;
    FrmCadContasBancarias.EdtCodContaDes.Text:=dm.ZQConsTransferenciaTRACODIGO_CONDES.Text;
    FrmCadContasBancarias.Show;
  end;


end;

procedure TFrmTranfContas.BtnCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTranfContas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsTransferencia.Active:=False;
end;

procedure TFrmTranfContas.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmTranfContas.FormShow(Sender: TObject);
begin
  dm.ZQConsTransferencia.Active:=True;
end;

procedure TFrmTranfContas.Panel1Resize(Sender: TObject);
begin

end;

procedure TFrmTranfContas.SpeedButton3Click(Sender: TObject);
begin
  //todas trasnferência
  if (CboStatus.ItemIndex=0) then
  begin
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.SQL.Clear;
    dm.ZQConsTransferencia.SQL.Add('SELECT * from transferencia');
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.open;
  end
  Else
  //todas transferência ativa
  if (CboStatus.ItemIndex=1) then
  begin
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.SQL.Clear;
    dm.ZQConsTransferencia.SQL.Add('SELECT * from transferencia where trastatus=1');
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.open;
  end
  Else
  //todas transferência inativa
  begin
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.SQL.Clear;
    dm.ZQConsTransferencia.SQL.Add('SELECT * from transferencia where trastatus=0');
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.open;
  end;
end;

end.

