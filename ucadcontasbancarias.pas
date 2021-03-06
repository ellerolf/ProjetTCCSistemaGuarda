unit uCadContasBancarias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls, DBCtrls, EditBtn, UModulo, UBuscaConta;

type

  { TFrmCadContasBancarias }

  TFrmCadContasBancarias = class(TForm)
    BtnConsultaO: TSpeedButton;
    CboTipo: TDBLookupComboBox;
    DtDataTransf: TDateEdit;
    EdtCodContaO: TEdit;
    EdtCodContaDes: TEdit;
    EdtNomeConta: TEdit;
    Label8: TLabel;
    RGBStatusTransf: TRadioGroup;
    RGBStatusConta: TRadioGroup;
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
    BtnConsultaD: TSpeedButton;
    procedure BtnConsultaDClick(Sender: TObject);
    procedure BtnConsultaOClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoChange(Sender: TObject);
    procedure EdtSaldoInicialChange(Sender: TObject);
    procedure EdtSaldoInicialKeyPress(Sender: TObject; var Key: char);
    procedure EdtVlrTrasKeyPress(Sender: TObject; var Key: char);
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
    { Se acionabtnO ou acionabtnD receberem 'u' ou 'i' vai startar o precedimento
    para que quando usuario selecionar a conta na grid as edit destino ou origem
    receba o numero da conta}
     AcionaBtnO:string;
     AcionaBtnD:String;
     {Se 'AcionaConsConta do tipo string receber 'u' vai habilitar a consulta,
     se AcionaCadConta receber 'i' vai habilitar o cadastro'}
     OpeCadOuAltConta:string;
      {Se 'OpecadOuAltTransf' do tipo string receber 'U' vai habilitar a consulta,
     se OpecadOuAltTransf receber 'I' vai habilitar o cadastro'}
     OpecadOuAltTransf: string

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
  OpeCadOuAltConta:='';
  OpecadOuAltTransf:='';
  RdbCadTrans.Enabled:=True;
  RdbCadConta.Enabled:=True;
  RGBStatusConta.Visible:=False;
  RGBStatusTransf.Visible:=False;
  RdbCadConta.Caption:='Cadastro de Contas';
  RdbCadTrans.Caption:='Cadastro de Transfer??ncia';
  Close;
end;

procedure TFrmCadContasBancarias.BtnConsultaOClick(Sender: TObject);
begin
  AcionaBtnO:='o';
  FrmBuscaConta.ShowModal;
end;

procedure TFrmCadContasBancarias.BtnConsultaDClick(Sender: TObject);
begin
     AcionaBtnD:='d';
     FrmBuscaConta.ShowModal;
end;

procedure TFrmCadContasBancarias.BtnSalvarClick(Sender: TObject);
begin
      //opera????o para cadastro
  if (OpeCadOuAltConta='i') then
  begin

    if (RdbCadConta.Checked = False) and (RdbCadTrans.Checked = False) then
    begin
      ShowMessage('Selecione uma opera????o');
    end;

    if (RdbCadConta.Checked = True) and (CboTipo.KeyValue <> 3) then
    begin
      if (CboTipo.Text = '') then
      begin
        ShowMessage('Selecione o tipo da conta para continuar o cadastro!');
        CboTipo.SetFocus;
      end
      else if (CboBanco.Text = '') then
      begin
        ShowMessage('Selecione o banco para continuar o cadastro!');
        CboBanco.SetFocus;
      end
      else if (EdtAgencia.Text = '') then
      begin
        ShowMessage('O preenchimento do n??mero da ag??ncia ?? obrigat??rio!');
        EdtAgencia.SetFocus;
      end
      else if (EdtNConta.Text = '') then
      begin
        ShowMessage('O preenchimento do n?? da conta ?? obrigat??rio!');
        EdtNConta.SetFocus;
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
        RdbCadConta.Checked:=false;

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
        RdbCadConta.Checked:=false;
      end;
    end;
  end;

    // opera????o para altera????o de conta
   if (OpeCadOuAltConta='u') then
  begin

    if (RdbCadConta.Checked = True) and (CboTipo.KeyValue <> 3) then
    begin
      if (CboTipo.Text = '') then
      begin
        ShowMessage('Selecione o tipo da conta para continuar com a altera????o!');
        CboTipo.SetFocus;
      end
      else if (CboBanco.Text = '') then
      begin
        ShowMessage('Selecione o banco para continuar com a altera????o!');
        CboBanco.SetFocus;
      end
      else if (EdtAgencia.Text = '') then
      begin
        ShowMessage('O preenchimento do n??mero da ag??ncia ?? obrigat??rio!');
        EdtAgencia.SetFocus;
      end
      else if (EdtNConta.Text = '') then
      begin
        ShowMessage('O preenchimento do n?? da conta ?? obrigat??rio!');
        EdtNConta.SetFocus;
      end
      else
      begin
        if (RGBStatusConta.ItemIndex=0)then
        begin
          dm.ZQAltBancarias.ParamByName('pconstatus').Value:=1;
        end;

        if (RGBStatusConta.ItemIndex=1)then
        begin
          dm.ZQAltBancarias.ParamByName('pconstatus').Value:=0;
        end;

        dm.ZQAltBancarias.Params.ParamByName('pcodigotip').Value := CboTipo.KeyValue;
        dm.ZQAltBancarias.Params.ParamByName('pconnome').Value := CboBanco.Text;
        dm.ZQAltBancarias.Params.ParamByName('pconagencia').Value := EdtAgencia.Text;
        dm.ZQAltBancarias.Params.ParamByName('pconnumero_conta').Value := EdtNConta.Text;
        EdtSaldoInicial.Text :=StringReplace(EdtSaldoInicial.Text, ',', '.', [rfReplaceAll]);
        dm.ZQAltBancarias.Params.ParamByName('pconsaldo_inicial').Value :=EdtSaldoInicial.Text;
        dm.ZQAltBancarias.ParamByName('pconcodigo').Value:=dm.ZQConsBancariasCONCODIGO.AsInteger;
        dm.ZQAltBancarias.ExecSQL;

        dm.ZQConsBancarias.Close;
        dm.ZQConsBancarias.Open;

        ShowMessage('Conta alterada com sucesso!');
        RGBStatusConta.Visible:=False;
        RdbCadTrans.Enabled:=True;
        RdbCadConta.Caption:='Cadastro de Contas';
        OpeCadOuAltConta:='';
        FrmCadContasBancarias.Close;

        {CboTipo.ClearSelection;
        CboBanco.ClearSelection;
        EdtAgencia.Clear;
        EdtNConta.Clear;
        EdtSaldoInicial.Clear;
        RdbCadConta.Checked:=false;}

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
        if (RGBStatusConta.ItemIndex=0)then
        begin
          dm.ZQAltBancarias.ParamByName('pconstatus').Value:=1;
        end;

        if (RGBStatusConta.ItemIndex=1)then
        begin
          dm.ZQAltBancarias.ParamByName('pconstatus').Value:=0;
        end;

        dm.ZQAltBancarias.Params.ParamByName('pcodigotip').Value :=CboTipo.KeyValue;
        dm.ZQAltBancarias.Params.ParamByName('pconnome').Value :=EdtNomeConta.Text;
        EdtSaldoInicial.Text :=StringReplace(EdtSaldoInicial.Text, ',', '.', [rfReplaceAll]);
        dm.ZQAltBancarias.Params.ParamByName('pconsaldo_inicial').Value :=EdtSaldoInicial.Text;
        dm.ZQAltBancarias.Params.ParamByName('pconagencia').value:=Null;
        dm.ZQAltBancarias.Params.ParamByName('pconnumero_conta').value:=Null;
        dm.ZQAltBancarias.ParamByName('pconcodigo').Value:=dm.ZQConsBancariasCONCODIGO.AsInteger;
        dm.ZQAltBancarias.ExecSQL;

        dm.ZQConsBancarias.Close;
        dm.ZQConsBancarias.Open;

        ShowMessage('Conta alterada com sucesso!');
        RGBStatusConta.Visible:=False;
        RdbCadTrans.Enabled:=True;
        RdbCadConta.Caption:='Cadastro de Contas';
        OpeCadOuAltConta:='';
        FrmCadContasBancarias.Close;

        {CboTipo.ClearSelection;
        EdtNomeConta.Clear;
        EdtSaldoInicial.Clear;
        RdbCadConta.Checked:=false;}
      end;
    end;
  end;



  // programa????o para cadastro da transfer??ncia
  if(OpecadOuAltTransf='I') then
  begin

   if (RdbCadTrans.Checked=true) then
   begin
        if (DtDataTransf.Text='') then
        begin
          ShowMessage('Voc?? n??o preencheu a data da transfer??ncia, este campo ?? um campo obrigat??rio');
          DtDataTransf.SetFocus;
        end
        else if (EdtNDoc.Text='') then
        begin
             ShowMessage('Voc?? n??o preencheu o n??mero do documento, este campo ?? um campo obrigat??rio');
             EdtNDoc.SetFocus;
        end
        else if (EdtVlrTras.Text='') then
        begin
              ShowMessage('Voc?? n??o preencheu o valor da transfer??ncia, este campo ?? um campo obrigat??rio');
              EdtVlrTras.SetFocus;
        end
        else if (EdtCodContaO.Text='') then
        begin
              ShowMessage('Voc?? n??o preencheu o c??digo da conta de origem, este campo ?? um campo obrigat??rio');
              EdtCodContaO.SetFocus;
        end
        else if (EdtCodContaDes.Text='') then
        begin
             ShowMessage('Voc?? n??o preencheu o c??digo da conta de destino, este campo ?? um campo obrigat??rio');
             EdtCodContaDes.SetFocus;
        end
        else if (EdtCodContaO.Text=EdtCodContaDes.Text) then
        begin
             ShowMessage('C??digo da conta de origem ?? a mesma do c??digo da conta de destino, verifique!');
             EdtCodContaDes.Clear;
             EdtCodContaDes.SetFocus;
        end
        else
        begin
          dm.ZQCadTransferencia.Params.ParamByName('pTRADATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataTransf.Date);
          dm.ZQCadTransferencia.Params.ParamByName('pTRANUMERO_DOCUMENTO').Value:=EdtNDoc.Text;
          EdtVlrTras.Text :=StringReplace(EdtVlrTras.Text, ',', '.', [rfReplaceAll]);
          dm.ZQCadTransferencia.Params.ParamByName('pTRAVALOR').Value:=EdtVlrTras.Text;
          dm.ZQCadTransferencia.Params.ParamByName('pTRACODIGO_CONORI').Value:=EdtCodContaO.Text;
          dm.ZQCadTransferencia.Params.ParamByName('pTRACODIGO_CONDES').Value:=EdtCodContaDes.Text;
          dm.ZQCadTransferencia.ExecSQL;
          ShowMessage('Transfer??ncia cadastrada com sucesso!');
          DtDataTransf.Clear;
          EdtNDoc.Clear;
          EdtVlrTras.Clear;
          EdtCodContaO.clear;
          EdtCodContaDes.clear;
          RdbCadTrans.Checked:=false;
        end;
   end;
  end;
    // opera????o para altera????o da transfer??ncia

      if(OpecadOuAltTransf='U') then
  begin

   if (RdbCadTrans.Checked=true) then
   begin
        if (DtDataTransf.Text='') then
        begin
          ShowMessage('Voc?? n??o preencheu a data da transfer??ncia, este campo ?? um campo obrigat??rio');
          DtDataTransf.SetFocus;
        end
        else if (EdtNDoc.Text='') then
        begin
             ShowMessage('Voc?? n??o preencheu o n??mero do documento, este campo ?? um campo obrigat??rio');
             EdtNDoc.SetFocus;
        end
        else if (EdtVlrTras.Text='') then
        begin
              ShowMessage('Voc?? n??o preencheu o valor da transfer??ncia, este campo ?? um campo obrigat??rio');
              EdtVlrTras.SetFocus;
        end
        else if (EdtCodContaO.Text='') then
        begin
              ShowMessage('Voc?? n??o preencheu o c??digo da conta de origem, este campo ?? um campo obrigat??rio');
              EdtCodContaO.SetFocus;
        end
        else if (EdtCodContaDes.Text='') then
        begin
             ShowMessage('Voc?? n??o preencheu o c??digo da conta de destino, este campo ?? um campo obrigat??rio');
             EdtCodContaDes.SetFocus;
        end
        else if (EdtCodContaO.Text=EdtCodContaDes.Text) then
        begin
             ShowMessage('C??digo da conta de origem ?? a mesma do c??digo da conta de destino, verifique!');
             EdtCodContaDes.Clear;
             EdtCodContaDes.SetFocus;
        end
        else
        begin

          if (RGBStatusTransf.ItemIndex=0)then
        begin
          dm.ZQAltTransferencia.ParamByName('pTRASTATUS').Value:=1;
        end;

        if (RGBStatusTransf.ItemIndex=1)then
        begin
          dm.ZQAltTransferencia.ParamByName('pTRASTATUS').Value:=0;
        end;

          dm.ZQAltTransferencia.Params.ParamByName('pTRADATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataTransf.Date);
          dm.ZQAltTransferencia.Params.ParamByName('pTRANUMERO_DOCUMENTO').Value:=EdtNDoc.Text;
          EdtVlrTras.Text :=StringReplace(EdtVlrTras.Text, ',', '.', [rfReplaceAll]);
          dm.ZQAltTransferencia.Params.ParamByName('pTRAVALOR').Value:=EdtVlrTras.Text;
          dm.ZQAltTransferencia.Params.ParamByName('pTRACODIGO_CONORI').Value:=EdtCodContaO.Text;
          dm.ZQAltTransferencia.Params.ParamByName('pTRACODIGO_CONDES').Value:=EdtCodContaDes.Text;
          dm.ZQAltTransferencia.Params.ParamByName('ptracodigo').Value:=DM.ZQConsTransferenciaTRACODIGO.AsInteger;
          dm.ZQAltTransferencia.ExecSQL;
          ShowMessage('Transfer??ncia alterada com sucesso!');

          dm.ZQConsTransferencia.Close;
          dm.ZQConsTransferencia.Open;

          RGBStatusTransf.Visible:=False;
          RdbCadConta.Enabled:=True;
          RdbCadTrans.Caption:='Cadastro de Transfer??ncia';
          OpecadOuAltTransf:='';
          FrmCadContasBancarias.Close;

          {EdtNDoc.Clear;
          DtDataTransf.Clear;
          EdtVlrTras.Clear;
          EdtCodContaO.clear;
          EdtCodContaDes.clear;
          RdbCadTrans.Checked:=false;}
        end;
   end;
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
    //o clearselection ele apaga apenas o item que est?? selecionado, e n??o todos os itens da lista
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
    EdtNomeConta.Clear;
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

procedure TFrmCadContasBancarias.EdtVlrTrasKeyPress(Sender: TObject;
  var Key: char);
begin
  if not (key in['0'..'9',#8,',']) then
  begin
    key:=#0;
    Beep;
  end;
end;

procedure TFrmCadContasBancarias.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsTipoConta.Active := False;
  RdbCadConta.Checked:=false;
  RdbCadTrans.Checked:=false;
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
    DtDataTransf.Enabled:=true;
    EdtNDoc.Enabled:=true;
    EdtVlrTras.Enabled:=true;
    EdtCodContaO.Enabled:=true;
    EdtCodContaDes.Enabled:=true;
    BtnConsultaO.Enabled:=true;
    BtnConsultaD.Enabled:=true;
    //Se cadastro de transf. for true, cad. de conta tem que ser false
    RdbCadConta.Checked := False;
  end
  else
  begin
    DtDataTransf.Enabled:=false;
    EdtNDoc.Enabled:=false;
    EdtVlrTras.Enabled:=false;
    EdtCodContaO.Enabled:=false;
    EdtCodContaDes.Enabled:=false;
    BtnConsultaO.Enabled:=false;
    BtnConsultaD.Enabled:=false;
    //para limpar a tela caso tenha algo digitado e o usuario aperte cad. conta
    DtDataTransf.Clear;
    EdtNDoc.Clear;
    EdtVlrTras.Clear;
    EdtCodContaO.Clear;
    EdtCodContaDes.clear;
  end;
end;

end.
