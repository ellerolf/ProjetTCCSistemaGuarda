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

  end;

var
  FrmCadParcela: TFrmCadParcela;

implementation

{$R *.lfm}

{ TFrmCadParcela }

uses UModulo,UEntrarUsuario,uCadLancamento;

procedure TFrmCadParcela.SpeedButton1Click(Sender: TObject);
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
                dm.ZQCadLanData.Params.ParamByName('pBAIDATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataParcela.Date);
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

procedure TFrmCadParcela.SpeedButton2Click(Sender: TObject);
begin
 if(restante>0) then
     begin
          ShowMessage('Ainda está faltando lançamentos, verifique o valor restante');
     end
     Else
     begin
          ShowMessage('cadastro efetuado com sucesso');

 end;

end;

procedure TFrmCadParcela.SpeedButton3Click(Sender: TObject);
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

procedure TFrmCadParcela.SpeedButton5Click(Sender: TObject);
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

