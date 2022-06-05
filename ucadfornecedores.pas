unit uCadFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, UModulo;

type

  { TFrmCadFornecedor }

  TFrmCadFornecedor = class(TForm)
    BtnCnpj: TRadioButton;
    BtnAtivo: TRadioButton;
    BtnCpf: TRadioButton;
    BtnInativo: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboTipo: TComboBox;
    CboUf: TComboBox;
    EdtBairro: TEdit;
    EdtCel: TEdit;
    EdtCep: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    EdtDTNasc: TMaskEdit;
    EdtEmail: TEdit;
    EdtEndereco: TEdit;
    EdtFantasia: TEdit;
    EdtInsEstadual: TEdit;
    EdtInsMunicipal: TEdit;
    EdtNDoc: TEdit;
    EdtNome: TEdit;
    EdtNumero: TEdit;
    EdtTel: TEdit;
    GrpCnpjCpf: TGroupBox;
    GrpStatus: TGroupBox;
    LblNomeRazao: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    LblCpfCnpj: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    EdtCpfCnpj: TMaskEdit;
    MemObs: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnAtivoChange(Sender: TObject);
    procedure BtnCnpjChange(Sender: TObject);
    procedure BtnCpfChange(Sender: TObject);
    procedure BtnInativoChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GrpCnpjCpfClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;

implementation

{$R *.lfm}

{ TFrmCadFornecedor }


procedure TFrmCadFornecedor.Label7Click(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornecedor.BtnCnpjChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '00.000.000/0000-00;1;_';
  LblCpfCnpj.Caption := 'CNPJ';
  LblNomeRazao.Caption := 'Razão Social';
  EdtFantasia.Enabled := True;
  EdtInsEstadual.Enabled := True;
  EdtInsMunicipal.Enabled := True;
end;

procedure TFrmCadFornecedor.BtnAtivoChange(Sender: TObject);
begin
  BtnAtivo.Enabled := True;
  BtnAtivo.Checked := True;
end;

procedure TFrmCadFornecedor.BtnCpfChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '000.000.000-00;1;_';
  LblCpfCnpj.Caption := 'CPF';
  LblNomeRazao.Caption := 'Razão Social';
  EdtFantasia.Enabled := False;
  EdtInsEstadual.Enabled := False;
  EdtInsMunicipal.Enabled := False;
end;

procedure TFrmCadFornecedor.BtnInativoChange(Sender: TObject);
begin
  BtnInativo.Enabled := False;
end;

procedure TFrmCadFornecedor.BtnSalvarClick(Sender: TObject);
begin
  //CNPJ
  if (BtnCnpj.Enabled=true) then
  begin
       dm.ZQCadFornecedores.Params.ParamByName('pcodigotip').value:=2;
       //como coloca data.
       dm.ZQCadFornecedores.Params.ParamByName('ppesdata_nascimento').Value:=EdtDTNasc.Text;
       dm.ZQCadFornecedores.Params.ParamByName('ppescnpj').Value:=EdtCpfCnpj.Text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesrazao_social').Value:=EdtNome.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesnome_fantasia').Value:=EdtFantasia.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesinscricao_estadual').Value:= StrtoInt(EdtInsEstadual.text);
       dm.ZQCadFornecedores.Params.ParamByName('ppesinscricacao_municipal').Value:= StrtoInt(EdtInsMunicipal.text);
       dm.ZQCadFornecedores.Params.ParamByName('ppesendereco').Value:=EdtEndereco.Text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesnumero').Value:=StrToInt(EdtNumero.Text);
       dm.ZQCadFornecedores.Params.ParamByName('ppescomplemento').Value:=EdtComplemento.Text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesestado').Value:=CboUf.ItemIndex;
       dm.ZQCadFornecedores.Params.ParamByName('ppescidade').Value:=EdtCidade.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesbairro').Value:=EdtBairro.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesemail').Value:=EdtEmail.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppestelefone').Value:=EdtTel.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppescelular').Value:=EdtCel.text;
       dm.ZQCadFornecedores.Params.ParamByName('ppesobservacao').value:=MemObs.text;
       dm.ZQCadFornecedores.ExecSQL;

       dm.ZQConsForncedores.close;
       dm.ZQConsForncedores.Open;

       EdtCpfCnpj.Clear;
       EdtNome.Clear;
       EdtFantasia.Clear;
       EdtInsEstadual.Clear;
       EdtInsMunicipal.Clear;
       EdtEndereco.Clear;
       EdtNumero.Clear;
       EdtComplemento.Clear;
       EdtCidade.Clear;
       EdtBairro.Clear;
       EdtEmail.Clear;
       EdtTel.Clear;
       EdtCel.Clear;
       MemObs.Clear;
       CboUf.Clear;
       CboUf.text:='Selecione uma opção';
  end;


end;

procedure TFrmCadFornecedor.FormCreate(Sender: TObject);
begin
  BtnInativo.Enabled := False;
end;

procedure TFrmCadFornecedor.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadFornecedor.GrpCnpjCpfClick(Sender: TObject);
begin

end;

end.
