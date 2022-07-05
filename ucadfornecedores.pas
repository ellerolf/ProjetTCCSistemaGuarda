unit uCadFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, EditBtn, UModulo, UConsFornecedores;

type

  { TFrmCadFornecedor }

  TFrmCadFornecedor = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnCnpj: TRadioButton;
    BtnAtivo: TRadioButton;
    BtnCpf: TRadioButton;
    BtnInativo: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboUf: TComboBox;
    DTNasc: TDateEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    EdtEndereco: TEdit;
    EdtFantasia: TEdit;
    EdtNome: TEdit;
    EdtNumero: TEdit;
    GrpCnpjCpf: TGroupBox;
    GrpStatus: TGroupBox;
    LblNomeRazao: TLabel;
    LblNum: TLabel;
    LblCep: TLabel;
    Label12: TLabel;
    LblUf: TLabel;
    LblCidade: TLabel;
    LblBairro: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    lblCel: TLabel;
    Label20: TLabel;
    LblDta: TLabel;
    LblFantasia: TLabel;
    LblCpfCnpj: TLabel;
    LblEstadual: TLabel;
    LblMunicipal: TLabel;
    Label7: TLabel;
    LblEndereco: TLabel;
    LblMensagem: TLabel;
    EdtCpfCnpj: TMaskEdit;
    EdtCep: TMaskEdit;
    EdtTel: TMaskEdit;
    EdtCel: TMaskEdit;
    EdtEmail: TMaskEdit;
    EdtInsEstadual: TMaskEdit;
    EdtInsMunicipal: TMaskEdit;
    MemObs: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnAtivoChange(Sender: TObject);
    procedure BtnCnpjChange(Sender: TObject);
    procedure BtnCpfChange(Sender: TObject);
    procedure BtnInativoChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure mascaras();
  public
    pescodigo: integer;
    OpForn: string;
    procedure AtivaCampoForn();
    procedure DesativaCampoForn();

  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;


implementation

{$R *.lfm}

{ TFrmCadFornecedor }

procedure TFrmCadFornecedor.mascaras;
begin
  EdtCep.EditMask := '00000-000;1;_';
  EdtTel.EditMask := '(00) 0000-0000;1;_';
  EdtCel.EditMask := '(00) 00000-0000;1;_';
  EdtInsEstadual.EditMask := '000000000;1;_';
  EdtInsMunicipal.EditMask := '00000000000;1;_';
end;

procedure TFrmCadFornecedor.AtivaCampoForn;
begin
  EdtCpfCnpj.Enabled := True;
  EdtNome.Enabled := True;
  EdtFantasia.Enabled := True;
  EdtInsEstadual.Enabled := True;
  EdtInsMunicipal.Enabled := True;
  DTNasc.Enabled := True;
  EdtEndereco.Enabled := True;
  EdtNumero.Enabled := True;
  EdtComplemento.Enabled := True;
  EdtBairro.Enabled := True;
  EdtCep.Enabled := True;
  EdtCidade.Enabled := True;
  CboUf.Enabled := True;
  EdtTel.Enabled := True;
  EdtCel.Enabled := True;
  EdtEmail.Enabled := True;
  MemObs.Enabled := True;
end;

procedure TFrmCadFornecedor.DesativaCampoForn;
begin
  EdtCpfCnpj.Enabled := False;
  EdtNome.Enabled := False;
  EdtFantasia.Enabled := False;
  EdtInsEstadual.Enabled := False;
  EdtInsMunicipal.Enabled := False;
  DTNasc.Enabled := False;
  EdtEndereco.Enabled := False;
  EdtNumero.Enabled := False;
  EdtComplemento.Enabled := False;
  EdtBairro.Enabled := False;
  EdtCep.Enabled := False;
  EdtCidade.Enabled := False;
  CboUf.Enabled := False;
  EdtTel.Enabled := False;
  EdtCel.Enabled := False;
  EdtEmail.Enabled := False;
  MemObs.Enabled := False;
end;

procedure TFrmCadFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
  FrmConsFornecedores.PnChama.Visible := False;
end;

procedure TFrmCadFornecedor.BtnCnpjChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '00.000.000/0000-00;1;_';
  LblCpfCnpj.Caption := 'CNPJ';
  LblNomeRazao.Caption := 'Razão Social';
  EdtFantasia.Enabled := True;
  EdtInsEstadual.Enabled := True;
  EdtInsMunicipal.Enabled := True;
  DTNasc.Enabled := False;
  mascaras();
end;

procedure TFrmCadFornecedor.BtnAtivoChange(Sender: TObject);
begin
  BtnAtivo.Enabled := True;
  BtnAtivo.Checked := True;
  EdtCpfCnpj.SetFocus;
end;

procedure TFrmCadFornecedor.BtnAlterarClick(Sender: TObject);
begin
  AtivaCampoForn();
end;

procedure TFrmCadFornecedor.BtnCpfChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '000.000.000-00;1;_';
  LblCpfCnpj.Caption := 'CPF';
  LblNomeRazao.Caption := 'Nome';
  EdtFantasia.Enabled := False;
  EdtInsEstadual.Enabled := False;
  EdtInsMunicipal.Enabled := False;
  DTNasc.Enabled := True;
  mascaras();
end;

procedure TFrmCadFornecedor.BtnInativoChange(Sender: TObject);
begin
  BtnInativo.Enabled := False;
end;

procedure TFrmCadFornecedor.BtnSalvarClick(Sender: TObject);
begin
  //insert
  if (OpForn = 'I') then
  begin
    //CNPJ
    if (BtnCnpj.Checked = True) then
    begin
      dm.ZQCadPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
      dm.ZQCadPessoas.Params.ParamByName('codigotip').Value := 2;
      dm.ZQCadPessoas.Params.ParamByName('pescpf').Value := null;
      dm.ZQCadPessoas.Params.ParamByName('pesdata_nascimento').Value := null;
      dm.ZQCadPessoas.Params.ParamByName('pescnpj').Value := EdtCpfCnpj.Text;
      dm.ZQCadPessoas.Params.ParamByName('pesnome_fantasia').Value := EdtFantasia.Text;
      dm.ZQCadPessoas.Params.ParamByName('pesinscricao_estadual').Value :=
        EdtInsEstadual.Text;
      dm.ZQCadPessoas.params.ParamByName('pesinscricao_municipal').Value :=
        EdtInsMunicipal.Text;
      dm.ZQCadPessoas.params.ParamByName('pescep').Value := EdtCep.Text;
      dm.ZQCadPessoas.params.ParamByName('pesendereco').Value := EdtEndereco.Text;
      dm.ZQCadPessoas.params.ParamByName('pesnumero').Value := EdtNumero.Text;
      dm.ZQCadPessoas.params.ParamByName('pescomplemento').Value := EdtComplemento.Text;
      dm.ZQCadPessoas.params.ParamByName('pesestado').Value := CboUf.Text;
      dm.ZQCadPessoas.params.ParamByName('pescidade').Value := EdtCidade.Text;
      dm.ZQCadPessoas.params.ParamByName('pesbairro').Value := EdtBairro.Text;
      dm.ZQCadPessoas.params.ParamByName('pesemail').Value := EdtEmail.Text;
      dm.ZQCadPessoas.params.ParamByName('pestelefone').Value := EdtTel.Text;
      dm.ZQCadPessoas.params.ParamByName('pescelular').Value := EdtCel.Text;
      dm.ZQCadPessoas.params.ParamByName('pesobservacao').Value := MemObs.Text;
      dm.ZQCadPessoas.ExecSQL;

      dm.ZQConsPessoas.Close;
      dm.ZQConsPessoas.Open;

      ShowMessage('Dados Gravados com sucesso!');
      EdtCpfCnpj.Clear;
      EdtNome.Clear;
      EdtFantasia.Clear;
      EdtInsEstadual.Clear;
      EdtInsMunicipal.Clear;
      {EdtDTNasc.Clear;}
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
      //EdtCpfCnpj.SetFocus;
      OpForn := '';
    end

    else if (btncpf.Checked = True) then
      //CPF
    begin
      dm.ZQCadPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
      dm.ZQCadPessoas.Params.ParamByName('codigotip').Value := 1;
      dm.ZQCadPessoas.Params.ParamByName('pescpf').Value := EdtCpfCnpj.Text;
      dm.ZQCadPessoas.Params.ParamByName('pesdata_nascimento').AsString :=
        FormatDateTime('yyyy-mm-dd', DTNasc.Date);
      dm.ZQCadPessoas.Params.ParamByName('pescnpj').Value := null;
      dm.ZQCadPessoas.Params.ParamByName('pesnome_fantasia').Value := null;
      dm.ZQCadPessoas.Params.ParamByName('pesinscricao_estadual').Value := null;
      dm.ZQCadPessoas.params.ParamByName('pesinscricao_municipal').Value :=
        null;
      dm.ZQCadPessoas.params.ParamByName('pescep').Value := EdtCep.Text;
      dm.ZQCadPessoas.params.ParamByName('pesendereco').Value := EdtEndereco.Text;
      dm.ZQCadPessoas.params.ParamByName('pesnumero').Value := EdtNumero.Text;
      dm.ZQCadPessoas.params.ParamByName('pescomplemento').Value := EdtComplemento.Text;
      dm.ZQCadPessoas.params.ParamByName('pesestado').Value := CboUf.Text;
      dm.ZQCadPessoas.params.ParamByName('pescidade').Value := EdtCidade.Text;
      dm.ZQCadPessoas.params.ParamByName('pesbairro').Value := EdtBairro.Text;
      dm.ZQCadPessoas.params.ParamByName('pesemail').Value := EdtEmail.Text;
      dm.ZQCadPessoas.params.ParamByName('pestelefone').Value := EdtTel.Text;
      dm.ZQCadPessoas.params.ParamByName('pescelular').Value := EdtCel.Text;
      dm.ZQCadPessoas.params.ParamByName('pesobservacao').Value := MemObs.Text;
      dm.ZQCadPessoas.ExecSQL;

      dm.ZQConsPessoas.Close;
      dm.ZQConsPessoas.Open;

      ShowMessage('Dados Gravados com sucesso!');
      EdtCpfCnpj.Clear;
      EdtNome.Clear;
      EdtFantasia.Clear;
      EdtInsEstadual.Clear;
      EdtInsMunicipal.Clear;
      DTNasc.Clear;
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
      //EdtCpfCnpj.SetFocus;
      OpForn := '';
    end
    else
    begin
      ShowMessage('Selecione um tipo de pessoal para o registro');
    end;
  end

  //Update
  else if OpForn = 'U' then
  begin
    BtnInativo.Checked := True;
    if (BtnCnpj.Checked = True) then
    begin
      dm.ZQAltPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
      dm.ZQAltPessoas.Params.ParamByName('codigotip').Value := 2;
      dm.ZQAltPessoas.Params.ParamByName('pescpf').Value := null;
      dm.ZQAltPessoas.Params.ParamByName('pesdata_nascimento').Value := null;
      dm.ZQAltPessoas.Params.ParamByName('pescnpj').Value := EdtCpfCnpj.Text;
      dm.ZQAltPessoas.Params.ParamByName('pesnome_fantasia').Value := EdtFantasia.Text;
      dm.ZQAltPessoas.Params.ParamByName('pesinscricao_estadual').Value :=
        EdtInsEstadual.Text;
      dm.ZQAltPessoas.params.ParamByName('pesinscricao_municipal').Value :=
        EdtInsMunicipal.Text;
      dm.ZQAltPessoas.params.ParamByName('pescep').Value := EdtCep.Text;
      dm.ZQAltPessoas.params.ParamByName('pesendereco').Value := EdtEndereco.Text;
      dm.ZQAltPessoas.params.ParamByName('pesnumero').Value := EdtNumero.Text;
      dm.ZQAltPessoas.params.ParamByName('pescomplemento').Value := EdtComplemento.Text;
      dm.ZQAltPessoas.params.ParamByName('pesestado').Value := CboUf.Text;
      dm.ZQAltPessoas.params.ParamByName('pescidade').Value := EdtCidade.Text;
      dm.ZQAltPessoas.params.ParamByName('pesbairro').Value := EdtBairro.Text;
      dm.ZQAltPessoas.params.ParamByName('pesemail').Value := EdtEmail.Text;
      dm.ZQAltPessoas.params.ParamByName('pestelefone').Value := EdtTel.Text;
      dm.ZQAltPessoas.params.ParamByName('pescelular').Value := EdtCel.Text;
      dm.ZQAltPessoas.params.ParamByName('pesobservacao').Value := MemObs.Text;
      dm.ZQAltPessoas.params.ParamByName('pescodigo').Value := pescodigo;
      dm.ZQAltPessoas.ExecSQL;

      dm.ZQConsPessoas.Close;
      dm.ZQConsPessoas.Open;

      ShowMessage('Alteração Gravada com sucesso!');
      EdtCpfCnpj.Clear;
      EdtNome.Clear;
      EdtFantasia.Clear;
      EdtInsEstadual.Clear;
      EdtInsMunicipal.Clear;
      DTNasc.Clear;
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
      //EdtCpfCnpj.SetFocus;
      OpForn := '';
    end;

    //CPF
    if (btncpf.Checked = True) then
    begin
      dm.ZQAltPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
      dm.ZQAltPessoas.Params.ParamByName('codigotip').Value := 1;
      dm.ZQAltPessoas.Params.ParamByName('pescpf').Value := EdtCpfCnpj.Text;
      dm.ZQAltPessoas.Params.ParamByName('pesdata_nascimento').AsString :=
        FormatDateTime('yyyy-mm-dd', DTNasc.Date);
      dm.ZQAltPessoas.Params.ParamByName('pescnpj').Value := null;
      dm.ZQCadPessoas.Params.ParamByName('pesnome_fantasia').Value := null;
      dm.ZQAltPessoas.Params.ParamByName('pesinscricao_estadual').Value := null;
      dm.ZQAltPessoas.params.ParamByName('pesinscricao_municipal').Value :=
        null;
      dm.ZQAltPessoas.params.ParamByName('pescep').Value := EdtCep.Text;
      dm.ZQAltPessoas.params.ParamByName('pesendereco').Value := EdtEndereco.Text;
      dm.ZQAltPessoas.params.ParamByName('pesnumero').Value := EdtNumero.Text;
      dm.ZQAltPessoas.params.ParamByName('pescomplemento').Value := EdtComplemento.Text;
      dm.ZQAltPessoas.params.ParamByName('pesestado').Value := CboUf.Text;
      dm.ZQAltPessoas.params.ParamByName('pescidade').Value := EdtCidade.Text;
      dm.ZQAltPessoas.params.ParamByName('pesbairro').Value := EdtBairro.Text;
      dm.ZQAltPessoas.params.ParamByName('pesemail').Value := EdtEmail.Text;
      dm.ZQAltPessoas.params.ParamByName('pestelefone').Value := EdtTel.Text;
      dm.ZQAltPessoas.params.ParamByName('pescelular').Value := EdtCel.Text;
      dm.ZQAltPessoas.params.ParamByName('pesobservacao').Value := MemObs.Text;
      dm.ZQAltPessoas.params.ParamByName('pescodigo').Value := dm.ZQConsPessoasCODIGO.AsInteger;
      dm.ZQAltPessoas.ExecSQL;

      dm.ZQConsPessoas.Close;
      dm.ZQConsPessoas.Open;

      ShowMessage('Alteração Gravada com sucesso!');
      EdtCpfCnpj.Clear;
      EdtNome.Clear;
      EdtFantasia.Clear;
      EdtInsEstadual.Clear;
      EdtInsMunicipal.Clear;
      DTNasc.Clear;
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
      //EdtCpfCnpj.SetFocus;
      OpForn := '';
    end;
  end;
end;

procedure TFrmCadFornecedor.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadFornecedor.FormShow(Sender: TObject);
begin
  BtnInativo.Enabled := False;
end;

end.
