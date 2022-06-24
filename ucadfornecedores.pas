unit uCadFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, EditBtn, UModulo;

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
    procedure EdtCpfCnpjChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrpCnpjCpfClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure EdtCepChange(Sender: TObject);
  private
    procedure mascaras();
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

procedure TFrmCadFornecedor.EdtCepChange(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.mascaras;
begin
  EdtCep.EditMask := '00000-000;1;_';
  EdtTel.EditMask := '(00) 0000-0000;1;_';
  EdtCel.EditMask := '(00) 00000-0000;1;_';
  EdtInsEstadual.EditMask := '000000000;1;_';
  EdtInsMunicipal.EditMask := '00000000000;1;_';
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
  //CNPJ
  if (BtnCnpj.Checked = True) then
  begin
    //validação: verificar se é possivel
    if (EdtCpfCnpj.Text = '') or (EdtNome.Text = '') or (EdtFantasia.Text = '') or
      (EdtInsEstadual.Text = '') or (EdtInsMunicipal.Text = '') or
      (EdtEndereco.Text = '') or (EdtNumero.Text = '') or (EdtBairro.Text = '') or
      (EdtCep.Text = '') or (EdtCidade.Text = '') or (CboUf.Caption = 'UF') or
      (EdtCel.Text = '') then
    begin
      LblCpfCnpj.font.color := clred;
      LblNomeRazao.font.color := clred;
      LblFantasia.font.color := clred;
      LblEstadual.font.color := clred;
      LblMunicipal.font.color := clred;
      LblEndereco.font.color := clred;
      LblNum.font.color := clred;
      LblCep.font.color := clred;
      LblCidade.font.color := clred;
      LblUf.font.color := clred;
      lblCel.font.color := clred;
    end


    //insert ao banco
    else
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
      EdtNome.SetFocus;
    end;
  end;


  //CPF
  if (btncpf.Checked = True) then
    //validadeção
    if (EdtCpfCnpj.Text = '') then
    begin
      ShowMessage('Campo CPF obrigatório!');
      EdtCpfCnpj.SetFocus;
    end
    else if (EdtNome.Text = '') then
    begin
      ShowMessage('Campo Nome obrigatório!');
      EdtNome.SetFocus;
    end
    {else if (DTNasc.date = '') then
    begin
      ShowMessage('Campo Data de Nascimento obrigatório!');
      DTNasc.SetFocus;
    end}
    else if (EdtEndereco.Text = '') then
    begin
      ShowMessage('Campo Endereço obrigatório!');
      EdtEndereco.SetFocus;
    end
    else if (EdtNumero.Text = '') then
    begin
      ShowMessage('Campo Numero obrigatório!');
      EdtNumero.SetFocus;
    end
    else if (EdtBairro.Text = '') then
    begin
      ShowMessage('Campo Bairro obrigatório!');
    end
    else if (EdtCep.Text = '') then
    begin
      ShowMessage('Campo CEP obrigatório!');
    end
    else if (EdtCidade.Text = '') then
    begin
      ShowMessage('Campo Cidade obrigatório!');
    end
    else if (CboUf.Caption = 'UF') then
    begin
      ShowMessage('Campo Estado obrigatório!');
    end
    else if (EdtCel.Text = '') then
    begin
      ShowMessage('Campo Celular obrigatório!');
    end

    //insert ao banco
    else
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
      EdtNome.SetFocus;
    end;

end;

procedure TFrmCadFornecedor.EdtCpfCnpjChange(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

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

procedure TFrmCadFornecedor.FormShow(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.GrpCnpjCpfClick(Sender: TObject);
begin

end;

end.
