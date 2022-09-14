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
    procedure DTDataLancamentoChange(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: char);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public
    valor:Real;
    restante:Real;
    codigoDoLanc:Integer;


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

                dm.ZQCadLanData.Params.ParamByName('pCODIGOLAN').Value:=Null;
                dm.ZQCadLanData.Params.ParamByName('pBAIDATA').AsString:=FormatDateTime('yyyy-mm-dd',DtDataParcela.Date);
                EdtValor.Text :=StringReplace(EdtValor.Text, ',', '.', [rfReplaceAll]);
                dm.ZQCadLanData.Params.ParamByName('pBAIVALOR').Value:=EdtValor.Text;
                dm.ZQCadLanData.Params.ParamByName('pCODIGOUSU').Value:=FrmEntrarUsuario.indentidade;
                dm.ZQCadLanData.ExecSQL;
                dm.ZQConsLanData.Close;
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

  //Ao clicar em salvar ele fará o insert na tabela de lançamento
  if (FrmCadLancamento.ChkReceita.Checked=True) then
    begin
      dm.ZQCadLancamentos.Params.ParamByName('pLANTIPO').Value:=1;
    end;
    if (FrmCadLancamento.ChkDespesa.Checked=True) then
    begin
      dm.ZQCadLancamentos.Params.ParamByName('pLANTIPO').Value:=0;
    end;
    dm.ZQCadLancamentos.Params.ParamByName('pLANDOCUMENTO').AsString:=FormatDateTime('yyyy-mm-dd',FrmCadLancamento.DTLancamento.Date);
    dm.ZQCadLancamentos.Params.ParamByName('pCODIGODOC').Value:=FrmCadLancamento.EdtTipoDocumento.Text;
    dm.ZQCadLancamentos.Params.ParamByName('pLANNUMERO_DOCUMENTO').Value:=FrmCadLancamento.EdtNDoc.Text;
    FrmCadLancamento.EdtValor.Text:=StringReplace(FrmCadLancamento.EdtValor.Text, ',', '.', [rfReplaceAll]);
    dm.ZQCadLancamentos.Params.ParamByName('pLANVALOR_DOCUMENTO').Value:=FrmCadLancamento.EdtValor.Text;
    dm.ZQCadLancamentos.Params.ParamByName('pCODIGOPES').Value:=FrmCadLancamento.EdtConsFornecedor.Text;
    dm.ZQCadLancamentos.Params.ParamByName('pCODIGOCEN').Value:=FrmCadLancamento.EdtConsCentro.Text;
    dm.ZQCadLancamentos.Params.ParamByName('pLANOBSERVACAO').Value:=FrmCadLancamento.MemObservacao.Text;
    dm.ZQCadLancamentos.Params.ParamByName('pCODIGOUSU').Value:=FrmEntrarUsuario.indentidade;
    dm.ZQCadLancamentos.ExecSQL;

  //Quando o usuário fez o insert da data e valor foi sem o código do lançamento.
  //O código abaixo é para atualizar o codigolan da baixa para o código do lançamento na qual essa data e valor pertence.

  dm.ZQConsLancamentos.close;
  dm.ZQConsLancamentos.Open;
  dm.ZQConsLancamentos.Last;

  codigoDoLanc:=DM.ZQConsLancamentosLANCODIGO.AsInteger;
  dm.ZQAltCodLanNaBaixa.Params.ParamByName('pCODIGOLAN').Value:=codigoDoLanc;
  dm.ZQAltCodLanNaBaixa.ExecSQL;

  ShowMessage('deu certo essa merda');

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

end.

