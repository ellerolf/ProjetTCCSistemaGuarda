unit UConsBaixa;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, MaskEdit,
  StdCtrls, Buttons, DBGrids, EditBtn,UModulo,uCadLancamento,UCadPagamento;

type

  { TFrmConsBaixa }

  TFrmConsBaixa = class(TForm)
    BtnAlterarstat: TRadioButton;
    BtnAlterar1: TSpeedButton;
    BtnPagar: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnSalvar1: TSpeedButton;
    CboConta: TComboBox;
    CboStatus: TComboBox;
    CboRecOuDes: TComboBox;
    DBGEfetivado: TDBGrid;
    DTDataInicial: TDateEdit;
    DTDataFinal: TDateEdit;
    DBGPendente: TDBGrid;

    EdtCodLanca: TEdit;
    EdtCodFor: TEdit;
    EdtValorOriginal: TEdit;
    EdtValorJuros: TEdit;
    EdtValorDesconto: TEdit;
    EdtConsulta: TEdit;
    EdtDataBaixa: TMaskEdit;
    GrpSituacao: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtnAlterar: TSpeedButton;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGEfetivadoCellClick(Column: TColumn);
    procedure DBGPendenteCellClick(Column: TColumn);
    procedure EdtDataInicioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
       end;
     End;
  End;
end;

procedure TFrmConsBaixa.BtnSairClick(Sender: TObject);
begin
  //Validação para limpar os campos ao sair da tela.
  DTDataInicial.Clear;
  DTDataFinal.Clear;
  DBGEfetivado.Visible:=False;
  DBGPendente.Visible:=False;
  Close;
end;

procedure TFrmConsBaixa.DBGEfetivadoCellClick(Column: TColumn);
begin
  codigoDaParcela:=DM.ZQConsBaixaEfetBAICODIGO.AsInteger;
  codigoDoLancamento:=DM.ZQConsBaixaEfetCODIGOLAN.AsInteger;
  valorDoLancamento:=dm.ZQConsBaixaEfetLANVALOR_DOCUMENTO.AsFloat;
end;

procedure TFrmConsBaixa.DBGPendenteCellClick(Column: TColumn);
begin
  codigoDaParcela:=dm.ZQConsBaixaPenBAICODIGO.AsInteger;
  codigoDoLancamento:=dm.ZQConsBaixaPenCODIGOLAN.AsInteger;
  valorDoLancamento:=dm.ZQConsBaixaPenLANVALOR_DOCUMENTO.AsFloat;
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

end.

