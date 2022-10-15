unit UConsBaixa;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, MaskEdit,
  StdCtrls, Buttons, DBGrids, EditBtn, UModulo, uCadLancamento, UCadPagamento,
  UConsParcelas,UBuscaDoc,UConsFornecedores,uConsCentro;

type

  { TFrmConsBaixa }

  TFrmConsBaixa = class(TForm)
    BtnConsCentro: TSpeedButton;
    BtnConsFor: TSpeedButton;
    BtnConsTipoConta: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSair1: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboStatus: TComboBox;
    CboRecOuDes: TComboBox;
    ChkDespesa: TRadioButton;
    ChkReceita: TRadioButton;
    DBGEfetivado: TDBGrid;
    DTDataInicial: TDateEdit;
    DTDataFinal: TDateEdit;
    DBGPendente: TDBGrid;
    DTLancamento: TDateEdit;
    EdtConsCentro: TEdit;
    EdtConsFornecedor: TEdit;

    EdtConsulta: TEdit;
    EdtNDoc: TEdit;
    EdtTipoDocumento: TEdit;
    GrpTipo: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MemObservacao: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    PnChamaLanca: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnVerParcelas: TSpeedButton;
    BtnAlterarDados: TSpeedButton;
    procedure BtnAlterar1Click(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnAlterarDadosClick(Sender: TObject);
    procedure BtnConsCentroClick(Sender: TObject);
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnConsTipoContaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnVerParcelasClick(Sender: TObject);
    procedure DBGEfetivadoCellClick(Column: TColumn);
    procedure DBGPendenteCellClick(Column: TColumn);
    procedure EdtDataInicioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure PnChamaLancaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public
    //Essa variável recebe o id da parcela (baicodigo)
    codigoDaParcela:Integer;
    //Essa variável recebe o número do lançamento que se refere determinada parcela
    codigoDoLancamento:Integer;
    //essa variável recebe o valor do da parcela
    valorDoLancamento:real;
    //Essa variavel aciona o botão pesquisa fornecedor para alterar os dados do lançamento
    acionaPesqForConsBaix:String;
    //Essa variavel aciona o botão de pesquisa de centro de custo para alterar os dados do lançamento
    acionaPesqCenCustConsBaix:String;
  end;

var
  FrmConsBaixa: TFrmConsBaixa;

implementation

{$R *.lfm}

{ TFrmConsBaixa }

procedure TFrmConsBaixa.EdtDataInicioChange(Sender: TObject);
begin

end;

procedure TFrmConsBaixa.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
   dm.ZQConsBaixaPen.Active:=False;
   dm.ZQConsBaixaEfet.Active:=False;
end;

procedure TFrmConsBaixa.FormCreate(Sender: TObject);
begin

end;

procedure TFrmConsBaixa.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsBaixa.FormShow(Sender: TObject);
begin
  dm.ZQConsBaixaPen.Active:=True;
  dm.ZQConsBaixaEfet.Active:=True;
end;

procedure TFrmConsBaixa.Panel2Click(Sender: TObject);
begin

end;

procedure TFrmConsBaixa.PnChamaLancaClick(Sender: TObject);
begin

end;



procedure TFrmConsBaixa.SpeedButton1Click(Sender: TObject);
begin
  //CÓDIGO ABAIXO É PARA PESQUISAR APENAS POR DATA, TIPO DE RECEITA E STATUS
  if (DTDataInicial.Date=NullDate) or (DTDataFinal.Date=NullDate) then
  begin
    ShowMessage('É necessário preencher o período no qual deseja pesquisar');
  end
  else if (DTDataFinal.Date<DTDataInicial.Date) then
  begin
    ShowMessage('Período pesquisado não é vadido, digite novamente');
    DTDataFinal.Clear;
    DTDataInicial.Clear;
  end
  Else
  begin
      //receita + pendente
    if (CboRecOuDes.ItemIndex=0) and (CboStatus.ItemIndex=0) then
    begin
    with dm.ZQConsBaixaPen do
      begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixapen where LANTIPO=1 AND BAISTATUS=0 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGPendente.Visible:=True;
        DBGEfetivado.Visible:=False;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
        end;
    End;
      //despesa + pendente
    if (CboRecOuDes.ItemIndex=1) and (CboStatus.ItemIndex=0) then
    begin
    with dm.ZQConsBaixaPen do
      begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixapen where LANTIPO=0 AND BAISTATUS=0 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGPendente.Visible:=True;
        DBGEfetivado.Visible:=False;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
        end;
    End;
       //Receita + efetivado
    if (CboRecOuDes.ItemIndex=0) and (CboStatus.ItemIndex=1) then
    begin
    with dm.ZQConsBaixaEfet do
      begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixaefet where LANTIPO=1 AND BAISTATUS=1 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGEfetivado.Visible:=True;
        DBGPendente.Visible:=False;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
      end;
    End;
       //Despesa + efetivado
    if (CboRecOuDes.ItemIndex=1) and (CboStatus.ItemIndex=1) then
    Begin
     with dm.ZQConsBaixaEfet do
       begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixaefet where LANTIPO=0 AND BAISTATUS=1 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal');
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGEfetivado.Visible:=True;
        DBGPendente.Visible:=False;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
       end;
     End;
  End;
end;

procedure TFrmConsBaixa.SpeedButton2Click(Sender: TObject);
begin
   //CÓDIGO ABAIXO É PARA PESQUISAR POR NOME
   if (DTDataInicial.Date=NullDate) or (DTDataFinal.Date=NullDate) then
  begin
    ShowMessage('É necessário preencher o período no qual deseja pesquisar');
  end
  else if (DTDataFinal.Date<DTDataInicial.Date) then
  begin
    ShowMessage('Período pesquisado não é vadido, digite novamente');
    DTDataFinal.Clear;
    DTDataInicial.Clear;
  end
  Else
  begin
      //receita + pendente
    if (CboRecOuDes.ItemIndex=0) and (CboStatus.ItemIndex=0) then
    begin
    with dm.ZQConsBaixaPen do
      begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixapen where LANTIPO=1 AND BAISTATUS=0 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal AND PESNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGPendente.Visible:=True;
        DBGEfetivado.Visible:=False;
        EdtConsulta.Clear;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
        end;
    End;
      //despesa + pendente
    if (CboRecOuDes.ItemIndex=1) and (CboStatus.ItemIndex=0) then
    begin
    with dm.ZQConsBaixaPen do
      begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixapen where LANTIPO=0 AND BAISTATUS=0 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal AND PESNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGPendente.Visible:=True;
        DBGEfetivado.Visible:=False;
        EdtConsulta.Clear;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
        end;
    End;
       //Receita + efetivado
    if (CboRecOuDes.ItemIndex=0) and (CboStatus.ItemIndex=1) then
    begin
    with dm.ZQConsBaixaEfet do
      begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixaefet where LANTIPO=1 AND BAISTATUS=1 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal AND PESNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGEfetivado.Visible:=True;
        DBGPendente.Visible:=False;
        EdtConsulta.Clear;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
      end;
    End;
       //Despesa + efetivado
    if (CboRecOuDes.ItemIndex=1) and (CboStatus.ItemIndex=1) then
    Begin
     with dm.ZQConsBaixaEfet do
       begin
        Close ;
        sql.Clear;
        SQL.Add('SELECT * FROM vwmostrabaixaefet where LANTIPO=0 AND BAISTATUS=1 AND BAIDATAVEN BETWEEN :dtinicial and :dtfinal AND PESNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
        ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTDataInicial.Date);
        ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DTDataFinal.Date);
        Open;
        DBGEfetivado.Visible:=True;
        DBGPendente.Visible:=False;
        EdtConsulta.Clear;
        //codigo abaixo limpa o form de alteracao de dados de lançamento.
        ChkDespesa.Checked:=False;
        ChkReceita.Checked:=False;
        DTLancamento.Clear;
        EdtTipoDocumento.Clear;
        EdtNDoc.Clear;
        EdtConsFornecedor.Clear;
        EdtConsCentro.Clear;
        MemObservacao.Clear;
       end;
     End;
  End;
end;

procedure TFrmConsBaixa.BtnSairClick(Sender: TObject);
begin
  //Validação para limpar os campos ao sair da tela.
  codigoDaParcela:=0;
  DTDataInicial.Clear;
  DTDataFinal.Clear;
  DBGEfetivado.Visible:=False;
  DBGPendente.Visible:=False;
  //codigo abaixo limpa o form de alteracao de dados de lançamento.
  ChkDespesa.Checked:=False;
  ChkReceita.Checked:=False;
  DTLancamento.Clear;
  EdtTipoDocumento.Clear;
  EdtNDoc.Clear;
  EdtConsFornecedor.Clear;
  EdtConsCentro.Clear;
  MemObservacao.Clear;
  Close;
end;

procedure TFrmConsBaixa.BtnSalvarClick(Sender: TObject);
begin

end;

procedure TFrmConsBaixa.BtnVerParcelasClick(Sender: TObject);
begin
  FrmConsParcelas.show;
end;

procedure TFrmConsBaixa.DBGEfetivadoCellClick(Column: TColumn);
begin
  codigoDaParcela:=DM.ZQConsBaixaEfetBAICODIGO.AsInteger;
  codigoDoLancamento:=DM.ZQConsBaixaEfetCODIGOLAN.AsInteger;
  valorDoLancamento:=dm.ZQConsBaixaEfetLANVALOR_DOCUMENTO.AsFloat;

   {CÓDIGO ABAIXO CARREGA OS DADOS NO PANEL ABAIXO PARA CASO O USUÁRIO QUEIRA ALTERAR
  ALGUM DADO RELACIONADO AO LANÇAMENTO.}
  IF (DM.ZQConsBaixaEfetBAICODIGO.AsInteger<1) THEN
  BEGIN
  end
  ELSE
  begin
  //receita efetivado
  IF (dm.ZQConsBaixaefetLANTIPO.AsInteger=1) and (CboStatus.ItemIndex=1) then
  begin
       ChkReceita.Checked:=True;
       DTLancamento.Date:=DM.ZQConsBaixaefetLANDOCUMENTO.AsDateTime;
       EdtTipoDocumento.Text:=dm.ZQConsBaixaefetCODIGODOC.AsString;
       EdtNDoc.Text:=dm.ZQConsBaixaefetLANNUMERO_DOCUMENTO.AsString;
       EdtConsFornecedor.Text:=dm.ZQConsBaixaefetCODIGOPES.AsString;
       EdtConsCentro.Text:=dm.ZQConsBaixaefetCENCODIGO.AsString;
       MemObservacao.Text:=dm.ZQConsBaixaEfetLANOBSERVACAO.AsString;
  end;
  //despesa efetivado
    IF (dm.ZQConsBaixaefetLANTIPO.AsInteger=0) and (CboStatus.ItemIndex=1) then
  begin
       ChkDespesa.Checked:=True;
       DTLancamento.Date:=DM.ZQConsBaixaefetLANDOCUMENTO.AsDateTime;
       EdtTipoDocumento.Text:=DM.ZQConsBaixaefetCODIGODOC.AsString;
       EdtNDoc.Text:=dm.ZQConsBaixaefetLANNUMERO_DOCUMENTO.AsString;
       EdtConsFornecedor.Text:=dm.ZQConsBaixaefetCODIGOPES.AsString;
       EdtConsCentro.Text:=dm.ZQConsBaixaefetCENCODIGO.AsString;
       MemObservacao.Text:=dm.ZQConsBaixaEfetLANOBSERVACAO.AsString;
  end;
   end;
end;

procedure TFrmConsBaixa.DBGPendenteCellClick(Column: TColumn);
begin
  codigoDaParcela:=dm.ZQConsBaixaPenBAICODIGO.AsInteger;
  codigoDoLancamento:=dm.ZQConsBaixaPenCODIGOLAN.AsInteger;
  valorDoLancamento:=dm.ZQConsBaixaPenLANVALOR_DOCUMENTO.AsFloat;

  {CÓDIGO ABAIXO CARREGA OS DADOS NO PANEL ABAIXO PARA CASO O USUÁRIO QUEIRA ALTERAR
  ALGUM DADO RELACIONADO AO LANÇAMENTO.}
   IF (DM.ZQConsBaixaPenBAICODIGO.AsInteger<1) THEN
  BEGIN
  end
  ELSE
  begin
  //receita pendente
  IF (dm.ZQConsBaixaPenLANTIPO.AsInteger=1) and (CboStatus.ItemIndex=0) then
  begin
       ChkReceita.Checked:=True;
       DTLancamento.Date:=DM.ZQConsBaixaPenLANDOCUMENTO.AsDateTime;
       EdtTipoDocumento.Text:=dm.ZQConsBaixaPenCODIGODOC.AsString;
       EdtNDoc.Text:=dm.ZQConsBaixaPenLANNUMERO_DOCUMENTO.AsString;
       EdtConsFornecedor.Text:=dm.ZQConsBaixaPenCODIGOPES.AsString;
       EdtConsCentro.Text:=dm.ZQConsBaixaPenCENCODIGO.AsString;
       MemObservacao.Text:=dm.ZQConsBaixaPenLANOBSERVACAO.AsString;
  end;
  //despesa pendente
    IF (dm.ZQConsBaixaPenLANTIPO.AsInteger=0) and (CboStatus.ItemIndex=0) then
  begin
       ChkDespesa.Checked:=True;
       DTLancamento.Date:=DM.ZQConsBaixaPenLANDOCUMENTO.AsDateTime;
       EdtTipoDocumento.Text:=dm.ZQConsBaixaPenCODIGODOC.AsString;
       EdtNDoc.Text:=dm.ZQConsBaixaPenLANNUMERO_DOCUMENTO.AsString;
       EdtConsFornecedor.Text:=dm.ZQConsBaixaPenCODIGOPES.AsString;
       EdtConsCentro.Text:=dm.ZQConsBaixaPenCENCODIGO.AsString;
       MemObservacao.Text:=dm.ZQConsBaixaPenLANOBSERVACAO.AsString;
  end;
  end;

end;

procedure TFrmConsBaixa.BtnAlterarClick(Sender: TObject);
begin
  if (codigoDaParcela=0) then
  begin
       ShowMessage('Não tem parcela a ser alterada');
  end
  else
  begin
    FrmCadLancamento.CadOuAltLanDatValor:='u';
    FrmCadParcela.LblValor.Caption:=FormatFloat('R$ 0.00',valorDoLancamento);
    FrmCadParcela.recebValorLan:=valorDoLancamento;
    FrmCadParcela.EdtValorLanc.Text:=formatFloat('0.00',valorDoLancamento);
    //código abaixo é p/ quando abrir tela de parcelas, só aparece as parcelas refente o lançamento.
    dm.ZQConsLanData.Close;
    dm.ZQConsLanData.SQL.Clear;
    dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(codigoDoLancamento));
    dm.ZQConsLanData.Open;
    FrmCadParcela.ShowModal;
  end;

end;

procedure TFrmConsBaixa.BtnAlterarDadosClick(Sender: TObject);
begin
     if (ChkReceita.Checked=False) and (ChkDespesa.Checked=False) then
     begin
          ShowMessage('Selecione alguma parcela na qual deseja alterar os dados do lançamento');
     end
     Else
     begin
         DTLancamento.Enabled:=True;
         BtnConsTipoConta.Enabled:=True;
         EdtNDoc.Enabled:=True;
         BtnConsFor.Enabled:=True;
         BtnConsCentro.Enabled:=True;
         MemObservacao.Enabled:=True;
     end;
end;

procedure TFrmConsBaixa.BtnConsCentroClick(Sender: TObject);
begin
  acionaPesqCenCustConsBaix:='Consbaixa';

  if (acionaPesqCenCustConsBaix='Consbaixa') then
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

procedure TFrmConsBaixa.BtnConsForClick(Sender: TObject);
begin
  acionaPesqForConsBaix:='ConsBaixa';

  if(acionaPesqForConsBaix='ConsBaixa') then
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

procedure TFrmConsBaixa.BtnConsTipoContaClick(Sender: TObject);
begin
  FrmBuscaDoc.BuscaDocTela:='consbaix';
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

procedure TFrmConsBaixa.BtnAlterar1Click(Sender: TObject);
begin

end;

end.

