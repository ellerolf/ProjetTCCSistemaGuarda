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
    CboUf: TComboBox;
    EdtCpfCnpj: TEdit;
    EdtDTNasc: TEdit;
    EdtBairro: TEdit;
    EdtCel: TEdit;
    EdtCep: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    EdtEmail: TEdit;
    EdtEndereco: TEdit;
    EdtFantasia: TEdit;
    EdtInsEstadual: TEdit;
    EdtInsMunicipal: TEdit;
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
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    LblCpfCnpj: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
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
  //EdtCpfCnpj.EditMask := '00.000.000/0000-00;1;_';
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
  //EdtCpfCnpj.EditMask := '000.000.000-00;1;_';
  LblCpfCnpj.Caption := 'CPF';
  LblNomeRazao.Caption := 'Nome';
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
  if (BtnCnpj.Enabled = True) then
  begin
    dm.ZQCadFornCNPJ.Params.ParamByName('codigotip').Value := 2;
    dm.ZQCadFornCNPJ.Params.ParamByName('pescnpj').Value := EdtCpfCnpj.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesrazao_social').Value := EdtNome.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesnome_fantasia').Value := EdtFantasia.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesinscricao_estadual').Value :=
      EdtInsEstadual.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesinscricacao_municipal').Value :=
      EdtInsMunicipal.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesdata_nascimento').Value :=
      FormatDateTime('YYYY-MM-DD', StrToDate(EdtDTNasc.Text));
    dm.ZQCadFornCNPJ.Params.ParamByName('pesendereco').Value := EdtEndereco.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesnumero').Value := EdtNumero.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pescomplemento').Value := EdtComplemento.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesbairro').Value := EdtBairro.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pescep').Value := EdtCep.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pescidade').Value := EdtCidade.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesestado').Value := CboUf.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pestelefone').Value := EdtTel.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pescelular').Value := EdtCel.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesemail').Value := EdtEmail.Text;
    dm.ZQCadFornCNPJ.Params.ParamByName('pesobservacao').Value := MemObs.Text;
    dm.ZQCadFornCNPJ.ExecSQL;

    dm.ZQConsFornCNPJ.Close;
    dm.ZQConsFornCNPJ.Open;

    LblMensagem.Caption := 'Dados Gravados';

    EdtCpfCnpj.Clear;
    EdtNome.Clear;
    EdtFantasia.Clear;
    EdtInsEstadual.Clear;
    EdtInsMunicipal.Clear;
    EdtDTNasc.Clear;
    EdtEndereco.Clear;
    EdtNumero.Clear;
    EdtComplemento.Clear;
    EdtBairro.Clear;
    EdtCep.Clear;
    EdtCidade.Clear;
    CboUf.Caption := 'UF';
    EdtTel.Clear;
    EdtCel.Clear;
    EdtEmail.Clear;
    MemObs.Clear;
  end;

  if (btncpf.Enabled = True) then
  begin
    dm.ZQCadFornCPF.Params.ParamByName('codigotip').Value := 1;
    dm.ZQCadFornCPF.Params.ParamByName('pescpf').Value := EdtCpfCnpj.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pesdata_nascimento').Value :=
      FormatDateTime('YYYY-MM-DD', StrToDate(EdtDTNasc.Text));
    dm.ZQCadFornCPF.Params.ParamByName('pesendereco').Value := EdtEndereco.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pesnumero').Value := EdtNumero.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pescomplemento').Value := EdtComplemento.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pesbairro').Value := EdtBairro.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pescep').Value := EdtCep.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pescidade').Value := EdtCidade.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pesestado').Value := CboUf.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pestelefone').Value := EdtTel.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pescelular').Value := EdtCel.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pesemail').Value := EdtEmail.Text;
    dm.ZQCadFornCPF.Params.ParamByName('pesobservacao').Value := MemObs.Text;
    dm.ZQCadFornCPF.ExecSQL;

    dm.ZQConsFornCNPJ.Close;
    dm.ZQConsFornCNPJ.Open;

    LblMensagem.Caption := 'Dados Gravados';

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
