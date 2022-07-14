unit UConsFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, ComCtrls, DBGrids, UModulo;

type

  { TFrmConsFornecedores }

  TFrmConsFornecedores = class(TForm)
    BtnSelecionar: TSpeedButton;
    BtnSair: TSpeedButton;
    CboStatus: TComboBox;
    CboTipoPessoa: TComboBox;
    EdtConsulta: TEdit;
    GrCPF: TDBGrid;
    GrCNPJ: TDBGrid;
    GrTodos: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    PnChama: TPanel;
    procedure BtnSelecionarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CboStatusChange(Sender: TObject);
    procedure CboTipoPessoaChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrCNPJCellClick(Column: TColumn);
    procedure GrCPFCellClick(Column: TColumn);
    procedure GrTodosCellClick(Column: TColumn);
  private
    seleciona: integer;
    procedure BuscaDados();

  public

  end;

var
  FrmConsFornecedores: TFrmConsFornecedores;

implementation

{$R *.lfm}

uses uCadFornecedores;

procedure TFrmConsFornecedores.BuscaDados;
begin
  if ((CboStatus.ItemIndex = 0) and (CboTipoPessoa.ItemIndex = 0)) then
    //todos
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    GrCNPJ.Visible := False;
    GrCPF.Visible := False;
  end

  else if ((CboStatus.ItemIndex = 1) and (CboTipoPessoa.ItemIndex = 0)) then
    //todos os ativos
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas where ATIVO = 1');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    GrCNPJ.Visible := False;
    GrCPF.Visible := False;
  end

  else if ((CboStatus.ItemIndex = 2) and (CboTipoPessoa.ItemIndex = 0)) then
    //todos os inativos
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas where ATIVO = 0');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    GrCNPJ.Visible := False;
    GrCPF.Visible := False;
  end

  else if ((CboStatus.ItemIndex = 0) and (CboTipoPessoa.ItemIndex = 1)) then
    //todos dos do CPF
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas where CODIGOTIP = 1');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := False;
    GrCPF.Visible := True;
  end
  else if ((CboStatus.ItemIndex = 0) and (CboTipoPessoa.ItemIndex = 2)) then
    //todos dos do CNPJ
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas where CODIGOTIP = 2');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := True;
    GrCPF.Visible := False;
  end

  else if ((CboStatus.ItemIndex = 1) and (CboTipoPessoa.ItemIndex = 1)) then
    //todos os ativo dos do Cpf
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where ATIVO = 1 and CODIGOTIP = 1');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := False;
    GrCPF.Visible := True;
  end

  else if ((CboStatus.ItemIndex = 2) and (CboTipoPessoa.ItemIndex = 1)) then
    //todos os inativo dos do Cpf
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where ATIVO = 0 and CODIGOTIP = 1');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := False;
    GrCPF.Visible := True;
  end

  else if ((CboStatus.ItemIndex = 1) and (CboTipoPessoa.ItemIndex = 2)) then
    //todos os ativo dos do CNPJ
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where ATIVO = 1 and CODIGOTIP = 2');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := True;
    GrCPF.Visible := False;
  end

  else if ((CboStatus.ItemIndex = 2) and (CboTipoPessoa.ItemIndex = 2)) then
    //todos os inativo dos do CNPJ
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where ATIVO = 0 and CODIGOTIP = 2');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := True;
    GrCPF.Visible := False;
  end

  else
    //busca por nome (verificar se tenho que fazer em todos
  begin

  end;
end;


procedure TFrmConsFornecedores.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsFornecedores.CboStatusChange(Sender: TObject);
begin
  BuscaDados();
end;

procedure TFrmConsFornecedores.CboTipoPessoaChange(Sender: TObject);
begin
  BuscaDados();
end;

procedure TFrmConsFornecedores.EdtConsultaChange(Sender: TObject);
begin
  if (CboTipoPessoa.ItemIndex = 1) then
    //CPF
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where CPF like' + QuotedStr('%' +
      EdtConsulta.Text + '%'));
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := False;
    GrCPF.Visible := True;
  end
  else if (CboTipoPessoa.ItemIndex = 2) then
    //CNPJ
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where CNPJ like' +
      QuotedStr('%' + EdtConsulta.Text + '%'));
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := False;
    GrCNPJ.Visible := True;
    GrCPF.Visible := False;
  end
  else
    //NOME
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add(
      'select * from vwpessoas where NOME like' +
      QuotedStr('%' + EdtConsulta.Text + '%'));
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    GrCNPJ.Visible := False;
    GrCPF.Visible := False;
  end;

end;

procedure TFrmConsFornecedores.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsPessoas.Active := False;
end;

procedure TFrmConsFornecedores.BtnSelecionarClick(Sender: TObject);
begin
  FrmCadFornecedor.OpForn := 'U';
  //PESSOA FÍSICA
  if (dm.ZQConsPessoasCODIGOTIP.AsInteger = 1) then
  begin
    FrmCadFornecedor.BtnCpf.Checked := True;
  end
  //  PESSOA JURÍDICA
  else if (dm.ZQConsPessoasCODIGOTIP.AsInteger = 2) then
  begin
    FrmCadFornecedor.BtnCnpj.Checked := True;
  end;
  //bloco de carga dos valores similares

  FrmCadFornecedor.pescodigo := seleciona;
  FrmCadFornecedor.EdtCpfCnpj.Text := dm.ZQConsPessoasCNPJ.AsString;
  FrmCadFornecedor.EdtCpfCnpj.Text := dm.ZQConsPessoasCPF.AsString;
  FrmCadFornecedor.EdtNome.Text := dm.ZQConsPessoasNOME.AsString;
  FrmCadFornecedor.DTNasc.Date := dm.ZQConsPessoasDATANASCIMENTO.AsDateTime;
  FrmCadFornecedor.EdtEndereco.Text := dm.ZQConsPessoasENDEREO.AsString;
  FrmCadFornecedor.EdtNumero.Text := dm.ZQConsPessoasNMERO.AsString;
  FrmCadFornecedor.EdtComplemento.Text := dm.ZQConsPessoasCOMPLEMENTO.AsString;
  FrmCadFornecedor.EdtBairro.Text := dm.ZQConsPessoasBAIRRO.AsString;
  FrmCadFornecedor.EdtCep.Text := dm.ZQConsPessoasCEP.AsString;
  FrmCadFornecedor.EdtCidade.Text := dm.ZQConsPessoasCIDADE.AsString;
  FrmCadFornecedor.CboUf.Text := dm.ZQConsPessoasESTADO.AsString;
  FrmCadFornecedor.EdtTel.Text := dm.ZQConsPessoasTELEFONE.AsString;
  FrmCadFornecedor.EdtCel.Text := dm.ZQConsPessoasCELULAR.AsString;
  FrmCadFornecedor.EdtEmail.Text := dm.ZQConsPessoasEMAIL.AsString;
  FrmCadFornecedor.MemObs.Text := dm.ZQConsPessoasOBSERVAO.AsString;
  FrmCadFornecedor.EdtFantasia.Text := dm.ZQConsPessoasNOMEFANTASIA.AsString;
  FrmCadFornecedor.EdtInsEstadual.Text := dm.ZQConsPessoasINSCRIOESTADUAL.AsString;
  FrmCadFornecedor.EdtInsMunicipal.Text := dm.ZQConsPessoasINSCRIOMUNICIPAL.AsString;

  //ajuste da visão do cad dento dos cons
  PnChama.Visible := True;
  FrmCadFornecedor.Parent := PnChama;
  FrmCadFornecedor.Align := alClient;
  FrmCadFornecedor.Show;
  FrmCadFornecedor.DesativaCampoForn();
end;

procedure TFrmConsFornecedores.BtnConsultaClick(Sender: TObject);
begin
  BuscaDados();
end;

procedure TFrmConsFornecedores.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsFornecedores.FormShow(Sender: TObject);
begin
  dm.ZQConsPessoas.Active := True;
  PnChama.Visible := False;
end;

procedure TFrmConsFornecedores.GrCNPJCellClick(Column: TColumn);
begin
  seleciona := dm.ZQConsPessoasCODIGO.AsInteger;
end;

procedure TFrmConsFornecedores.GrCPFCellClick(Column: TColumn);
begin
  seleciona := dm.ZQConsPessoasCODIGO.AsInteger;
end;

procedure TFrmConsFornecedores.GrTodosCellClick(Column: TColumn);
begin
  seleciona := dm.ZQConsPessoasCODIGO.AsInteger;
end;

end.
