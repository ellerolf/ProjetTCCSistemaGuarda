unit UbaixaParcela;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  EditBtn, Buttons,UModulo,Ferramentas;

type

  { TFRMBaixaParcela }

  TFRMBaixaParcela = class(TForm)
    DTDataDoPagamento: TDateEdit;
    DtDataVencimento: TDateEdit;
    EdtValorParcela: TEdit;
    EdtContaBancaria: TEdit;
    EdtFormaPagamento: TEdit;
    EdtMultaJuros: TEdit;
    EdtDesconto: TEdit;
    EdtValorTot: TEdit;
    Label10: TLabel;
    Label2: TLabel;
    LblDataPagamento: TLabel;
    LblFormaPagamento: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblTotPg: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    BtnConsFormPg: TSpeedButton;
    BtnConsConta: TSpeedButton;
    BtnConfirma: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnCancela: TSpeedButton;
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnConsContaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DtDataVencimentoChange(Sender: TObject);
    procedure EdtContaBancariaChange(Sender: TObject);
    procedure EdtDescontoChange(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: char);
    procedure EdtMultaJurosChange(Sender: TObject);
    procedure EdtMultaJurosExit(Sender: TObject);
    procedure EdtMultaJurosKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Panel2Click(Sender: TObject);
  private

  public
       //variável abaixo recebe o valor total da parcela
       valor:real;
       //variável abaixo recebe a multa e juros
       multaEjuros:real;
       //variável abaixo recebe o desconto
       desconto:real;
       //variável abaixo recebe o resultado da soma
       resultado:real;
       //Essa variável diz se vai acionar a consulta de contas bancárias
       acionaConsConta:string;
       //Essa variável recebe o codigo da conta bancária selecionada na dbgrid
       codigoDaContaSelecionada:Integer;
  end;

var
  FRMBaixaParcela: TFRMBaixaParcela;

implementation

{$R *.lfm}

{ TFRMBaixaParcela }
uses UConsBaixa, UEntrarUsuario, UBuscaConta;


procedure TFRMBaixaParcela.Panel2Click(Sender: TObject);
begin

end;

procedure TFRMBaixaParcela.DtDataVencimentoChange(Sender: TObject);
begin

end;

procedure TFRMBaixaParcela.EdtContaBancariaChange(Sender: TObject);
begin

end;

procedure TFRMBaixaParcela.EdtDescontoChange(Sender: TObject);
begin
     //desconto:=StrToFloat(EdtDesconto.Text);
     if (EdtDesconto.Text='') then
     begin
          EdtDesconto.Text:='0';
     end
     else
     begin
          desconto:=StrToFloat(EdtDesconto.Text);
          resultado:=valor+multaEjuros-desconto;
          EdtValorTot.Text:=FormatFloat('0.00',resultado);
     end;
end;

procedure TFRMBaixaParcela.EdtDescontoExit(Sender: TObject);
begin
     (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFRMBaixaParcela.EdtDescontoKeyPress(Sender: TObject; var Key: char);
begin
     Key := Simpl.SoValor(Key);
end;

procedure TFRMBaixaParcela.EdtMultaJurosChange(Sender: TObject);
begin
     if (EdtMultaJuros.Text='') then
     begin
          EdtMultaJuros.Text:='0';
     end
     else
     begin
          multaEjuros:=StrToFloat(EdtMultaJuros.Text);
          resultado:=valor+multaEjuros-desconto;
          EdtValorTot.Text:=FormatFloat('0.00',resultado);

     end;
end;

procedure TFRMBaixaParcela.EdtMultaJurosExit(Sender: TObject);
begin
     (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFRMBaixaParcela.EdtMultaJurosKeyPress(Sender: TObject; var Key: char
  );
begin
     Key := Simpl.SoValor(Key);
end;

procedure TFRMBaixaParcela.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     //O código abaixo faz com que ao sair da tela de baixa de parcela ele atualiza a dbgrid consbaixa.
     //receita + pendente
      if (FrmConsBaixa.CboRecOuDes.ItemIndex=0) and (FrmConsBaixa.CboStatus.ItemIndex=0) then
      begin
      with dm.ZQConsBaixaPen do
        begin
          Close ;
          sql.Clear;
          SQL.Add('SELECT * FROM vwmostrabaixapen where LANTIPO=1 AND BAISTATUS=0 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
          ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataInicial.Date);
          ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataFinal.Date);
          Open;
          FrmConsBaixa.DBGPendente.Visible:=True;
          FrmConsBaixa.DBGEfetivado.Visible:=False;
          end;
      End;
        //despesa + pendente
      if (FrmConsBaixa.CboRecOuDes.ItemIndex=1) and (FrmConsBaixa.CboStatus.ItemIndex=0) then
      begin
      with dm.ZQConsBaixaPen do
        begin
          Close ;
          sql.Clear;
          SQL.Add('SELECT * FROM vwmostrabaixapen where LANTIPO=0 AND BAISTATUS=0 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
          ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataInicial.Date);
          ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataFinal.Date);
          Open;
          FrmConsBaixa.DBGPendente.Visible:=True;
          FrmConsBaixa.DBGEfetivado.Visible:=False;
          end;
      End;
         //Receita + efetivado
      if (FrmConsBaixa.CboRecOuDes.ItemIndex=0) and (FrmConsBaixa.CboStatus.ItemIndex=1) then
      begin
      with dm.ZQConsBaixaEfet do
        begin
          Close ;
          sql.Clear;
          SQL.Add('SELECT * FROM vwmostrabaixaefet where LANTIPO=1 AND BAISTATUS=1 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
          ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataInicial.Date);
          ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataFinal.Date);
          Open;
          FrmConsBaixa.DBGEfetivado.Visible:=True;
          FrmConsBaixa.DBGPendente.Visible:=False;
        end;
      End;
         //Despesa + efetivado
      if (FrmConsBaixa.CboRecOuDes.ItemIndex=1) and (FrmConsBaixa.CboStatus.ItemIndex=1) then
      Begin
       with dm.ZQConsBaixaEfet do
         begin
          Close ;
          sql.Clear;
          SQL.Add('SELECT * FROM vwmostrabaixaefet where LANTIPO=0 AND BAISTATUS=1 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
          ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataInicial.Date);
          ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',FrmConsBaixa.DTDataFinal.Date);
          Open;
          FrmConsBaixa.DBGEfetivado.Visible:=True;
          FrmConsBaixa.DBGPendente.Visible:=False;
         end;
       End;
end;

procedure TFRMBaixaParcela.BtnSairClick(Sender: TObject);
begin
     EdtMultaJuros.Enabled:=True;
     EdtDesconto.Enabled:=True;
     BtnConsConta.Enabled:=True;
     BtnConsFormPg.Enabled:=True;
     DTDataDoPagamento.Enabled:=True;

     DTDataDoPagamento.Clear;
     EdtMultaJuros.Clear;
     EdtContaBancaria.Clear;
     EdtFormaPagamento.Clear;
     EdtDesconto.Clear;
     EdtValorTot.Clear;
     LblTotPg.Caption:='TOTAL DO PAGAMENTO:';

  //O código abaixo limpa os campos e a variável na tela consbaixa, após o usuário clicar em sair
     FrmConsBaixa.codigoDaParcela:=0;
     FrmConsBaixa.ChkDespesa.Checked:=False;
     FrmConsBaixa.ChkReceita.Checked:=False;
     FrmConsBaixa.DTLancamento.Clear;
     FrmConsBaixa.EdtTipoDocumento.Clear;
     FrmConsBaixa.EdtNDoc.Clear;
     FrmConsBaixa.EdtConsFornecedor.Clear;
     FrmConsBaixa.EdtConsCentro.Clear;
     FrmConsBaixa.MemObservacao.Clear;
     close;
end;

procedure TFRMBaixaParcela.BtnConfirmaClick(Sender: TObject);
begin
     if(DTDataDoPagamento.Date=NullDate) then
     begin
          ShowMessage('É obrigatório digitar a data.');
          DTDataDoPagamento.SetFocus;
     end
     else if (EdtContaBancaria.Text='') then
     begin
          ShowMessage('É obrigatório colocar a conta.');
     end
     else if (EdtFormaPagamento.Text='') then
     begin
          ShowMessage('É obrigatório colocar a forma de pagamento.');
     end
     else if (StrToFloat(EdtValorTot.Text)<0) then
     begin
          ShowMessage('O valor total da está negativo, confira os valores e clique em confirmar novamente');
          EdtMultaJuros.Clear;
          EdtDesconto.Clear;
     end
     Else
     Begin
          ShowMessage('DEU CERTO');
     end;
end;

procedure TFRMBaixaParcela.BtnConsContaClick(Sender: TObject);
begin
     acionaConsConta:='aciona';
     FrmBuscaConta.ShowModal;
end;

procedure TFRMBaixaParcela.BtnCancelaClick(Sender: TObject);
begin
     if MessageDlg('ATENÇÃO, DESEJA CANCELAR ESTA OPERAÇÃO?','Essa parcela efetivada voltará para pendente.',mtInformation,[mbOk,mbCancel],0)=mrOk then
     BEGIN
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pBAISTATUS').AsInteger:=0;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pCODIGOFOR').Value:=Null;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pCODIGOCON').Value:=Null;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pBAIMULTA_JUROS').Value:=Null;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pBAIDESCONTO').Value:=Null;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pCODIGOUSU').AsInteger:=FrmEntrarUsuario.indentidade;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pBAIDATAPGTO').Value:=Null;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pBAIVALORPAGO').Value:=Null;
          DM.ZQAltBaixaDeParcela.Params.ParamByName('pBAICODIGO').AsInteger:=FrmConsBaixa.codigoDaParcela;
          DM.ZQAltBaixaDeParcela.ExecSQL;

          //LIMPA OS CAMPOS
          DTDataDoPagamento.Clear;
          EdtMultaJuros.Clear;
          EdtContaBancaria.Clear;
          EdtFormaPagamento.Clear;
          EdtDesconto.Clear;
          EdtValorTot.Clear;
          Close;
     end
     Else
     Begin
          Abort;
     end;
end;

end.

