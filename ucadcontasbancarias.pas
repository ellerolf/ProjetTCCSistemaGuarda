unit uCadContasBancarias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls, UModulo;

type

  { TFrmCadContasBancarias }

  TFrmCadContasBancarias = class(TForm)
    RdbCadConta: TRadioButton;
    RdbCadTrans: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboBanco: TComboBox;
    CboTipo: TComboBox;
    EdtAgencia: TEdit;
    EdtNConta: TEdit;
    EdtNDoc: TEdit;
    EdtSaldoInicial: TEdit;
    EdtVlrTras: TEdit;
    GrpCadastro: TGroupBox;
    GrpTrasfe: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    LstCodConta: TListView;
    LstCodConta1: TListView;
    MaskEdit1: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoChange(Sender: TObject);
    procedure EdtSaldoInicialChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadContasBancarias: TFrmCadContasBancarias;

implementation

{$R *.lfm}

{ TFrmCadContasBancarias }



procedure TFrmCadContasBancarias.Label5Click(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadContasBancarias.BtnSalvarClick(Sender: TObject);
begin
  if (RdbCadConta.Checked=false) and (RdbCadTrans.Checked=false) then
  begin
       ShowMessage('Selecione alguma operação');
  end;

  if (RdbCadConta.Checked=true) then
  begin
    dm.ZQCadBancarias.Params.ParamByName('pCONNOME').Value:=CboBanco.Text;
    dm.ZQCadBancarias.Params.ParamByName('pCODIGOTIP').Value:=CboTipo.ItemIndex;
    dm.ZQCadBancarias.Params.ParamByName('pCONAGENCIA').Value:=EdtAgencia.Text;
    dm.ZQCadBancarias.Params.ParamByName('pCONNUMERO_CONTA').Value:=EdtNConta.Text;
    dm.ZQCadBancarias.Params.ParamByName('pCONSALDO_INICIAL').Value:=EdtSaldoInicial.Text;
    Dm.ZQCadBancarias.ExecSQL;



  end;

end;

procedure TFrmCadContasBancarias.CboTipoChange(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.EdtSaldoInicialChange(Sender: TObject);
var key:char;
begin
  if not(key in ['0'..'9',#8,',']) then
  begin
    key:=#0;
  end;
end;

procedure TFrmCadContasBancarias.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadContasBancarias.MaskEdit1Change(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.Panel2Click(Sender: TObject);
begin

end;

end.

