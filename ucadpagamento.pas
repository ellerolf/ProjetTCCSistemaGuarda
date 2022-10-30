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
    EdtValorLanc: TEdit;
    EdtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    BtnSalvar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnAlterar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DTDataLancamentoChange(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: char);
    procedure EdtValorLancExit(Sender: TObject);
    procedure EdtValorLancKeyPress(Sender: TObject; var Key: char);
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
    //Essa variável será usada para quando o usuário quiser alterar o valor do lançamento
    AlteraValorLancamento:Real;
    //Depois fe feito o lançamento e cadastrado parcelas, caso o usuário queira alterar o vlr do
    //lançamento, criei a variável abaixo para receber o valor das parcelas baixada,
    //pois o usuário não pode alterar o vlr do lançamento para menor do que o valor de parcelas já baixada.
    ValorParcBaixada:real;

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
      ShowMessage('Cadastro efetuado com sucesso');
      DtDataParcela.Clear;
      EdtValor.Clear;
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
         DtDataParcela.Clear;
         EdtValor.Clear;
         //O código abaixo limpa os campos e a variável na tela consbaixa, após o usuário salvar a alterações
         FrmConsBaixa.codigoDaParcela:=0;
         FrmConsBaixa.ChkDespesa.Checked:=False;
         FrmConsBaixa.ChkReceita.Checked:=False;
         FrmConsBaixa.DTLancamento.Clear;
         FrmConsBaixa.EdtTipoDocumento.Clear;
         FrmConsBaixa.EdtNDoc.Clear;
         FrmConsBaixa.EdtConsFornecedor.Clear;
         FrmConsBaixa.EdtConsCentro.Clear;
         FrmConsBaixa.MemObservacao.Clear;
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
              restante:=0;
              LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);
              FrmCadLancamento.codigoDoLanc:=0;
              dm.ZQConsLanData.Open;
              dm.ZQConsLanData.Close;
              //caso ele deixa o salvar ativo e clique em sair o codigo abaixo acerta os botoes
              DtDataParcela.Clear;
              EdtValor.Clear;
              EdtValorLanc.Clear;
              BtnSalvar.Enabled:=False;
              BtnCancelar.Enabled:=False;
              BtnAlterar.Enabled:=True;
              EdtValorLanc.Enabled:=False;

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
           DtDataParcela.Clear;
           EdtValor.Clear;
           BtnSalvar.Enabled:=False;
           BtnCancelar.Enabled:=False;
           BtnAlterar.Enabled:=True;
           EdtValorLanc.Enabled:=False;
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
               //código abaixo é pq a consulta de onde verifica se a parcela foi baixada altera a dbgrid,
               //a consulta de baixo faz ela voltar ao normal
               dm.ZQConsLanData.Close;
               dm.ZQConsLanData.SQL.Clear;
               dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(FrmConsBaixa.codigoDoLancamento));
               dm.ZQConsLanData.Open;
        end
        else
        begin
            ShowMessage('Não existe valor a ser deletado');
        end;
   end;

   end;
end;

procedure TFrmCadParcela.EdtValorExit(Sender: TObject);
begin
   (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFrmCadParcela.EdtValorKeyPress(Sender: TObject; var Key: char);
begin
 Key := Simpl.SoValor(Key);
end;

procedure TFrmCadParcela.EdtValorLancExit(Sender: TObject);
begin
    (Sender as TEdit).Text := Simpl.FormataValor((Sender as TEdit).Text,2);
end;

procedure TFrmCadParcela.EdtValorLancKeyPress(Sender: TObject; var Key: char);
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

procedure TFrmCadParcela.BtnAlterarClick(Sender: TObject);
begin
  //Alteração do valor do lançamento quando está cadastrando lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='i')then
  begin
    BtnSalvar.Enabled:=True;
    BtnAlterar.Enabled:=False;
    BtnCancelar.Enabled:=True;
    EdtValorLanc.Enabled:=True;
  end;

  //Alteração do valor do lançamento quando está alterando as parcelas
  if (FrmCadLancamento.CadOuAltLanDatValor='u')then
  begin
    BtnSalvar.Enabled:=True;
    BtnAlterar.Enabled:=False;
    BtnCancelar.Enabled:=True;
    EdtValorLanc.Enabled:=True;
  end;
end;

procedure TFrmCadParcela.BtnCancelarClick(Sender: TObject);
begin
  {FOI NECESSÁRIO CRIAR A ZQConsLancamento2 pq quando estava usando a ZQConsLancamento dava erro, quando eu alterava
  o valor do lancamento, e clicava em sair, e depois cadastrava outro lançamento ele dava erro.}

  //Alteração do valor do lançamento quando está cadastrando lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='i')then
  begin
       dm.ZQConsLancamento2.Close;
       dm.ZQConsLancamento2.SQL.Clear;
       dm.ZQConsLancamento2.SQL.add('select * from lancamento where lancodigo='+IntToStr(FrmCadLancamento.codigoDoLanc));
       dm.ZQConsLancamento2.Open;
       EdtValorLanc.Text:=FormatCurr('0.00',dm.ZQConsLancamento2LANVALOR_DOCUMENTO.AsFloat);
       BtnCancelar.Enabled:=False;
       BtnSalvar.Enabled:=False;
       BtnAlterar.Enabled:=True;
       EdtValorLanc.Enabled:=False;
  end;

    //Alteração do valor do lançamento quando está alterando as parcelas
     if (FrmCadLancamento.CadOuAltLanDatValor='u')then
  begin
       dm.ZQConsLancamento2.Close;
       dm.ZQConsLancamento2.SQL.Clear;
       dm.ZQConsLancamento2.SQL.add('select * from lancamento where lancodigo='+IntToStr(FrmConsBaixa.codigoDoLancamento));
       dm.ZQConsLancamento2.Open;
       EdtValorLanc.Text:=FormatCurr('0.00',dm.ZQConsLancamento2LANVALOR_DOCUMENTO.AsFloat);
       BtnCancelar.Enabled:=False;
       BtnSalvar.Enabled:=False;
       BtnAlterar.Enabled:=True;
       EdtValorLanc.Enabled:=False;
  end;


end;

procedure TFrmCadParcela.BtnSalvarClick(Sender: TObject);
begin
  //Alteração do valor do lançamento quando está cadastrando lançamento
  if (FrmCadLancamento.CadOuAltLanDatValor='i')then
  Begin
     IF (EdtValorLanc.Text='') OR (EdtValorLanc.Text='0,00') THEN
    BEGIN
         ShowMessage('Você não digitou corretamente, tente novamente');
         BtnSalvar.Enabled:=True;
         BtnCancelar.Enabled:=True;
         BtnAlterar.Enabled:=False;
         EdtValorLanc.Enabled:=True;
    end
    else if (EdtValorLanc.Text='0') then
    begin
         ShowMessage('Não é possível alterar o valor do lançamento para zero');
         BtnSalvar.Enabled:=True;
         BtnCancelar.Enabled:=True;
         BtnAlterar.Enabled:=False;
         EdtValorLanc.Enabled:=True;
    end
    Else
    begin
         AlteraValorLancamento:=StrToFloat(EdtValorLanc.Text);

         dm.ZQConsLancamento2.Close;
         dm.ZQConsLancamento2.SQL.Clear;
         dm.ZQConsLancamento2.SQL.add('select * from lancamento where lancodigo='+IntToStr(FrmCadLancamento.codigoDoLanc));
         dm.ZQConsLancamento2.Open;

         if (AlteraValorLancamento=0) then
            begin
                 ShowMessage('VALOR INCORRETO, verifique se o valor da parcela se está correto.');
            END
         Else if(AlteraValorLancamento=dm.ZQConsLancamento2LANVALOR_DOCUMENTO.AsFloat) then
            begin
                 ShowMessage('Valor digitado é igual o valor atual do lançamento');
            end
            ELSE
            begin
                 if MessageDlg('DESEJA ALTERAR VALOR DO LANÇAMENTO?','Ao confirmar essa operação faça o cadastro das parcelas novamente',mtInformation,[mbOk,mbCancel],0)=mrOk then
                    begin
                         restante:=AlteraValorLancamento;
                         LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);
                         LblValor.Caption:=FormatFloat('R$ 0.00',AlteraValorLancamento);
                         DM.ZQDelDataLan.Params.ParamByName('PCODIGOLAN').Value:=FrmCadLancamento.codigoDoLanc;
                         dm.ZQDelDataLan.ExecSQL;

                         dm.ZQConsLanData.Open;
                         dm.ZQConsLanData.Close;

                         EdtValorLanc.Text:=StringReplace(EdtValorLanc.Text, ',', '.', [rfReplaceAll]);
                         dm.ZQAltValorLanc.Params.ParamByName('planvalor_documento').Value:=EdtValorLanc.Text;
                         dm.ZQAltValorLanc.Params.ParamByName('plancodigo').Value:=FrmCadLancamento.codigoDoLanc;
                         dm.ZQAltValorLanc.ExecSQL;


                         EdtValorLanc.Text:=FloatToStr(AlteraValorLancamento);
                         BtnSalvar.Enabled:=False;
                         BtnCancelar.Enabled:=False;
                         BtnAlterar.Enabled:=True;
                         EdtValorLanc.Enabled:=False;
                         ShowMessage('Alteração efetuada com sucesso');
                    end
                    Else
                    begin
                         dm.ZQConsLancamento2.Close;
                         dm.ZQConsLancamento2.SQL.Clear;
                         dm.ZQConsLancamento2.SQL.add('select * from lancamento where lancodigo='+IntToStr(FrmCadLancamento.codigoDoLanc));
                         dm.ZQConsLancamento2.Open;
                         EdtValorLanc.Text:=FormatCurr('0.00',dm.ZQConsLancamento2LANVALOR_DOCUMENTO.AsFloat);

                         BtnSalvar.Enabled:=False;
                         BtnCancelar.Enabled:=False;
                         BtnAlterar.Enabled:=True;
                         EdtValorLanc.Enabled:=False;
                         Abort;
                    end;
            end;
    end;
  end;

   //Alteração do valor do lançamento quando está alterando as parcelas
  if (FrmCadLancamento.CadOuAltLanDatValor='u')then
  Begin
     IF (EdtValorLanc.Text='') OR (EdtValorLanc.Text='0,00') THEN
    BEGIN
         ShowMessage('Você não digitou corretamente, tente novamente');
         BtnSalvar.Enabled:=True;
         BtnCancelar.Enabled:=True;
         BtnAlterar.Enabled:=False;
         EdtValorLanc.Enabled:=True;
    end
    else if (EdtValorLanc.Text='0') then
    begin
         ShowMessage('Não é possível alterar o valor do lançamento para zero');
         BtnSalvar.Enabled:=True;
         BtnCancelar.Enabled:=True;
         BtnAlterar.Enabled:=False;
         EdtValorLanc.Enabled:=True;
    end
    Else
    begin
         AlteraValorLancamento:=StrToFloat(EdtValorLanc.Text);

         DM.ZQConsSomaParcBaixada.Close;
         DM.ZQConsSomaParcBaixada.SQL.Clear;
         DM.ZQConsSomaParcBaixada.SQL.Add('SELECT sum(BAIVALOR) from baixa where codigolan='+IntToStr(FrmConsBaixa.codigoDoLancamento)+' and BAISTATUS=1');
         DM.ZQConsSomaParcBaixada.Open;

         ValorParcBaixada:=DM.ZQConsSomaParcBaixadasumBAIVALOR.AsFloat;

         dm.ZQConsLancamento2.Close;
         dm.ZQConsLancamento2.SQL.Clear;
         dm.ZQConsLancamento2.SQL.add('select * from lancamento where lancodigo='+IntToStr(FrmConsBaixa.codigoDoLancamento));
         dm.ZQConsLancamento2.Open;

         if (AlteraValorLancamento=0) then
            begin
                 ShowMessage('VALOR INCORRETO, verifique se o valor está correto.');
            END
         Else if(AlteraValorLancamento=dm.ZQConsLancamento2LANVALOR_DOCUMENTO.AsFloat) then
            begin
                 ShowMessage('Valor digitado é igual o valor atual do lançamento');
            end
         Else if(AlteraValorLancamento<=ValorParcBaixada) then
            begin
                 ShowMessage('Não é possível alterar o lançamento para o valor desejado, pois já existe parcelas baixadas no valor de '+FormatFloat('R$ 0.00',ValorParcBaixada));
            end
            ELSE
            begin
                 if MessageDlg('DESEJA ALTERAR VALOR DO LANÇAMENTO?','Ao confirmar essa operação faça o cadastro das parcelas novamente',mtInformation,[mbOk,mbCancel],0)=mrOk then
                    begin
                         restante:=AlteraValorLancamento;
                         //TESTE LINHA DE BAIXO
                         restante:=restante-ValorParcBaixada;
                         LblValorRestante.Caption:=FormatFloat('R$ 0.00',restante);
                         LblValor.Caption:=FormatFloat('R$ 0.00',AlteraValorLancamento);
                         DM.ZQDelParcPen.Params.ParamByName('PCODIGOLAN').Value:=FrmConsBaixa.codigoDoLancamento;
                         dm.ZQDelParcPen.ExecSQL;

                         //dm.ZQConsLanData.Open;
                         //dm.ZQConsLanData.Close;
                         //código abaixo é para atualizar a dbgrid após a exclusão das parcelas pendente
                         dm.ZQConsLanData.Close;
                         dm.ZQConsLanData.SQL.Clear;
                         dm.ZQConsLanData.SQL.add('select * from baixa where codigolan='+IntToStr(FrmConsBaixa.codigoDoLancamento));
                         dm.ZQConsLanData.Open;

                         EdtValorLanc.Text:=StringReplace(EdtValorLanc.Text, ',', '.', [rfReplaceAll]);
                         dm.ZQAltValorLanc.Params.ParamByName('planvalor_documento').Value:=EdtValorLanc.Text;
                         dm.ZQAltValorLanc.Params.ParamByName('plancodigo').Value:=FrmConsBaixa.codigoDoLancamento;
                         dm.ZQAltValorLanc.ExecSQL;


                         EdtValorLanc.Text:=FloatToStr(AlteraValorLancamento);
                         BtnSalvar.Enabled:=False;
                         BtnCancelar.Enabled:=False;
                         BtnAlterar.Enabled:=True;
                         EdtValorLanc.Enabled:=False;
                         ShowMessage('Alteração efetuada com sucesso');
                    end
                    Else
                    begin
                         dm.ZQConsLancamento2.Close;
                         dm.ZQConsLancamento2.SQL.Clear;
                         dm.ZQConsLancamento2.SQL.add('select * from lancamento where lancodigo='+IntToStr(FrmConsBaixa.codigoDoLancamento));
                         dm.ZQConsLancamento2.Open;
                         EdtValorLanc.Text:=FormatCurr('0.00',dm.ZQConsLancamento2LANVALOR_DOCUMENTO.AsFloat);

                         BtnSalvar.Enabled:=False;
                         BtnCancelar.Enabled:=False;
                         BtnAlterar.Enabled:=True;
                         EdtValorLanc.Enabled:=False;
                         Abort;
                    end;
            end;
    end;
  end;
end;

end.

