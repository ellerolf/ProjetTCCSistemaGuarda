unit uCadFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, EditBtn, DateTimePicker;

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
    Label1: TLabel;
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
    LblTitulo: TLabel;
    LblEndereco: TLabel;
    LblMensagem: TLabel;
    EdtCpfCnpj: TMaskEdit;
    EdtCep: TMaskEdit;
    EdtTel: TMaskEdit;
    EdtCel: TMaskEdit;
    EdtEmail: TMaskEdit;
    EdtInsMun: TMaskEdit;
    EdtInsEstadual: TMaskEdit;
    MemObs: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PnLGPD: TPanel;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnAtivoChange(Sender: TObject);
    procedure BtnCnpjChange(Sender: TObject);
    procedure BtnCpfChange(Sender: TObject);
    procedure BtnInativoChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure EdtCpfCnpjChange(Sender: TObject);
    procedure EdtCpfCnpjExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    cpf, cnpj: string;
    procedure mascaras();
    procedure mudaCor();
    procedure verCampo();


  public
    pescodigo, fim: integer;
    OpForn: string;
    procedure AtivaCampoForn();
    procedure DesativaCampoForn();
    procedure trocacor();
    procedure limpacampo();
    procedure sobeBanco();


  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;


implementation

uses ValidaCPF, ValidaCNPJ, UModulo, UConsFornecedores;

{$R *.lfm}

{ TFrmCadFornecedor }

procedure TFrmCadFornecedor.mascaras;
begin
  EdtCep.EditMask := '99999-999;1;_';
  EdtTel.EditMask := '(99)9999-9999;1;_';
  EdtCel.EditMask := '(99)99999-9999;1;_';
end;

procedure TFrmCadFornecedor.mudaCor;
begin
  LblCpfCnpj.font.color := clblack;
  LblNomeRazao.font.color := clblack;
  LblFantasia.font.color := clblack;
  LblEstadual.font.color := clblack;
  LblMunicipal.font.color := clblack;
  LblEndereco.font.color := clblack;
  LblNum.font.color := clblack;
  LblCep.font.color := clblack;
  LblCidade.font.color := clblack;
  LblUf.font.color := clblack;
  lblCel.font.color := clblack;
  LblBairro.font.color := clblack;
  LblDta.font.color := clblack;
end;

procedure TFrmCadFornecedor.verCampo;
begin

end;

procedure TFrmCadFornecedor.AtivaCampoForn;
begin
  if (BtnCnpj.Checked = True) then
  begin
    EdtCpfCnpj.Enabled := True;
    EdtNome.Enabled := True;
    DTNasc.Enabled := False;
    EdtFantasia.Enabled := True;
    EdtInsEstadual.Enabled := True;
    EdtInsMun.Enabled := True;
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
    BtnSalvar.Enabled := True;
    DTNasc.Clear;

  end;

  if (BtnCpf.Checked = True) then
  begin
    EdtCpfCnpj.Enabled := True;
    EdtNome.Enabled := True;
    DTNasc.Enabled := True;
    EdtFantasia.Enabled := False;
    EdtInsEstadual.Enabled := False;
    EdtInsMun.Enabled := False;
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
    BtnSalvar.Enabled := True;
    EdtFantasia.Clear;
    EdtInsEstadual.Clear;
    EdtInsMun.Clear;

  end;
end;

procedure TFrmCadFornecedor.DesativaCampoForn;
begin
  EdtCpfCnpj.Enabled := False;
  EdtNome.Enabled := False;
  EdtFantasia.Enabled := False;
  EdtInsEstadual.Enabled := False;
  EdtInsMun.Enabled := False;
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
  BtnSalvar.Enabled := False;
end;

procedure TFrmCadFornecedor.trocacor;
begin
  //devolve a cor para as Label do registro
  LblCpfCnpj.font.color := clblack;
  LblNomeRazao.font.color := clblack;
  LblFantasia.font.color := clblack;
  LblEstadual.font.color := clblack;
  LblMunicipal.font.color := clblack;
  LblEndereco.font.color := clblack;
  LblNum.font.color := clblack;
  LblCep.font.color := clblack;
  LblCidade.font.color := clblack;
  LblUf.font.color := clblack;
  lblCel.font.color := clblack;
  LblBairro.font.color := clblack;
  LblDta.font.color := clblack;
end;

procedure TFrmCadFornecedor.limpacampo;
begin
  EdtCpfCnpj.Clear;
  EdtNome.Clear;
  EdtFantasia.Clear;
  EdtInsEstadual.Clear;
  EdtInsMun.Clear;
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
  BtnCnpj.Checked:=false;
  BtnCpf.Checked:=false;
end;

procedure TFrmCadFornecedor.sobeBanco;
begin
  //test de up para o banco

end;




procedure TFrmCadFornecedor.BtnSairClick(Sender: TObject);
begin
  OpForn := '';
  Close;
  FrmConsFornecedores.PnChama.Visible := False;
  limpacampo();
end;

procedure TFrmCadFornecedor.BtnCnpjChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '99.999.999/9999-99;1;_';
  LblCpfCnpj.Caption := 'CNPJ';
  LblNomeRazao.Caption := 'Razão Social';
  AtivaCampoForn();
  mascaras();
  trocacor();
end;

procedure TFrmCadFornecedor.BtnAtivoChange(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.BtnAlterarClick(Sender: TObject);
begin
  if (OpForn = 'U') then
  begin
    AtivaCampoForn();
    BtnAlterar.Visible := False;
    GrpCnpjCpf.Enabled := True;
    GrpStatus.Enabled := True;
    BtnInativo.Enabled := True;
    EdtCpfCnpj.Enabled := False;
  end;
end;

procedure TFrmCadFornecedor.BtnCpfChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '999.999.999-99;1;_';
  LblCpfCnpj.Caption := 'CPF';
  LblNomeRazao.Caption := 'Nome';
  AtivaCampoForn();
  mascaras();
  trocacor();
end;

procedure TFrmCadFornecedor.BtnInativoChange(Sender: TObject);
begin
end;

procedure TFrmCadFornecedor.BtnSalvarClick(Sender: TObject);
begin
  //INSERT----------------------------------------------------------------------
  if (OpForn = 'I') then
  begin
    //CNPJ-----------------------------------------------------------------------
    if (BtnCnpj.Checked = True) then
    begin
      if (EdtCpfCnpj.Text = '') or (EdtNome.Text = '') or
        (EdtFantasia.Text = '') or (EdtInsEstadual.Text = '') or
        (EdtInsMun.Text = '') or (EdtEndereco.Text = '') or
        (EdtNumero.Text = '') or (EdtBairro.Text = '') or (EdtCep.Text = '') or
        (EdtCidade.Text = '') or (CboUf.Caption = 'UF') or (EdtCel.Text = '') then
      begin
        ShowMessage('Verifique os campos');
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
        LblBairro.font.color := clred;
      end
      //verifica celular e cep
      else if Length(Trim(EdtCel.Text)) < 14 then
      begin
        ShowMessage('Esta faltando o numero no Celular');
      end

      else if Length(Trim(EdtCep.Text)) < 9 then
      begin
        ShowMessage('Esta faltando o numero na Cep');
      end

      else
      begin
        dm.ZQCadPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
        dm.ZQCadPessoas.Params.ParamByName('codigotip').Value := 2;
        dm.ZQCadPessoas.Params.ParamByName('pescpf').Value := null;
        dm.ZQCadPessoas.Params.ParamByName('pesdata_nascimento').Value := null;
        dm.ZQCadPessoas.Params.ParamByName('pescnpj').Value := EdtCpfCnpj.Text;
        dm.ZQCadPessoas.Params.ParamByName('pesnome_fantasia').Value :=
          EdtFantasia.Text;
        dm.ZQCadPessoas.Params.ParamByName('pesinscricao_estadual').Value :=
          EdtInsEstadual.Text;
        dm.ZQCadPessoas.params.ParamByName('pesinscricao_municipal').Value :=
          EdtInsMun.Text;
        dm.ZQCadPessoas.params.ParamByName('pescep').Value := EdtCep.Text;
        dm.ZQCadPessoas.params.ParamByName('pesendereco').Value := EdtEndereco.Text;
        dm.ZQCadPessoas.params.ParamByName('pesnumero').Value := EdtNumero.Text;
        dm.ZQCadPessoas.params.ParamByName('pescomplemento').Value :=
          EdtComplemento.Text;
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
        limpacampo();
        mudaCor();
        DesativaCampoForn();
      end;
    end; //fim cnpj
    //CPF
    if (BtnCpf.Checked = True) then
    begin

      if (EdtCpfCnpj.Text = '') or (EdtNome.Text = '') or
        (EdtEndereco.Text = '') or (EdtNumero.Text = '') or
        (EdtBairro.Text = '') or (EdtCep.Text = '') or (EdtCidade.Text = '') or
        (CboUf.Caption = 'UF') or (EdtCel.Text = '') then
      begin
        ShowMessage('Verifique os campos');
        LblCpfCnpj.font.color := clred;
        LblNomeRazao.font.color := clred;
        LblDta.font.color := clred;
        LblEndereco.font.color := clred;
        LblNum.font.color := clred;
        LblCep.font.color := clred;
        LblCidade.font.color := clred;
        LblUf.font.color := clred;
        lblCel.font.color := clred;
        LblBairro.font.color := clred;

      end
      //verifica celular e cep
      else if Length(Trim(EdtCel.Text)) < 14 then
      begin
        ShowMessage('Esta faltando o numero no Celular');
      end

      else if Length(Trim(EdtCep.Text)) < 9 then
      begin
        ShowMessage('Esta faltando o numero na Cep');
      end
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
        dm.ZQCadPessoas.params.ParamByName('pescomplemento').Value :=
          EdtComplemento.Text;
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
        limpacampo();
        mudaCor();
        DesativaCampoForn();
      end;
    end;//fim cpf
  end;//fim insert

  //INICIO DO UP
  if (OpForn = 'U') then
  begin

    //altera CPF-----------------------------------------------------------------------
    if (BtnCpf.Checked = True) then
    begin
      if ((EdtNome.Text = dm.ZQConsPessoasNOME.AsString) and
        (EdtEndereco.Text = dm.ZQConsPessoasENDEREO.AsString) and
        (EdtNumero.Text = dm.ZQConsPessoasNMERO.AsString) and
        (EdtBairro.Text = dm.ZQConsPessoasBAIRRO.AsString) and
        (EdtCep.Text = dm.ZQConsPessoasCEP.AsString) and
        (EdtCidade.Text = dm.ZQConsPessoasCIDADE.AsString) and
        (CboUf.Caption = dm.ZQConsPessoasESTADO.AsString) and
        (EdtCel.Text = dm.ZQConsPessoasCELULAR.AsString)) then
      begin
        ShowMessage('Alteração não realizada: Campos são iguais');
      end
      //verifica celular e cep
      else if Length(Trim(EdtCel.Text)) < 14 then
      begin
        ShowMessage('Esta faltando o numero no Celular');
      end

      else if Length(Trim(EdtCep.Text)) < 9 then
      begin
        ShowMessage('Esta faltando o numero na Cep');
      end
      else
      begin
        dm.ZQAltPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
        dm.ZQAltPessoas.Params.ParamByName('codigotip').Value := 1;
        dm.ZQAltPessoas.Params.ParamByName('pescpf').Value :=
          DM.ZQConsPessoasCPF.AsString;
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
        dm.ZQAltPessoas.params.ParamByName('pescomplemento').Value :=
          EdtComplemento.Text;
        dm.ZQAltPessoas.params.ParamByName('pesestado').Value := CboUf.Text;
        dm.ZQAltPessoas.params.ParamByName('pescidade').Value := EdtCidade.Text;
        dm.ZQAltPessoas.params.ParamByName('pesbairro').Value := EdtBairro.Text;
        dm.ZQAltPessoas.params.ParamByName('pesemail').Value := EdtEmail.Text;
        dm.ZQAltPessoas.params.ParamByName('pestelefone').Value := EdtTel.Text;
        dm.ZQAltPessoas.params.ParamByName('pescelular').Value := EdtCel.Text;
        dm.ZQAltPessoas.params.ParamByName('pesobservacao').Value := MemObs.Text;
        //condicao ativo ou inativo
        if (BtnAtivo.Checked = True) then
        begin
          dm.ZQAltPessoas.params.ParamByName('pesstatus').Value := 1;
        end;
        if (BtnInativo.Checked = True) then
        begin
          dm.ZQAltPessoas.params.ParamByName('pesstatus').Value := 0;
        end;
        dm.ZQAltPessoas.params.ParamByName('pescodigo').Value :=
          dm.ZQConsPessoasCODIGO.AsInteger;

        dm.ZQAltPessoas.ExecSQL;

        dm.ZQConsPessoas.Close;
        dm.ZQConsPessoas.Open;

        ShowMessage('Dados Alterados com sucesso!');
        DesativaCampoForn();
      end;

    end;
    //altera CNPJ-----------------------------------------------------------------------
    if (BtnCnpj.Checked = True) then
    begin
      if (EdtNome.Text = dm.ZQConsPessoasNOME.AsString) and
        (EdtFantasia.Text = dm.ZQConsPessoasNOMEFANTASIA.AsString) and
        (EdtInsEstadual.Text = dm.ZQConsPessoasINSCRIOESTADUAL.AsString) and
        (EdtInsMun.Text = dm.ZQConsPessoasINSCRIOMUNICIPAL.AsString) and
        (EdtEndereco.Text = dm.ZQConsPessoasENDEREO.AsString) and
        (EdtNumero.Text = '') or (EdtBairro.Text = dm.ZQConsPessoasBAIRRO.AsString) and
        (EdtCep.Text = dm.ZQConsPessoasCEP.AsString) and
        (EdtCidade.Text = dm.ZQConsPessoasCIDADE.AsString) and
        (CboUf.Caption = dm.ZQConsPessoasESTADO.AsString) and
        (EdtCel.Text = dm.ZQConsPessoasCELULAR.AsString) then
      begin
        ShowMessage('Alteração não realizado: Campos são iguais');
      end
      //verifica celular e cep
      else if Length(Trim(EdtCel.Text)) < 14 then
      begin
        ShowMessage('Esta faltando o numero no Celular');
      end

      else if Length(Trim(EdtCep.Text)) < 9 then
      begin
        ShowMessage('Esta faltando o numero na Cep');
      end
      else
      begin
        dm.ZQAltPessoas.Params.ParamByName('pesnome').Value := EdtNome.Text;
        dm.ZQAltPessoas.Params.ParamByName('codigotip').Value := 2;
        dm.ZQAltPessoas.Params.ParamByName('pescpf').Value := null;
        dm.ZQAltPessoas.Params.ParamByName('pesdata_nascimento').Value := null;
        dm.ZQAltPessoas.Params.ParamByName('pescnpj').Value :=
          DM.ZQConsPessoasCNPJ.AsString;
        dm.ZQAltPessoas.Params.ParamByName('pesnome_fantasia').Value := EdtFantasia.Text;
        dm.ZQAltPessoas.Params.ParamByName('pesinscricao_estadual').Value :=
          EdtInsEstadual.Text;
        dm.ZQAltPessoas.params.ParamByName('pesinscricao_municipal').Value :=
          EdtInsMun.Text;
        dm.ZQAltPessoas.params.ParamByName('pescep').Value := EdtCep.Text;
        dm.ZQAltPessoas.params.ParamByName('pesendereco').Value := EdtEndereco.Text;
        dm.ZQAltPessoas.params.ParamByName('pesnumero').Value := EdtNumero.Text;
        dm.ZQAltPessoas.params.ParamByName('pescomplemento').Value :=
          EdtComplemento.Text;
        dm.ZQAltPessoas.params.ParamByName('pesestado').Value := CboUf.Text;
        dm.ZQAltPessoas.params.ParamByName('pescidade').Value := EdtCidade.Text;
        dm.ZQAltPessoas.params.ParamByName('pesbairro').Value := EdtBairro.Text;
        dm.ZQAltPessoas.params.ParamByName('pesemail').Value := EdtEmail.Text;
        dm.ZQAltPessoas.params.ParamByName('pestelefone').Value := EdtTel.Text;
        dm.ZQAltPessoas.params.ParamByName('pescelular').Value := EdtCel.Text;
        dm.ZQAltPessoas.params.ParamByName('pesobservacao').Value := MemObs.Text;

        //para subir ativo
        if (BtnAtivo.Checked = True) then
        begin
          dm.ZQAltPessoas.params.ParamByName('pesstatus').Value := 1;
        end;
        if (BtnInativo.Checked = True) then
        begin
          dm.ZQAltPessoas.params.ParamByName('pesstatus').Value := 0;
        end;

        dm.ZQAltPessoas.params.ParamByName('pescodigo').Value :=
          dm.ZQConsPessoasCODIGO.AsInteger;

        dm.ZQAltPessoas.ExecSQL;

        dm.ZQConsPessoas.Close;
        dm.ZQConsPessoas.Open;
        DesativaCampoForn();
      end;

    end;

  end;

end;//fim procedure



procedure TFrmCadFornecedor.EdtCpfCnpjChange(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.EdtCpfCnpjExit(Sender: TObject);
begin
  //Validação de CPF/CNPJ
  cpf := StringReplace(EdtCpfCnpj.Text, '.', '', [rfReplaceAll]);
  cpf := StringReplace(cpf, '-', '', [rfReplaceAll]);
  cpf := StringReplace(cpf, '/', '', [rfReplaceAll]);
  if (isCPF(cpf) or isCNPJ(cpf)) then
  begin
    //entrou
  end
  else
  begin
    if (BtnCpf.Checked = True) then
    begin
      ShowMessage('CPF inválido, verifique novamente!');
    end
    else
    begin
      ShowMessage('CNPJ inválido, verifique novamente!');
    end;
  end;

end;

procedure TFrmCadFornecedor.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FrmCadFornecedor.PnLGPD.Visible := False;
end;

procedure TFrmCadFornecedor.FormCreate(Sender: TObject);
begin
  if (BtnCnpj.Checked = True) or (BtnCpf.Checked = True) then
  begin
    AtivaCampoForn();
  end;

  if (BtnCnpj.Checked = False) and (BtnCpf.Checked = False) then
  begin
    DesativaCampoForn();
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
