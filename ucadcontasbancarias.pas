unit uCadContasBancarias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls, DBCtrls, EditBtn, Menus, UModulo, UBuscaConta,
  Ferramentas;

type

  { TFrmCadContasBancarias }

  TFrmCadContasBancarias = class(TForm)
    BtnConsultaD: TSpeedButton;
    BtnConsultaO: TSpeedButton;
    CboBanco: TComboBox;
    CboTipo: TDBLookupComboBox;
    DtDataTransf: TDateEdit;
    EdtAgencia: TEdit;
    EdtCodContaDes: TEdit;
    EdtCodContaO: TEdit;
    EdtNConta: TEdit;
    EdtNDoc: TEdit;
    EdtNomeConta: TEdit;
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
    Label8: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    RdbCadConta: TRadioButton;
    RdbCadTrans: TRadioButton;
    RGBStatusConta: TRadioGroup;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RGBStatusTransf: TRadioGroup;
    procedure BtnConsultaDClick(Sender: TObject);
    procedure BtnConsultaOClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoChange(Sender: TObject);
    procedure EdtSaldoInicialChange(Sender: TObject);
    procedure EdtSaldoInicialExit(Sender: TObject);
    procedure EdtSaldoInicialKeyPress(Sender: TObject; var Key: char);
    procedure EdtVlrTrasChange(Sender: TObject);
    procedure EdtVlrTrasExit(Sender: TObject);
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
     OpecadOuAltTransf: string;
     // A variável abaixo recebe o numero da conta seleciona no buscaconta na transferencia
     ContaSelecionada:Integer;
     //variável abaixo recebe o valor da transferencia
     ValorDaTransferenc:real;

  end;

var
  FrmCadContasBancarias: TFrmCadContasBancarias;

implementation

{$R *.lfm}

{ TFrmCadContasBancarias }
uses UTranfContas,UConsContas;



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
     RdbCadTrans.Caption:='Cadastro de Transferência';
     FrmTranfContas.CodigoDaTransf:=0;
     FrmConsContas.ctipo:=0;
     FrmTranfContas.PnChamaTrans.Visible:=false;
     FrmConsContas.PnChamaConta.Visible := False;
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
      //operação para cadastro
  if (OpeCadOuAltConta='i') then
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
        CboTipo.SetFocus;
      end
      else if (CboBanco.Text = '') then
      begin
        ShowMessage('Selecione o banco para continuar o cadastro!');
        CboBanco.SetFocus;
      end
      else if (EdtAgencia.Text = '') then
      begin
        ShowMessage('O preenchimento do número da agência é obrigatório!');
        EdtAgencia.SetFocus;
      end
      else if (EdtNConta.Text = '') then
      begin
        ShowMessage('O preenchimento do n° da conta é obrigatório!');
        EdtNConta.SetFocus;
      end
      else
      begin
           dm.ZQValidCadContaBanc.close;
           dm.ZQValidCadContaBanc.SQL.Clear;
           dm.ZQValidCadContaBanc.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP<3 AND CONNOME ='+QuotedStr(CboBanco.Text)+' AND CONAGENCIA = '+QuotedStr(EdtAgencia.Text)+' AND CONNUMERO_CONTA = '+QuotedStr(EdtNConta.Text)+' AND CODIGOTIP = '+QuotedStr(CboTipo.KeyValue));
           dm.ZQValidCadContaBanc.open;

           IF (dm.ZQValidCadContaBanc.RecordCount=0) THEN
           BEGIN
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
           end
           Else
           begin
                ShowMessage('Conta já está cadastrada');
           end;
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
           dm.ZQValidCadContaBanc.close;
           dm.ZQValidCadContaBanc.SQL.Clear;
           dm.ZQValidCadContaBanc.SQL.Add('SELECT * from vwcontas WHERE CODIGOTIP=3 AND CONNOME ='+QuotedStr(EdtNomeConta.Text)+' AND CODIGOTIP = '+QuotedStr(CboTipo.KeyValue));
           dm.ZQValidCadContaBanc.open;

           IF (dm.ZQValidCadContaBanc.RecordCount=0) then
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
           end
           Else
           Begin
                ShowMessage('Conta já está cadastrada!');
           end;
      end;
    end;
  end;

    // operação para alteração de conta
   if (OpeCadOuAltConta='u') then
  begin

    if (RdbCadConta.Checked = True) and (CboTipo.KeyValue <> 3) then
    begin
      if (CboTipo.Text = '') then
      begin
        ShowMessage('Selecione o tipo da conta para continuar com a alteração!');
        CboTipo.SetFocus;
      end
      else if (CboBanco.Text = '') then
      begin
        ShowMessage('Selecione o banco para continuar com a alteração!');
        CboBanco.SetFocus;
      end
      else if (EdtAgencia.Text = '') then
      begin
        ShowMessage('O preenchimento do número da agência é obrigatório!');
        EdtAgencia.SetFocus;
      end
      else if (EdtNConta.Text = '') then
      begin
        ShowMessage('O preenchimento do n° da conta é obrigatório!');
        EdtNConta.SetFocus;
      end
      else
      begin
           if (RGBStatusConta.ItemIndex=FrmConsContas.StatusDaConta) and (CboTipo.KeyValue=dm.ZQConsBancariasCODIGOTIP.AsInteger) and
           (CboBanco.Text=dm.ZQConsBancariasCONNOME.AsString) and (EdtAgencia.Text=dm.ZQConsBancariasCONAGENCIA.AsString) and
           (EdtNConta.Text=dm.ZQConsBancariasCONNUMERO_CONTA.AsString) and (StrToFloat(EdtSaldoInicial.Text)=dm.ZQConsBancariasCONSALDO_INICIAL.AsFloat) then
           begin
                ShowMessage('Não foi realizada nenhuma alteração');
           end
           else
           begin
            if (RGBStatusConta.ItemIndex=0)then
            begin
              dm.ZQAltBancarias.ParamByName('pconstatus').Value:=0;
            end;

            if (RGBStatusConta.ItemIndex=1)then
            begin
              dm.ZQAltBancarias.ParamByName('pconstatus').Value:=1;
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
            FrmConsContas.ctipo:=0;
            FrmTranfContas.PnChamaTrans.Visible:=false;
            FrmConsContas.PnChamaConta.Visible := False;
            FrmCadContasBancarias.Close;

            {CboTipo.ClearSelection;
            CboBanco.ClearSelection;
            EdtAgencia.Clear;
            EdtNConta.Clear;
            EdtSaldoInicial.Clear;
            RdbCadConta.Checked:=false;}

           end;
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
           if (RGBStatusConta.ItemIndex=FrmConsContas.StatusDaConta) and (EdtNomeConta.Text=dm.ZQConsBancariasCONNOME.AsString) and
              (StrToFloat(EdtSaldoInicial.Text)=dm.ZQConsBancariasCONSALDO_INICIAL.AsFloat) then
           begin
                ShowMessage('Não foi realizada nenhuma alteração');
           End
           Else
           begin
            if (RGBStatusConta.ItemIndex=0)then
            begin
              dm.ZQAltBancarias.ParamByName('pconstatus').Value:=0;
            end;

            if (RGBStatusConta.ItemIndex=1)then
            begin
              dm.ZQAltBancarias.ParamByName('pconstatus').Value:=1;
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
            FrmConsContas.ctipo:=0;
            FrmTranfContas.PnChamaTrans.Visible:=false;
            FrmConsContas.PnChamaConta.Visible := False;
            FrmCadContasBancarias.Close;

            {CboTipo.ClearSelection;
            EdtNomeConta.Clear;
            EdtSaldoInicial.Clear;
            RdbCadConta.Checked:=false;}

           end;
      end;
    end;
  end;



  // programação para cadastro da transferência
  if(OpecadOuAltTransf='I') then
  begin

   if (RdbCadTrans.Checked=true) then
   begin
        if (DtDataTransf.Text='') then
        begin
          ShowMessage('Você não preencheu a data da transferência, este campo é um campo obrigatório');
          DtDataTransf.SetFocus;
        end
        else if (EdtNDoc.Text='') then
        begin
             ShowMessage('Você não preencheu o número do documento, este campo é um campo obrigatório');
             EdtNDoc.SetFocus;
        end
        else if (EdtVlrTras.Text='') or (EdtVlrTras.Text= '0,00') then
        begin
              ShowMessage('Você não preencheu o valor da transferência, este campo é um campo obrigatório');
              EdtVlrTras.SetFocus;
        end
        else if (EdtCodContaO.Text='') then
        begin
              ShowMessage('Você não preencheu o código da conta de origem, este campo é um campo obrigatório');
              EdtCodContaO.SetFocus;
        end
        else if (EdtCodContaDes.Text='') then
        begin
             ShowMessage('Você não preencheu o código da conta de destino, este campo é um campo obrigatório');
             EdtCodContaDes.SetFocus;
        end
        else if (EdtCodContaO.Text=EdtCodContaDes.Text) then
        begin
             ShowMessage('Código da conta de origem é a mesma do código da conta de destino, verifique!');
             EdtCodContaDes.Clear;
             EdtCodContaDes.SetFocus;
        end
        else if (ValorDaTransferenc=0) then
        begin
             ShowMessage('Não pode ser zero o valor da transferência, este campo é um campo obrigatório');
             EdtVlrTras.SetFocus;
        end
        else
        begin
          dm.ZQCadTransferencia.Params.ParamByName('pTRADATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataTransf.Date);
          dm.ZQCadTransferencia.Params.ParamByName('pTRANUMERO_DOCUMENTO').Value:=EdtNDoc.Text;
          //EdtVlrTras.Text :=StringReplace(EdtVlrTras.Text, ',', '.', [rfReplaceAll]);
          dm.ZQCadTransferencia.Params.ParamByName('pTRAVALOR').AsFloat:=ValorDaTransferenc;
          dm.ZQCadTransferencia.Params.ParamByName('pTRACODIGO_CONORI').Value:=EdtCodContaO.Text;
          dm.ZQCadTransferencia.Params.ParamByName('pTRACODIGO_CONDES').Value:=EdtCodContaDes.Text;
          dm.ZQCadTransferencia.ExecSQL;
          ShowMessage('Transferência cadastrada com sucesso!');
          DtDataTransf.Clear;
          EdtNDoc.Clear;
          EdtVlrTras.Clear;
          EdtCodContaO.clear;
          EdtCodContaDes.clear;
          ValorDaTransferenc:=0;
          RdbCadTrans.Checked:=false;
        end;
   end;
  end;
    // operação para alteração da transferência

      if(OpecadOuAltTransf='U') then
  begin

   if (RdbCadTrans.Checked=true) then
   begin
        if (DtDataTransf.Text='') then
        begin
          ShowMessage('Você não preencheu a data da transferência, este campo é um campo obrigatório');
          DtDataTransf.SetFocus;
        end
        else if (EdtNDoc.Text='') then
        begin
             ShowMessage('Você não preencheu o número do documento, este campo é um campo obrigatório');
             EdtNDoc.SetFocus;
        end
        else if (EdtVlrTras.Text='') then
        begin
              ShowMessage('Você não preencheu o valor da transferência, este campo é um campo obrigatório');
              EdtVlrTras.SetFocus;
        end
        else if (EdtCodContaO.Text='') then
        begin
              ShowMessage('Você não preencheu o código da conta de origem, este campo é um campo obrigatório');
              EdtCodContaO.SetFocus;
        end
        else if (EdtCodContaDes.Text='') then
        begin
             ShowMessage('Você não preencheu o código da conta de destino, este campo é um campo obrigatório');
             EdtCodContaDes.SetFocus;
        end
        else if (EdtCodContaO.Text=EdtCodContaDes.Text) then
        begin
             ShowMessage('Código da conta de origem é a mesma do código da conta de destino, verifique!');
             EdtCodContaDes.Clear;
             EdtCodContaDes.SetFocus;
        end
        else if (ValorDaTransferenc=0) then
        begin
             ShowMessage('Não pode ser zero o valor da transferência, este campo é um campo obrigatório');
             EdtVlrTras.SetFocus;
        end
        else
        begin
              if(RGBStatusTransf.ItemIndex=FrmTranfContas.StatusDaTransf) and (DtDataTransf.Date=dm.ZQConsTransferenciaTRADATA.AsDateTime) and (EdtNDoc.Text=DM.ZQConsTransferenciaTRANUMERO_DOCUMENTO.AsString) and
              (ValorDaTransferenc=dm.ZQConsTransferenciaTRAVALOR.AsFloat) and (EdtCodContaO.Text=DM.ZQConsTransferenciaCODIGODACONTADEORIGEM.AsString) and
              (EdtCodContaDes.Text=dm.ZQConsTransferenciaCODIGODACONTADEDESTINO.AsString) then
              begin
                   ShowMessage('Não foi realizada nenhuma alteração');
              end
              else
              begin

              if (RGBStatusTransf.ItemIndex=0)then
            begin
              dm.ZQAltTransferencia.ParamByName('pTRASTATUS').Value:=0;
            end;

            if (RGBStatusTransf.ItemIndex=1)then
            begin
              dm.ZQAltTransferencia.ParamByName('pTRASTATUS').Value:=1;
            end;

              dm.ZQAltTransferencia.Params.ParamByName('pTRADATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataTransf.Date);
              dm.ZQAltTransferencia.Params.ParamByName('pTRANUMERO_DOCUMENTO').Value:=EdtNDoc.Text;
              //EdtVlrTras.Text :=StringReplace(EdtVlrTras.Text, ',', '.', [rfReplaceAll]);
              dm.ZQAltTransferencia.Params.ParamByName('pTRAVALOR').AsFloat:=ValorDaTransferenc;
              dm.ZQAltTransferencia.Params.ParamByName('pTRACODIGO_CONORI').Value:=EdtCodContaO.Text;
              dm.ZQAltTransferencia.Params.ParamByName('pTRACODIGO_CONDES').Value:=EdtCodContaDes.Text;
              dm.ZQAltTransferencia.Params.ParamByName('ptracodigo').Value:=DM.ZQConsTransferenciaTRACODIGO.AsInteger;
              dm.ZQAltTransferencia.ExecSQL;
              ShowMessage('Transferência alterada com sucesso!');

              dm.ZQConsTransferencia.Close;
              dm.ZQConsTransferencia.Open;

              RGBStatusTransf.Visible:=False;
              RdbCadConta.Enabled:=True;
              RdbCadTrans.Caption:='Cadastro de Transferência';
              OpecadOuAltTransf:='';
              ValorDaTransferenc:=0;
              FrmTranfContas.CodigoDaTransf:=0;
              FrmTranfContas.PnChamaTrans.Visible:=false;
              FrmConsContas.PnChamaConta.Visible := False;
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
    EdtNomeConta.Clear;
  end;
end;



procedure TFrmCadContasBancarias.EdtSaldoInicialChange(Sender: TObject);

begin
     if (EdtSaldoInicial.Text='') then
     begin
          EdtSaldoInicial.Text:='0';
     end
     else
     begin

     end;

end;

procedure TFrmCadContasBancarias.EdtSaldoInicialExit(Sender: TObject);
begin
     (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFrmCadContasBancarias.EdtSaldoInicialKeyPress(Sender: TObject;
  var Key: char);
begin
     Key := Simpl.SoValor(Key);
end;

procedure TFrmCadContasBancarias.EdtVlrTrasChange(Sender: TObject);
begin
      if (EdtVlrTras.Text='') then
     begin
          EdtVlrTras.Text:='0';
     end
     else
     begin
          ValorDaTransferenc:=StrToFloat(EdtVlrTras.Text);
     end;
end;

procedure TFrmCadContasBancarias.EdtVlrTrasExit(Sender: TObject);
begin
     (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFrmCadContasBancarias.EdtVlrTrasKeyPress(Sender: TObject;
  var Key: char);
begin
     Key := Simpl.SoValor(Key);
end;

procedure TFrmCadContasBancarias.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsTipoConta.Active := False;
  RdbCadConta.Checked:=false;
  RdbCadTrans.Checked:=false;
  DM.ZQValidCadContaBanc.Active:=False;
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
  DM.ZQValidCadContaBanc.Active:=True;
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
    //tive que ativar a query pq no cadastro de transferencia, quando eu fecho o busca conta ele desativa a querry zqconstipoconta
    dm.ZQConsTipoConta.Active:=True;
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
    //EdtCodContaO.Enabled:=true;
    //EdtCodContaDes.Enabled:=true;
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
    //EdtCodContaO.Enabled:=false;
    //EdtCodContaDes.Enabled:=false;
    BtnConsultaO.Enabled:=false;
    BtnConsultaD.Enabled:=false;
    //para limpar a tela caso tenha algo digitado e o usuario aperte cad. conta
    DtDataTransf.Clear;
    EdtNDoc.Clear;
    EdtVlrTras.Clear;
    EdtCodContaO.Clear;
    EdtCodContaDes.clear;
    ValorDaTransferenc:=0;
  end;
end;

end.
