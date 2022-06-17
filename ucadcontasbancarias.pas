unit uCadContasBancarias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls, DBCtrls, EditBtn, UModulo, UBuscaConta;

type

  { TFrmCadContasBancarias }

  TFrmCadContasBancarias = class(TForm)
    BtnConsulta: TSpeedButton;
    CboTipo: TDBLookupComboBox;
    DtDataTransf: TDateEdit;
    EdtCodContaO: TEdit;
    EdtCodContaDes: TEdit;
    EdtNomeConta: TEdit;
    Label8: TLabel;
    RdbCadConta: TRadioButton;
    RdbCadTrans: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboBanco: TComboBox;
    EdtAgencia: TEdit;
    EdtNConta: TEdit;
    EdtNDoc: TEdit;
    EdtSaldoInicial: TEdit;
    EdtVlrTras: TEdit;
    GrpCadastro: TGroupBox;
    GrpTrasfe: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoChange(Sender: TObject);
    procedure EdtSaldoInicialChange(Sender: TObject);
    procedure EdtSaldoInicialKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure RdbCadContaChange(Sender: TObject);
    procedure RdbCadTransChange(Sender: TObject);
  private

  public

  end;

var
  FrmCadContasBancarias: TFrmCadContasBancarias;

implementation

{$R *.lfm}

{ TFrmCadContasBancarias }



procedure TFrmCadContasBancarias.Label5Click(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadContasBancarias.BtnConsultaClick(Sender: TObject);
begin
  FrmBuscaConta.Show;
end;

procedure TFrmCadContasBancarias.BtnSalvarClick(Sender: TObject);
begin
  if (RdbCadConta.Checked = False) and (RdbCadTrans.Checked = False) then
  begin
    ShowMessage('Selecione uma operação');
  end;

  if (RdbCadConta.Checked = True) and (CboTipo.KeyValue <> 3) then
  begin
    if (CboTipo.Text = '') then
    begin
      ShowMessage('Selecione o tipo da conta para continuar o cadastro!');
    end
    else if (CboBanco.Text = '') then
    begin
      ShowMessage('Selecione o banco para continuar o cadastro!');
    end
    else if (EdtAgencia.Text = '') then
    begin
      ShowMessage('O preenchimento do número da agência é obrigatório!');
    end
    else if (EdtNConta.Text = '') then
    begin
      ShowMessage('O preenchimento do n° da conta é obrigatório!');
    end
    else
    begin
      dm.ZQCadBancarias.Params.ParamByName('pcodigotip').Value := CboTipo.KeyValue;
      dm.ZQCadBancarias.Params.ParamByName('pconnome').Value := CboBanco.Text;
      dm.ZQCadBancarias.Params.ParamByName('pconagencia').Value := EdtAgencia.Text;
      dm.ZQCadBancarias.Params.ParamByName('pconnumero_conta').Value := EdtNConta.Text;
      EdtSaldoInicial.Text :=StringReplace(EdtSaldoInicial.Text, ',', '.', [rfReplaceAll]);
      dm.ZQCadBancarias.Params.ParamByName('pconsaldo_inicial').Value :=EdtSaldoInicial.Text;
      dm.ZQCadBancarias.ExecSQL;
      ShowMessage('Conta registrada com sucesso!');
      CboTipo.ClearSelection;
      CboBanco.ClearSelection;
      EdtAgencia.Clear;
      EdtNConta.Clear;
      EdtSaldoInicial.Clear;
      CboTipo.SetFocus;

    end;

  end;
  if (RdbCadConta.Checked = True) and (CboTipo.KeyValue = 3) then
  begin
    if (EdtNomeConta.Text = '') then
    begin
      ShowMessage('Digite um nome para essa conta caixa!');
    end
    else
    begin
      dm.ZQCadBancarias.Params.ParamByName('pcodigotip').Value :=CboTipo.KeyValue;
      dm.ZQCadBancarias.Params.ParamByName('pconnome').Value :=EdtNomeConta.Text;
      EdtSaldoInicial.Text :=StringReplace(EdtSaldoInicial.Text, ',', '.', [rfReplaceAll]);
      dm.ZQCadBancarias.Params.ParamByName('pconsaldo_inicial').Value :=EdtSaldoInicial.Text;
      dm.ZQCadBancarias.Params.ParamByName('pconagencia').value:=Null;
      dm.ZQCadBancarias.Params.ParamByName('pconnumero_conta').value:=Null;
      dm.ZQCadBancarias.ExecSQL;
      ShowMessage('Conta registrada com sucesso!');
      CboTipo.ClearSelection;
      EdtNomeConta.Clear;
      EdtSaldoInicial.Clear;
      CboTipo.SetFocus;
    end;
  end;

  // programação da transferência
   if (RdbCadTrans.Checked=true) then
   begin
       dm.ZQCadTransferencia.Params.ParamByName('pTRADATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataTransf.Date);
       dm.ZQCadTransferencia.Params.ParamByName('pTRANUMERO_DOCUMENTO').Value:=EdtNDoc.Text;
       dm.ZQCadTransferencia.Params.ParamByName('pTRAVALOR').Value:=EdtVlrTras.Text;
       dm.ZQCadTransferencia.Params.ParamByName('pTRACODIGO_CONORI').Value:=EdtCodContaO.Text;
       dm.ZQCadTransferencia.Params.ParamByName('pTRACODIGO_CONDES').Value:=EdtCodContaDes.Text;
       dm.ZQCadTransferencia.ExecSQL;
       ShowMessage('Transferência cadastrada com sucesso!');
       DtDataTransf.Clear;
       EdtNDoc.Clear;
       EdtVlrTras.Clear;
       EdtCodContaO.clear;
       EdtCodContaDes.clear;

   end;


end;



procedure TFrmCadContasBancarias.CboTipoChange(Sender: TObject);
begin
  if CboTipo.KeyValue = 3 then
  begin
    EdtSaldoInicial.Enabled := True;
    EdtNomeConta.Enabled := True;
    EdtNConta.Enabled := False;
    EdtAgencia.Enabled := False;
    CboBanco.Enabled := False;
    EdtNomeConta.SetFocus;
    EdtNConta.Clear;
    EdtAgencia.Clear;
    //o clearselection ele apaga apenas o item que está selecionado, e não todos os itens da lista
    CboBanco.ClearSelection;
    EdtNConta.Clear;
  end
  else
  begin
    EdtSaldoInicial.Enabled := True;
    EdtAgencia.Enabled := True;
    EdtNConta.Enabled := True;
    CboBanco.Enabled := True;
    EdtNomeConta.Enabled := false;
    CboBanco.SetFocus;
  end;
end;

procedure TFrmCadContasBancarias.EdtSaldoInicialChange(Sender: TObject);

begin

end;

procedure TFrmCadContasBancarias.EdtSaldoInicialKeyPress(Sender: TObject;
  var Key: char);
begin
  if not (key in ['0'..'9', #8, ',']) then
  begin
    key := #0;
    Beep;
  end;
end;

procedure TFrmCadContasBancarias.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsTipoConta.Active := False;
end;

procedure TFrmCadContasBancarias.FormCreate(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadContasBancarias.FormShow(Sender: TObject);
begin
  dm.ZQConsTipoConta.Active := True;

end;

procedure TFrmCadContasBancarias.MaskEdit1Change(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.Panel1Click(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.Panel2Click(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.RdbCadContaChange(Sender: TObject);
begin
  if RdbCadConta.Checked = True then
  begin
    CboTipo.Enabled := True;
    RdbCadTrans.Checked := False;
  end
  else
  begin
    CboTipo.Enabled := False;
    CboTipo.ClearSelection;
    //ajuste
    CboBanco.ClearSelection;
    EdtAgencia.Clear;
    EdtNConta.Clear;
    EdtNomeConta.Clear;
    EdtSaldoInicial.Clear;
    CboBanco.Enabled := False;
    EdtAgencia.Enabled := False;
    EdtNConta.Enabled := False;
    EdtNomeConta.Enabled := False;
    EdtSaldoInicial.Enabled := False;

  end;
end;

procedure TFrmCadContasBancarias.RdbCadTransChange(Sender: TObject);
begin
  if RdbCadTrans.Checked = True then
  begin
    RdbCadConta.Checked := False;
  end;
end;

end.
