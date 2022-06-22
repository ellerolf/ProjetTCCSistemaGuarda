unit UConsFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, ComCtrls, DBGrids, UModulo;

type

  { TFrmConsFornecedores }

  TFrmConsFornecedores = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnConsulta: TSpeedButton;
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
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CboStatusChange(Sender: TObject);
    procedure CboTipoPessoaChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrCNPJCellClick(Column: TColumn);
    procedure Label8Click(Sender: TObject);
  private
    procedure BuscaDados();
  public

  end;

var
  FrmConsFornecedores: TFrmConsFornecedores;

implementation

{$R *.lfm}

{ TFrmConsFornecedores }

procedure TFrmConsFornecedores.Label8Click(Sender: TObject);
begin

end;

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
    GrTodos.Visible := false;
    GrCNPJ.Visible := False;
    GrCPF.Visible := true;
  end
  else if ((CboStatus.ItemIndex = 0) and (CboTipoPessoa.ItemIndex = 2)) then
    //todos dos do CNPJ
  begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas where CODIGOTIP = 2');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := false;
    GrCNPJ.Visible := true;
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

end;

procedure TFrmConsFornecedores.CboTipoPessoaChange(Sender: TObject);
begin

end;

procedure TFrmConsFornecedores.EdtConsultaChange(Sender: TObject);
begin
  if ((CboStatus.ItemIndex = 0) and (CboTipoPessoa.ItemIndex = 0)) then
    //FAZER O IF SANDO CBOTIPO
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

procedure TFrmConsFornecedores.BtnAlterarClick(Sender: TObject);
begin

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
end;

procedure TFrmConsFornecedores.GrCNPJCellClick(Column: TColumn);
begin

end;

end.
