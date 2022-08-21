unit uCadLancamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls, EditBtn, UBuscaDoc;

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
    procedure BtnConsTipoContaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoDocChange(Sender: TObject);
    procedure ChkDespesaChange(Sender: TObject);
    procedure ChkReceitaChange(Sender: TObject);
    procedure DTLancamentoChange(Sender: TObject);
    procedure EdtDataChange(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: char);
    procedure FormResize(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadLancamento: TFrmCadLancamento;

implementation

{$R *.lfm}

{ TFrmCadLancamento }

uses UModulo;

procedure TFrmCadLancamento.EdtDataChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.EdtValorKeyPress(Sender: TObject; var Key: char);
begin
   if not (key in ['0'..'9', #8, ',']) then
  begin
    key := #0;
    Beep;
  end;
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
  Close;
end;

procedure TFrmCadLancamento.BtnConsTipoContaClick(Sender: TObject);
begin
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

procedure TFrmCadLancamento.BtnSalvarClick(Sender: TObject);
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
    EdtTipoDocumento.SetFocus;
  end
  else if (EdtNDoc.Text='') then
  begin
    ShowMessage('Número do documento é obrigatório');
    EdtNDoc.SetFocus;
  end
  else if (EdtConsFornecedor.Text='') then
  begin
    ShowMessage('O campo fornecedor é obrigatório');
    EdtConsFornecedor.SetFocus;
  end
  else if (EdtConsCentro.Text='') then
  begin
    ShowMessage('O centro de custo é um campo obrigatório');
    EdtConsCentro.SetFocus;
  end
  else if (EdtValor.Text='') then
  begin
    ShowMessage('Valor do documento é um campo obrigatório');
    EdtValor.SetFocus;
  end
  else
  begin
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
    dm.ZQCadLancamentos.Params.ParamByName('pCODIGOUSU').Value:=1;
    dm.ZQCadLancamentos.ExecSQL;
    ShowMessage('Cadastro realizado com sucesso');

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
