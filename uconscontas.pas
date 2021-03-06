unit UConsContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, Grids, UModulo;

type

  { TFrmConsContas }

  TFrmConsContas = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    CboStatus: TComboBox;
    DBGConsCaixa: TDBGrid;
    DBGConsContasBancarias: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RGBConsTipoConta: TRadioGroup;
    BtnPesquisar: TSpeedButton;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CboStatusChange(Sender: TObject);
    procedure DBGConsCaixaCellClick(Column: TColumn);
    procedure DBGConsContasBancariasCellClick(Column: TColumn);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGBConsTipoContaChangeBounds(Sender: TObject);
    procedure RGBConsTipoContaClick(Sender: TObject);
    procedure ConsContas();
  private
    {Professor zanata disse que é importante quando tem duas grids armazenar o valor
     em uma variável durante o clique. Por isso foi criado uma variável chamada
    'ctipo' para receber o codigo de onde o usuário está clicando. }
    ctipo: integer;
  public

  end;

var
  FrmConsContas: TFrmConsContas;

implementation

{$R *.lfm}

{ TFrmConsContas }
uses uCadContasBancarias;

procedure TFrmConsContas.BtnSairClick(Sender: TObject);
begin
  RGBConsTipoConta.ItemIndex := -1;
  CboStatus.ItemIndex := -1;
  DBGConsContasBancarias.Visible := False;
  DBGConsCaixa.Visible := False;
  EdtConsulta.Text:='';
  Close;
end;

procedure TFrmConsContas.BtnAlterarClick(Sender: TObject);
begin
  FrmCadContasBancarias.OpeCadOuAltConta := 'u';
   //se for do tipo caixa e status ativo
  if (dm.ZQConsBancariasCODIGOTIP.AsInteger = 3) and (dm.ZQConsBancariasCONSTATUS.value=1) then
  begin
    FrmCadContasBancarias.RdbCadTrans.Enabled:=False;
    FrmCadContasBancarias.RdbCadConta.Checked:=true;
    FrmCadContasBancarias.RdbCadConta.Caption:='Alteração de Conta';
    FrmCadContasBancarias.RGBStatusConta.Visible:=True;
    FrmCadContasBancarias.RGBStatusConta.ItemIndex:=0;
    dm.ZQConsTipoConta.Open;
    FrmCadContasBancarias.CboTipo.KeyValue:=3;
    FrmCadContasBancarias.EdtNomeConta.Enabled:=True;
    FrmCadContasBancarias.EdtNomeConta.Text:=dm.ZQConsBancariasCONNOME.AsString;
    FrmCadContasBancarias.EdtSaldoInicial.Enabled:=True;
    FrmCadContasBancarias.EdtSaldoInicial.Text:=FormatCurr('0.00',dm.ZQConsBancariasCONSALDO_INICIAL.AsCurrency);
    FrmCadContasBancarias.show;
  end;
  //se for do tipo caixa e status inativo
  if (dm.ZQConsBancariasCODIGOTIP.AsInteger = 3) and (dm.ZQConsBancariasCONSTATUS.value=0) then
  begin
    FrmCadContasBancarias.RdbCadTrans.Enabled:=False;
    FrmCadContasBancarias.RdbCadConta.Checked:=true;
    FrmCadContasBancarias.RdbCadConta.Caption:='Alteração de Conta';
    FrmCadContasBancarias.RGBStatusConta.Visible:=True;
    FrmCadContasBancarias.RGBStatusConta.ItemIndex:=1;
    dm.ZQConsTipoConta.Open;
    FrmCadContasBancarias.CboTipo.KeyValue:=3;
    FrmCadContasBancarias.EdtNomeConta.Enabled:=True;
    FrmCadContasBancarias.EdtNomeConta.Text:=dm.ZQConsBancariasCONNOME.AsString;
    FrmCadContasBancarias.EdtSaldoInicial.Enabled:=True;
    FrmCadContasBancarias.EdtSaldoInicial.Text:=FormatCurr('0.00',dm.ZQConsBancariasCONSALDO_INICIAL.AsCurrency);
    FrmCadContasBancarias.show;
  end;
  //se for do tipo conta corrente e status ativo

  if (dm.ZQConsBancariasCODIGOTIP.AsInteger = 1) and (dm.ZQConsBancariasCONSTATUS.value=1) then
  begin
    FrmCadContasBancarias.RdbCadTrans.Enabled:=False;
    FrmCadContasBancarias.RdbCadConta.Checked:=true;
    FrmCadContasBancarias.RdbCadConta.Caption:='Alteração de Conta';
    FrmCadContasBancarias.RGBStatusConta.Visible:=True;
    FrmCadContasBancarias.RGBStatusConta.ItemIndex:=0;
    dm.ZQConsTipoConta.Open;
    FrmCadContasBancarias.CboTipo.KeyValue:=1;
    FrmCadContasBancarias.CboBanco.Enabled:=True;
    FrmCadContasBancarias.CboBanco.Text:=DM.ZQConsBancariasCONNOME.AsString;
    FrmCadContasBancarias.EdtAgencia.Enabled:=True;
    FrmCadContasBancarias.EdtAgencia.Text:=dm.ZQConsBancariasCONAGENCIA.AsString;
    FrmCadContasBancarias.EdtNConta.Enabled:=True;
    FrmCadContasBancarias.EdtNConta.Text:=dm.ZQConsBancariasCONNUMERO_CONTA.AsString;
    FrmCadContasBancarias.EdtSaldoInicial.Enabled:=True;
    FrmCadContasBancarias.EdtSaldoInicial.Text:=FormatCurr('0.00',dm.ZQConsBancariasCONSALDO_INICIAL.AsCurrency);
    FrmCadContasBancarias.show;
  end;
  //se for do tipo conta corrente e status inativo

   if (dm.ZQConsBancariasCODIGOTIP.AsInteger = 1) and (dm.ZQConsBancariasCONSTATUS.value=0) then
  begin
    FrmCadContasBancarias.RdbCadTrans.Enabled:=False;
    FrmCadContasBancarias.RdbCadConta.Checked:=true;
    FrmCadContasBancarias.RdbCadConta.Caption:='Alteração de Conta';
    FrmCadContasBancarias.RGBStatusConta.Visible:=True;
    FrmCadContasBancarias.RGBStatusConta.ItemIndex:=1;
    dm.ZQConsTipoConta.Open;
    FrmCadContasBancarias.CboTipo.KeyValue:=1;
    FrmCadContasBancarias.CboBanco.Enabled:=True;
    FrmCadContasBancarias.CboBanco.Text:=DM.ZQConsBancariasCONNOME.AsString;
    FrmCadContasBancarias.EdtAgencia.Enabled:=True;
    FrmCadContasBancarias.EdtAgencia.Text:=dm.ZQConsBancariasCONAGENCIA.AsString;
    FrmCadContasBancarias.EdtNConta.Enabled:=True;
    FrmCadContasBancarias.EdtNConta.Text:=dm.ZQConsBancariasCONNUMERO_CONTA.AsString;
    FrmCadContasBancarias.EdtSaldoInicial.Enabled:=True;
    FrmCadContasBancarias.EdtSaldoInicial.Text:=FormatCurr('0.00',dm.ZQConsBancariasCONSALDO_INICIAL.AsCurrency);
    FrmCadContasBancarias.show;
  end;
    //se for do tipo conta de aplicação e status ativo

    if (dm.ZQConsBancariasCODIGOTIP.AsInteger = 2) and (dm.ZQConsBancariasCONSTATUS.value=1) then
  begin
    FrmCadContasBancarias.RdbCadTrans.Enabled:=False;
    FrmCadContasBancarias.RdbCadConta.Checked:=true;
    FrmCadContasBancarias.RdbCadConta.Caption:='Alteração de Conta';
    FrmCadContasBancarias.RGBStatusConta.Visible:=True;
    FrmCadContasBancarias.RGBStatusConta.ItemIndex:=0;
    dm.ZQConsTipoConta.Open;
    FrmCadContasBancarias.CboTipo.KeyValue:=2;
    FrmCadContasBancarias.CboBanco.Enabled:=True;
    FrmCadContasBancarias.CboBanco.Text:=DM.ZQConsBancariasCONNOME.AsString;
    FrmCadContasBancarias.EdtAgencia.Enabled:=True;
    FrmCadContasBancarias.EdtAgencia.Text:=dm.ZQConsBancariasCONAGENCIA.AsString;
    FrmCadContasBancarias.EdtNConta.Enabled:=True;
    FrmCadContasBancarias.EdtNConta.Text:=dm.ZQConsBancariasCONNUMERO_CONTA.AsString;
    FrmCadContasBancarias.EdtSaldoInicial.Enabled:=True;
    FrmCadContasBancarias.EdtSaldoInicial.Text:=FormatCurr('0.00',dm.ZQConsBancariasCONSALDO_INICIAL.AsCurrency);
    FrmCadContasBancarias.show;
  end;
   //se for do tipo conta de aplicação e status inativo
     if (dm.ZQConsBancariasCODIGOTIP.AsInteger = 2) and (dm.ZQConsBancariasCONSTATUS.value=0) then
  begin
    FrmCadContasBancarias.RdbCadTrans.Enabled:=False;
    FrmCadContasBancarias.RdbCadConta.Checked:=true;
    FrmCadContasBancarias.RdbCadConta.Caption:='Alteração de Conta';
    FrmCadContasBancarias.RGBStatusConta.Visible:=True;
    FrmCadContasBancarias.RGBStatusConta.ItemIndex:=1;
    dm.ZQConsTipoConta.Open;
    FrmCadContasBancarias.CboTipo.KeyValue:=2;
    FrmCadContasBancarias.CboBanco.Enabled:=True;
    FrmCadContasBancarias.CboBanco.Text:=DM.ZQConsBancariasCONNOME.AsString;
    FrmCadContasBancarias.EdtAgencia.Enabled:=True;
    FrmCadContasBancarias.EdtAgencia.Text:=dm.ZQConsBancariasCONAGENCIA.AsString;
    FrmCadContasBancarias.EdtNConta.Enabled:=True;
    FrmCadContasBancarias.EdtNConta.Text:=dm.ZQConsBancariasCONNUMERO_CONTA.AsString;
    FrmCadContasBancarias.EdtSaldoInicial.Enabled:=True;
    FrmCadContasBancarias.EdtSaldoInicial.Text:=FormatCurr('0.00',dm.ZQConsBancariasCONSALDO_INICIAL.AsCurrency);
    FrmCadContasBancarias.show;
  end;

end;

procedure TFrmConsContas.BtnPesquisarClick(Sender: TObject);
begin
  // caixa, ativo e inativo
  if (RGBConsTipoConta.ItemIndex=0) and (CboStatus.ItemIndex=0) then
  begin
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP=3 AND CONNOME like'+QuotedStr('%'+EdtConsulta.Text+'%'));
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.open;
    EdtConsulta.Clear;
  end
  Else
  // caixa, somente ativo
  if (RGBConsTipoConta.ItemIndex=0) and (CboStatus.ItemIndex=1) then
  begin
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP=3 AND CONSTATUS=1 AND CONNOME like'+QuotedStr('%'+EdtConsulta.Text+'%'));
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.open;
    EdtConsulta.Clear;
  end
  Else
  //caixa, somente inativo
  if (RGBConsTipoConta.ItemIndex=0) and (CboStatus.ItemIndex=2) then
  begin
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP=3 AND CONSTATUS=0 AND CONNOME like'+QuotedStr('%'+EdtConsulta.Text+'%'));
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.open;
    EdtConsulta.Clear;
  end
  Else
  //Contas bancárias ativo e inativo
  if (RGBConsTipoConta.ItemIndex=1) and (CboStatus.ItemIndex=0) then
  begin
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP<3 AND CONNOME like'+QuotedStr('%'+EdtConsulta.Text+'%'));
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.open;
    EdtConsulta.Clear;
  end
  Else
  //Contas bancárias somente ativo
  if (RGBConsTipoConta.ItemIndex=1) and (CboStatus.ItemIndex=1) then
  begin
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP<3 AND CONSTATUS=1 AND CONNOME like'+QuotedStr('%'+EdtConsulta.Text+'%'));
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.open;
    EdtConsulta.Clear;
  end
  Else
    //Contas bancárias somente inativa
  if (RGBConsTipoConta.ItemIndex=1) and (CboStatus.ItemIndex=2) then
  begin
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP<3 AND CONSTATUS=0 AND CONNOME like'+QuotedStr('%'+EdtConsulta.Text+'%'));
    dm.ZQConsBancarias.close;
    dm.ZQConsBancarias.open;
    EdtConsulta.Clear;
  end;
end;

procedure TFrmConsContas.CboStatusChange(Sender: TObject);
begin
  ConsContas();
end;

procedure TFrmConsContas.DBGConsCaixaCellClick(Column: TColumn);
begin
  ctipo := dm.ZQConsBancariasCODIGOTIP.AsInteger;
end;

procedure TFrmConsContas.DBGConsContasBancariasCellClick(Column: TColumn);
begin
  ctipo := dm.ZQConsBancariasCODIGOTIP.AsInteger;
end;

procedure TFrmConsContas.EdtConsultaChange(Sender: TObject);
begin

end;

procedure TFrmConsContas.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dm.ZQConsBancarias.Active := False;
end;

procedure TFrmConsContas.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsContas.FormShow(Sender: TObject);
begin
  DM.ZQConsBancarias.Active := True;
end;

procedure TFrmConsContas.RGBConsTipoContaChangeBounds(Sender: TObject);
begin

end;

procedure TFrmConsContas.RGBConsTipoContaClick(Sender: TObject);
begin
  ConsContas();
end;

procedure TFrmConsContas.ConsContas;
begin
  if (RGBConsTipoConta.ItemIndex = 0) and (CboStatus.ItemIndex = 0) then
  begin
    dm.ZQConsBancarias.Close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('select *from contas WHERE CODIGOTIP=3');
    dm.ZQConsBancarias.Open;
    DBGConsCaixa.Visible := True;
    DBGConsContasBancarias.Visible := False;
  end
  else if (RGBConsTipoConta.ItemIndex = 0) and (CboStatus.ItemIndex = 1) then
  begin
    dm.ZQConsBancarias.Close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add(
      'select *from contas WHERE CODIGOTIP=3 and CONSTATUS=1');
    dm.ZQConsBancarias.Open;
    DBGConsCaixa.Visible := True;
    DBGConsContasBancarias.Visible := False;
  end
  else if (RGBConsTipoConta.ItemIndex = 0) and (CboStatus.ItemIndex = 2) then
  begin
    dm.ZQConsBancarias.Close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add(
      'select *from contas WHERE CODIGOTIP=3 and CONSTATUS=0');
    dm.ZQConsBancarias.Open;
    DBGConsCaixa.Visible := True;
    DBGConsContasBancarias.Visible := False;

  end
  else if (RGBConsTipoConta.ItemIndex = 1) and (CboStatus.ItemIndex = 0) then
  begin
    dm.ZQConsBancarias.Close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add('select * from contas WHERE CODIGOTIP<3');
    dm.ZQConsBancarias.Open;
    DBGConsCaixa.Visible := False;
    DBGConsContasBancarias.Visible := True;
  end
  else if (RGBConsTipoConta.ItemIndex = 1) and (CboStatus.ItemIndex = 1) then
  begin
    dm.ZQConsBancarias.Close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add(
      'select * from contas WHERE CODIGOTIP<3 and CONSTATUS=1');
    dm.ZQConsBancarias.Open;
    DBGConsCaixa.Visible := False;
    DBGConsContasBancarias.Visible := True;
  end
  else if (RGBConsTipoConta.ItemIndex = 1) and (CboStatus.ItemIndex = 2) then
  begin
    dm.ZQConsBancarias.Close;
    dm.ZQConsBancarias.SQL.Clear;
    dm.ZQConsBancarias.SQL.Add(
      'select * from contas WHERE CODIGOTIP<3 and CONSTATUS=0');
    dm.ZQConsBancarias.Open;
    DBGConsCaixa.Visible := False;
    DBGConsContasBancarias.Visible := True;
  end
  else
  begin

  end;
end;

end.
