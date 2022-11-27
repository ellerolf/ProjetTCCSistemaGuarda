unit UConsFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, ComCtrls, DBGrids, Menus, UModulo, uCadFornecedores;

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
    MenuItem1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    PnChama: TPanel;
    PopupMenu1: TPopupMenu;
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
    procedure MenuItem1Click(Sender: TObject);
    procedure PnChamaClick(Sender: TObject);
  private
    seleciona: integer;
    procedure BuscaDados();

  public
    test: integer;
  end;

var
  FrmConsFornecedores: TFrmConsFornecedores;

implementation

{$R *.lfm}

uses uCadLancamento, UConsBaixa;

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
  // validação abaixo é do Rafael, foi feito, para limpar os campos caso o cliente não selecione o fornecedor e clique em sair.
  if (FrmCadLancamento.AcionaBtnPesqForn = 'liga') then
  begin
    CboStatus.Enabled := True;
    CboStatus.ItemIndex := 0;
    CboTipoPessoa.ItemIndex := 0;
    EdtConsulta.Clear;
    FrmCadLancamento.AcionaBtnPesqForn := '';
    seleciona := 0;
    // Foi necessário colocar o código abaixo, pq quando a pessoa entrava em lançamento e saia, e depois abria consfornecedor
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    dm.ZQConsPessoas.Close;
    FrmConsFornecedores.Close;
  end;
  //validação abaixo é do rafael, foi feito para limpar os campos caso o usuário não selecione o fornecedor e clique em sair, antees
  //de selecionar o fornecedor
  if (FrmConsBaixa.acionaPesqForConsBaix = 'ConsBaixa') then
  begin
    CboStatus.Enabled := True;
    CboStatus.ItemIndex := 0;
    CboTipoPessoa.ItemIndex := 0;
    EdtConsulta.Clear;
    FrmConsBaixa.acionaPesqForConsBaix := '';
    seleciona := 0;
    // Foi necessário colocar o código abaixo, pq quando a pessoa entrava atraves de consbaixa e saia, e depois abria consfornecedor
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    dm.ZQConsPessoas.Close;
    FrmConsFornecedores.Close;
  end;
  //Gabi tive que deixar abaixo do meu código, pq se deixar em cima, ele vai executar o close primeiro e não vai pegar minha condição.
  //Se o usuario estiver direto na tela de consfornecedor e clicar em sair, minha condição será false, e ele vai fechar o consforn.
  FrmCadLancamento.PnChama.Visible := False;
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

  // validação abaixo é do Rafael, foi feito, para levar o código do cliente para o lançamento
  //tive que colocar por primeiro, pq essa minha condição estava sendo executada por ultimo, ai se o usuário sair da tela de lançamento
  // e ir cadastrar um fornecedor ele aparece os dados de fornecedor que foi selecionado na tela de lancamento.
  if (FrmCadLancamento.AcionaBtnPesqForn = 'liga') then
  begin
    if (seleciona > 0) then
    begin
      FrmCadLancamento.EdtConsFornecedor.Text := IntToStr(seleciona);
      CboStatus.Enabled := True;
      CboStatus.ItemIndex := 0;
      CboTipoPessoa.ItemIndex := 0;
      EdtConsulta.Clear;
      FrmCadLancamento.AcionaBtnPesqForn := '';

      dm.ZQConsPessoas.Close;
      dm.ZQConsPessoas.Sql.Clear;
      dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
      dm.ZQConsPessoas.Open;
      GrTodos.Visible := True;
      dm.ZQConsPessoas.Close;
      seleciona := 0;
      FrmConsFornecedores.Close;
    end;


    CboStatus.Enabled := True;
    CboStatus.ItemIndex := 0;
    CboTipoPessoa.ItemIndex := 0;
    EdtConsulta.Clear;
    FrmCadLancamento.AcionaBtnPesqForn := '';
    // Foi necessário colocar o código abaixo, pq quando a pessoa entrava em lançamento e saia, e depois abria consfornecedor
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    dm.ZQConsPessoas.Close;
    FrmConsFornecedores.Close;

  end;

  //código do Rafael, Codigo abaixo é para levar o cod do fornecedor para consbaixa, quando o usuario altera o fornecedor
  if (FrmConsBaixa.acionaPesqForConsBaix = 'ConsBaixa') then
  begin
    if (seleciona > 0) then
    begin
      FrmConsBaixa.EdtConsFornecedor.Text := IntToStr(seleciona);
      CboStatus.Enabled := True;
      CboStatus.ItemIndex := 0;
      CboTipoPessoa.ItemIndex := 0;
      EdtConsulta.Clear;
      FrmConsBaixa.acionaPesqForConsBaix := '';

      dm.ZQConsPessoas.Close;
      dm.ZQConsPessoas.Sql.Clear;
      dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
      dm.ZQConsPessoas.Open;
      GrTodos.Visible := True;
      dm.ZQConsPessoas.Close;
      seleciona := 0;
      FrmConsFornecedores.Close;
    end;

    //FrmConsBaixa.EdtConsFornecedor.Text:=IntToStr(seleciona);
    CboStatus.Enabled := True;
    CboStatus.ItemIndex := 0;
    CboTipoPessoa.ItemIndex := 0;
    EdtConsulta.Clear;
    FrmConsBaixa.acionaPesqForConsBaix := '';
    // Foi necessário colocar o código abaixo, pq quando a pessoa entrava em lançamento e saia, e depois abria consfornecedor
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas');
    dm.ZQConsPessoas.Open;
    GrTodos.Visible := True;
    dm.ZQConsPessoas.Close;
    FrmConsFornecedores.Close;
  end;

  //VALIDAÇÃO A PARTIR DAQUI PARA BAIXO É DA GABIIIII

  FrmCadFornecedor.OpForn := 'U';
  //PESSOA FÍSICA
  if (dm.ZQConsPessoasCODIGOTIP.AsInteger = 1) then
  begin
    FrmCadFornecedor.LblTitulo.Caption := 'Altera Fornecedores';
    FrmCadFornecedor.BtnCpf.Checked := True;
    FrmCadFornecedor.pescodigo := seleciona;
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
    FrmCadFornecedor.BtnAlterar.Visible := True;
    FrmCadFornecedor.GrpCnpjCpf.Enabled := False;
    FrmCadFornecedor.GrpStatus.Enabled := False;
  end
  //  PESSOA JURÍDICA
  else if (dm.ZQConsPessoasCODIGOTIP.AsInteger = 2) then
  begin
    FrmCadFornecedor.BtnCnpj.Checked := True;
    FrmCadFornecedor.pescodigo := seleciona;
    FrmCadFornecedor.EdtCpfCnpj.Text := dm.ZQConsPessoasCNPJ.AsString;
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
    FrmCadFornecedor.EdtInsMun.Text := dm.ZQConsPessoasINSCRIOMUNICIPAL.AsString;
    FrmCadFornecedor.BtnAlterar.Visible := True;
    FrmCadFornecedor.GrpCnpjCpf.Enabled := False;
    FrmCadFornecedor.GrpStatus.Enabled := False;
  end;

  //PROTEÇÃO DE DADOS LGPD
  if dm.ZQConsPessoasLGPD.AsBoolean then
  begin
    FrmCadFornecedor.PnLGPD.Visible := True;
    FrmCadFornecedor.BtnInativo.Checked := True;
    FrmCadFornecedor.BtnAlterar.Enabled := False;
    FrmCadFornecedor.MemObs.Text := 'FORNECEDOR SOBRE A LEI GERAL DE PROTEÇÃO DE DODOS';

  end;

  //ajuste da visão do cad dento dos cons
  PnChama.Visible := True;
  FrmCadFornecedor.Parent := PnChama;
  FrmCadFornecedor.Align := alClient;
  FrmCadFornecedor.Show;
  FrmCadFornecedor.DesativaCampoForn();
  FrmCadLancamento.PnChama.Visible := False;

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

procedure TFrmConsFornecedores.MenuItem1Click(Sender: TObject);
var
  PNome, LGPD: string;
begin

  PNome := '';
  if pos(' ', dm.ZQConsPessoasNOME.AsString) <> 0 then
    PNome := copy(dm.ZQConsPessoasNOME.AsString, 1,
      pos(' ', dm.ZQConsPessoasNOME.AsString) - 1);
  dm.ZQLgpd.ParamByName('pesnome').Value := PNome;
  dm.ZQLgpd.ParamByName('pescodigo').Value := dm.ZQConsPessoasCODIGO.AsInteger;
  dm.ZQLgpd.ExecSQL;

  dm.ZQConsPessoas.Close;
  dm.ZQConsPessoas.Open;
end;

procedure TFrmConsFornecedores.PnChamaClick(Sender: TObject);
begin

end;

end.
