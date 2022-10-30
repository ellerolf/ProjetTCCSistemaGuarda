unit uCadLancamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls, EditBtn, UBuscaDoc,Ferramentas;

type

  { TFrmCadLancamento }

  TFrmCadLancamento = class(TForm)
    BtnConsCentro: TSpeedButton;
    BtnConsCentro1: TSpeedButton;
    ChkDespesa: TRadioButton;
    ChkReceita: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    DTLancamento: TDateEdit;
    EdtTipoDocumento: TEdit;
    EdtConsCentro: TEdit;
    EdtConsFornecedor: TEdit;
    EdtNDoc: TEdit;
    EdtValor: TEdit;
    GrpTipo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    MemObservacao: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnConsTipoConta: TSpeedButton;
    Panel3: TPanel;
    procedure BtnConsCentro1Click(Sender: TObject);
    procedure BtnConsCentroClick(Sender: TObject);
    procedure BtnConsTipoContaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoDocChange(Sender: TObject);
    procedure ChkDespesaChange(Sender: TObject);
    procedure ChkReceitaChange(Sender: TObject);
    procedure DTLancamentoChange(Sender: TObject);
    procedure EdtDataChange(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public
    {Variável criada para facilitar a programação do limpar dados ao sair do conscentro}
   var AcionaBtnPesqCen: String;
   {Variável criada para facilitar a programação do limpar dados ao sair do consfornecedores}
   var AcionaBtnPesqForn: String;
     valorDoDocumento:Double;

     codigoDoLanc:Integer;
   CadOuAltLanDatValor:String;

  end;

var
  FrmCadLancamento: TFrmCadLancamento;

implementation

{$R *.lfm}

{ TFrmCadLancamento }

uses UModulo, UCadPagamento,uConsCentro, UConsFornecedores,UEntrarUsuario;

procedure TFrmCadLancamento.EdtDataChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.EdtValorChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.EdtValorExit(Sender: TObject);
begin
  //com o código abaixo ele formata e valida os campos.
  //mas é necessário colocar no onleypress e no onexit.
  //O codigo abaixo posso colocar em qualquer form desde que eu esteja usando a ferramenta no uses.
  (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFrmCadLancamento.EdtValorKeyPress(Sender: TObject; var Key: char);
begin
 //com o código abaixo ele formata e valida os campos.
 //mas é necessário colocar no onleypress e no onexit.
  Key := Simpl.SoValor(Key);
end;

procedure TFrmCadLancamento.FormCreate(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadLancamento.Panel2Click(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.BtnSairClick(Sender: TObject);
begin
  //Ao sair da tela o código abaixo faz a limpeza dos campos.
  DTLancamento.Clear;
  EdtTipoDocumento.Clear;
  EdtNDoc.Clear;
  EdtValor.Clear;
  EdtConsFornecedor.Clear;
  EdtConsCentro.Clear;
  MemObservacao.Clear;
  ChkDespesa.Checked:=False;
  ChkReceita.Checked:=False;
  //ao sair da tela de cad de lançamento zera a variável que identifica se é alteração ou insert
  CadOuAltLanDatValor:='';
  Close;
end;

procedure TFrmCadLancamento.BtnConsTipoContaClick(Sender: TObject);
begin
 FrmBuscaDoc.BuscaDocTela:='lanc';
  if (ChkReceita.Checked=false) and (ChkDespesa.Checked=False) then
  begin
    ShowMessage('Selecione o tipo de lançamento para escolher o tipo de documento');
  end;

  if (ChkReceita.Checked=True) then
  begin
    dm.ZQBuscaTipoDoc.Close;
    dm.ZQBuscaTipoDoc.SQL.Clear;
    dm.ZQBuscaTipoDoc.SQL.Add('SELECT * from tipo_documento WHERE DOCTIPO=1');
    dm.ZQBuscaTipoDoc.Open;
    FrmBuscaDoc.ShowModal;
  end;
   if (ChkDespesa.Checked=True) then
  begin
    dm.ZQBuscaTipoDoc.Close;
    dm.ZQBuscaTipoDoc.SQL.Clear;
    dm.ZQBuscaTipoDoc.SQL.Add('SELECT * from tipo_documento WHERE DOCTIPO=0');
    dm.ZQBuscaTipoDoc.Open;
    FrmBuscaDoc.ShowModal;
  end;
end;

procedure TFrmCadLancamento.BtnConsCentroClick(Sender: TObject);
begin
    if (ChkReceita.Checked=false) and (ChkDespesa.Checked=False) then
    begin
    ShowMessage('Selecione o tipo de lançamento para escolher o centro de custo');
     end;

    AcionaBtnPesqCen:='ativa';

    if(AcionaBtnPesqCen='ativa') then
    begin
     if (ChkReceita.Checked=True) then
     BEGIN
        DM.ZQBuscaCentro.Close;
        DM.ZQBuscaCentro.SQL.Clear;
        DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=1 and censtatus=1');
        DM.ZQBuscaCentro.Open;

       FrmConsCentro.BtnSelecione.Visible:=True;
       FrmConsCentro.CboTipo.Enabled:=False;
       FrmConsCentro.CboTipo.ItemIndex:=1;
       FrmConsCentro.CboStatus.Enabled:=False;
       FrmConsCentro.CboStatus.ItemIndex:=1;
       FrmConsCentro.Show;
     end;

        if (ChkDespesa.Checked=True) then
     BEGIN
        DM.ZQBuscaCentro.Close;
        DM.ZQBuscaCentro.SQL.Clear;
        DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=2 and censtatus=1');
        DM.ZQBuscaCentro.Open;

       FrmConsCentro.BtnSelecione.Visible:=True;
       FrmConsCentro.CboTipo.Enabled:=False;
       FrmConsCentro.CboTipo.ItemIndex:=2;
       FrmConsCentro.CboStatus.Enabled:=False;
       FrmConsCentro.CboStatus.ItemIndex:=1;
       FrmConsCentro.Show;
     end;
    end;
end;

procedure TFrmCadLancamento.BtnConsCentro1Click(Sender: TObject);
begin
  AcionaBtnPesqForn:='liga';

  if(AcionaBtnPesqForn='liga') then
  begin
    if (ChkReceita.Checked=True) or (ChkDespesa.Checked=True) then
    begin
    dm.ZQConsPessoas.Close;
    dm.ZQConsPessoas.Sql.Clear;
    dm.ZQConsPessoas.sql.Add('select * from vwpessoas where ativo=1');
    dm.ZQConsPessoas.Open;
    FrmConsFornecedores.CboStatus.Enabled:=false;
    FrmConsFornecedores.CboStatus.ItemIndex:=1;
    FrmConsFornecedores.Show;
    end;

  end;

end;

procedure TFrmCadLancamento.BtnSalvarClick(Sender: TObject);
begin
  if (CadOuAltLanDatValor='i') then
  begin
    //validação para ver se os campos estão preenchidos

     if(ChkReceita.Checked=False) and (ChkDespesa.Checked=False) then
    begin
      ShowMessage('Selecione o tipo do lançamento');
    end
    else if (DTLancamento.Text='') then
    begin
      ShowMessage('Digite a data do lançamento');
      DTLancamento.SetFocus;
    end
    else if (EdtTipoDocumento.Text='') then
    begin
      ShowMessage('Selecione o tipo de documento');
    end
    else if (EdtNDoc.Text='') then
    begin
      ShowMessage('Número do documento é obrigatório');
      EdtNDoc.SetFocus;
    end
    else if (EdtConsFornecedor.Text='') then
    begin
      ShowMessage('O campo fornecedor é obrigatório');
    end
    else if (EdtConsCentro.Text='') then
    begin
      ShowMessage('O centro de custo é um campo obrigatório');
    end
    else if (EdtValor.Text='') or (EdtValor.Text= '0,00') then
    begin
      ShowMessage('Valor do documento é um campo obrigatório');
      EdtValor.SetFocus;
    end
    else
    begin
      valorDoDocumento:=StrToFloat(EdtValor.Text);
      FrmCadParcela.LblValor.Caption:=FormatFloat('R$ 0.00',valorDoDocumento);
      FrmCadParcela.restante:=valorDoDocumento;
      FrmCadParcela.LblValorRestante.Caption:=FormatFloat('R$ 0.00',valorDoDocumento);
      FrmCadParcela.EdtValorLanc.Text:=formatFloat('0.00',valorDoDocumento);

        if (ChkReceita.Checked=True) then
      begin
        dm.ZQCadLancamentos.Params.ParamByName('pLANTIPO').Value:=1;
      end;
      if (ChkDespesa.Checked=True) then
      begin
        dm.ZQCadLancamentos.Params.ParamByName('pLANTIPO').Value:=0;
      end;

      dm.ZQCadLancamentos.Params.ParamByName('pLANDOCUMENTO').AsString:=FormatDateTime('yyyy-mm-dd',DTLancamento.Date);
      dm.ZQCadLancamentos.Params.ParamByName('pCODIGODOC').Value:=EdtTipoDocumento.Text;
      dm.ZQCadLancamentos.Params.ParamByName('pLANNUMERO_DOCUMENTO').Value:=EdtNDoc.Text;
      EdtValor.Text:=StringReplace(EdtValor.Text, ',', '.', [rfReplaceAll]);
      dm.ZQCadLancamentos.Params.ParamByName('pLANVALOR_DOCUMENTO').Value:=EdtValor.Text;
      dm.ZQCadLancamentos.Params.ParamByName('pCODIGOPES').Value:=EdtConsFornecedor.Text;
      dm.ZQCadLancamentos.Params.ParamByName('pCODIGOCEN').Value:=EdtConsCentro.Text;
      dm.ZQCadLancamentos.Params.ParamByName('pLANOBSERVACAO').Value:=MemObservacao.Text;
      dm.ZQCadLancamentos.Params.ParamByName('pCODIGOUSU').Value:=FrmEntrarUsuario.indentidade;
      dm.ZQCadLancamentos.ExecSQL;

      dm.ZQConsLancamentos.close;
      dm.ZQConsLancamentos.Open;
      dm.ZQConsLancamentos.Last;
      codigoDoLanc:=DM.ZQConsLancamentosLANCODIGO.AsInteger;

       //Foi necessário esse código abaixo pq quando eu abri consulta de pagto, e depois ia fazer um lançamento
       //a dbgrid iniciava com os dados da consulta feita anteriormente, isso acontece pq uso a mesma querry.
       //o código abaixo faz ela começar em branco
       dm.ZQConsLanData.Close;
       dm.ZQConsLanData.SQL.Clear;
       dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(FrmCadLancamento.codigoDoLanc));
       dm.ZQConsLanData.Open;

      ShowMessage('Agora efetue o cadastro das parcelas');
      FrmCadParcela.ShowModal;
      //Código abaixo é para limpar as edt.
      DTLancamento.Clear;
      EdtTipoDocumento.Clear;
      EdtNDoc.Clear;
      EdtValor.Clear;
      EdtConsFornecedor.Clear;
      EdtConsCentro.Clear;
      MemObservacao.Clear;
      ChkDespesa.Checked:=False;
      ChkReceita.Checked:=False;

    end;
  end;

end;



procedure TFrmCadLancamento.CboTipoDocChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.ChkDespesaChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.ChkReceitaChange(Sender: TObject);
begin
  {Se o usuário alterar lançamento entre despesa e receita, o centro de custo, tipo de documento
  precisa ser alterado, pois existe tipo receita e despesas para o centro de custo, tipo de documento.}

  if (ChkReceita.Checked=True) then
  begin
    EdtTipoDocumento.Clear;
    EdtConsCentro.Clear;
  end;

  if (ChkDespesa.Checked=True) then
  begin
    EdtTipoDocumento.Clear;
    EdtConsCentro.Clear;
  end;

end;

procedure TFrmCadLancamento.DTLancamentoChange(Sender: TObject);
begin

end;

end.
