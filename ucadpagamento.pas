unit UCadPagamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBExtCtrls, Buttons, DBGrids, EditBtn, Ferramentas;

type

  { TFrmCadParcela }

  TFrmCadParcela = class(TForm)
    DtDataParcela: TDateEdit;
    DBGrid1: TDBGrid;
    EdtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblValor: TLabel;
    Label7: TLabel;
    LblValorRestante: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DTDataLancamentoChange(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    //variável abaixo recebe o código da baixa(baicodigo), vou usar essa variável
    //para validar o exluir parcela
    delparcela:Integer;
    //Variável abaixo recebe o valor da parcela que será deletada, que será usado
    //para adicionar no restante.
    valParcelaDel:Real;

  public

    valor:Real;
    restante:Real;
        //Essa variável recebe o valor do lançamento, será usada para quando for UPDATE,
    //no lugar da variável (valorDoDocumento)do form cadlancamento.
    recebValorLan:real;

  end;

var
  FrmCadParcela: TFrmCadParcela;

implementation

{$R *.lfm}

{ TFrmCadParcela }

uses UModulo,UEntrarUsuario,uCadLancamento,UConsBaixa;

procedure TFrmCadParcela.SpeedButton1Click(Sender: TObject);
begin
  //Insert quando está cadastrando lançamento

  if (FrmCadLancamento.CadOuAltLanDatValor='i') then
  begin
    IF (DtDataParcela.Text='') OR (EdtValor.Text='') OR (EdtValor.Text='0,00') THEN
    BEGIN
         ShowMessage('Está faltando lançar algum dos campos');
    end
    else if (EdtValor.Text='0') then
    begin
         ShowMessage('Não lançar parcela de valor zero');
    end
    else
    begin
        valor:=StrToFloat(EdtValor.Text);

        if (valor>restante) then
            begin
                 ShowMessage('VALOR INCORRETO, verifique se o valor da parcela está correto.');
            END
            ELSE
            begin
                  restante:=restante-valor;
                  LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);


                  dm.ZQCadLanData.Params.ParamByName('pCODIGOLAN').Value:=FrmCadLancamento.codigoDoLanc;
                  dm.ZQCadLanData.Params.ParamByName('pBAIDATAVEN').AsString:=FormatDateTime('yyyy-mm-dd',DtDataParcela.Date);
                  EdtValor.Text :=StringReplace(EdtValor.Text, ',', '.', [rfReplaceAll]);
                  dm.ZQCadLanData.Params.ParamByName('pBAIVALOR').Value:=EdtValor.Text;
                  dm.ZQCadLanData.Params.ParamByName('pCODIGOUSU').Value:=FrmEntrarUsuario.indentidade;
                  dm.ZQCadLanData.ExecSQL;

                  dm.ZQConsLanData.Close;
                  dm.ZQConsLanData.SQL.Clear;
                  dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(FrmCadLancamento.codigoDoLanc));
                  dm.ZQConsLanData.Open;

                  //após o lançamento da data e valor, o código abaixo faz a limpeza dos campos.
                  EdtValor.Clear;
                  DtDataParcela.Clear;
            end;
    end;
  end;
  //insert quando usuário quer fazer alteração após ter feito lançamento
    if (FrmCadLancamento.CadOuAltLanDatValor='u') then
  begin
    IF (DtDataParcela.Text='') OR (EdtValor.Text='') OR (EdtValor.Text='0,00') THEN
    BEGIN
         ShowMessage('Está faltando lançar algum dos campos');
    end
    else if (EdtValor.Text='0') then
    begin
         ShowMessage('Não lançar parcela de valor zero');
    end
    else
    begin
        valor:=StrToFloat(EdtValor.Text);

        if (valor>restante) then
            begin
                 ShowMessage('VALOR INCORRETO, verifique se o valor da parcela está correto.');
            END
            ELSE
            begin
                  restante:=restante-valor;
                  LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);


                  dm.ZQCadLanData.Params.ParamByName('pCODIGOLAN').Value:=FrmConsBaixa.codigoDoLancamento;
                  dm.ZQCadLanData.Params.ParamByName('pBAIDATAVEN').AsString:=FormatDateTime('yyyy-mm-dd',DtDataParcela.Date);
                  EdtValor.Text :=StringReplace(EdtValor.Text, ',', '.', [rfReplaceAll]);
                  dm.ZQCadLanData.Params.ParamByName('pBAIVALOR').Value:=EdtValor.Text;
                  dm.ZQCadLanData.Params.ParamByName('pCODIGOUSU').Value:=FrmEntrarUsuario.indentidade;
                  dm.ZQCadLanData.ExecSQL;

                  dm.ZQConsLanData.Close;
                  dm.ZQConsLanData.SQL.Clear;
                  dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(FrmConsBaixa.codigoDoLancamento));
                  dm.ZQConsLanData.Open;

                  //após o lançamento da data e valor, o código abaixo faz a limpeza dos campos.
                  EdtValor.Clear;
                  DtDataParcela.Clear;
            end;
    end;
  end;

end;

procedure TFrmCadParcela.SpeedButton2Click(Sender: TObject);
begin
    ////sair quando usuário quer sair após ter feito lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='i') then
  begin
    if(restante>0) then
    begin
      ShowMessage('Ainda está faltando lançamentos, verifique o valor restante');
    end
    Else
    begin
      ShowMessage('cadastro efetuado com sucesso');
      Close;
    end;
  end;

  //sair quando usuário quer sair após ter feito alteração nas parcelas
  if (FrmCadLancamento.CadOuAltLanDatValor='u') then
  begin
    if(restante>0) then
    begin
      ShowMessage('Ainda está faltando parcelas, verifique o valor restante');
    end
    Else
    begin
      ShowMessage('Alteração efetuada com sucesso');
      Close;
    end;
  end;

end;

procedure TFrmCadParcela.SpeedButton3Click(Sender: TObject);
begin
  //sair para quando o usuário está efetuando o cadastro das parcelas, a partir da tela de lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='i') then
     begin
    if (restante>=0)  then
        begin
            if MessageDlg('ATENÇÃO DESEJA CANCELAR ESTA OPERAÇÃO','Você perderá todos os dados do lançamento e parcelas lançadas',mtInformation,[mbOk,mbCancel],0)=mrOk then
            BEGIN
              DM.ZQDelDataLan.Params.ParamByName('PCODIGOLAN').Value:=FrmCadLancamento.codigoDoLanc;
              dm.ZQDelDataLan.ExecSQL;

              dm.ZQDelLancamentos.Params.ParamByName('PLANCODIGO').Value:=FrmCadLancamento.codigoDoLanc;
              DM.ZQDelLancamentos.ExecSQL;

              dm.ZQConsLanData.Open;
              dm.ZQConsLanData.Close;
              Close;
            end
            ELSE
            BEGIN
                  Abort;
            end;
        end;

     end;
  //código abaixo é quando o usuário já efetuou o cadastro e quer fazer alguma alteração nas parcelas
    if (FrmCadLancamento.CadOuAltLanDatValor='u') then
     begin
      if (restante>0)  then
        begin
             ShowMessage('Ainda existe um valor a ser apropriado em alguma parcela, verefique o valor restante e faça o lançamento');
        end
      else
      begin
          FrmCadParcela.Close;
      end;
     end;

end;

procedure TFrmCadParcela.SpeedButton5Click(Sender: TObject);
begin
  //delete quando está cadastrando lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='i')then
   begin
    if (restante<>FrmCadLancamento.valorDoDocumento) then
        begin
               restante:=restante+valParcelaDel;
               LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);
               dm.ZQDelParcEspecif.Params.ParamByName('PBAICODIGO').Value:=delparcela;
               dm.ZQDelParcEspecif.ExecSQL;
               //LIMPANDO AS VARIÁVEIS
               valParcelaDel:=0;
               delparcela:=0;
               delparcela:=0;

               dm.ZQConsLanData.Close;
               dm.ZQConsLanData.Open;
        end
        else
        begin
            ShowMessage('Não existe valor a ser deletado');
        end;
   end;

  //delete quando usuário quer fazer alteração após ter feito lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='u')then
   begin
    //código abaixo é para validar se a parcela já foi baixada, se for não pode excluir.
    dm.ZQConsLanData.close;
    dm.ZQConsLanData.SQL.Clear;
    dm.ZQConsLanData.SQL.Add('select * from baixa where baistatus=1 and baicodigo='+IntToStr(delparcela));
    dm.ZQConsLanData.Open;

    if(dm.ZQConsLanData.RecordCount=1) then
    begin
         //código abaixo é pq a consulta de cima altera a dbgrid, a consulta de baixo volta ao normal
         dm.ZQConsLanData.Close;
         dm.ZQConsLanData.SQL.Clear;
         dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(FrmConsBaixa.codigoDoLancamento));
         dm.ZQConsLanData.Open;

         ShowMessage('Está parcela já foi efetivada, altere ela para pendente, para depois fazer a alteração');
    end
    else
    begin
    if (restante<>recebValorLan) then
        begin
               restante:=restante+valParcelaDel;
               LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);
               dm.ZQDelParcEspecif.Params.ParamByName('PBAICODIGO').Value:=delparcela;
               dm.ZQDelParcEspecif.ExecSQL;
               //LIMPANDO AS VARIÁVEIS
               valParcelaDel:=0;
               delparcela:=0;
               delparcela:=0;

               dm.ZQConsLanData.Close;
               dm.ZQConsLanData.Open;
        end
        else
        begin
            ShowMessage('Não existe valor a ser deletado');
        end;
   end;

   end;
end;

procedure TFrmCadParcela.EdtValorChange(Sender: TObject);
begin

end;

procedure TFrmCadParcela.EdtValorExit(Sender: TObject);
begin
   (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFrmCadParcela.EdtValorKeyPress(Sender: TObject; var Key: char);
begin
 Key := Simpl.SoValor(Key);
end;

procedure TFrmCadParcela.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    if (FrmCadLancamento.CadOuAltLanDatValor='u') then
    begin
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
end;

procedure TFrmCadParcela.FormKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TFrmCadParcela.DTDataLancamentoChange(Sender: TObject);
begin

end;

procedure TFrmCadParcela.DBGrid1CellClick(Column: TColumn);
begin
  delparcela:=DM.ZQConsLanDataBAICODIGO.AsInteger;
  valParcelaDel:=DM.ZQConsLanDataBAIVALOR.AsFloat;
end;

end.

