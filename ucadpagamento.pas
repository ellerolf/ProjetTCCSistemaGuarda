unit UCadPagamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBExtCtrls, Buttons, DBGrids, EditBtn;

type

  { TFrmCadParcela }

  TFrmCadParcela = class(TForm)
    DtDataParcela: TDateEdit;
    DBGrid1: TDBGrid;
    EdtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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
    procedure SpeedButton1Click(Sender: TObject);
  private

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
  IF (DtDataParcela.Text='') OR (EdtValor.Text='') THEN
  BEGIN
       ShowMessage('Está faltando lançar algum dos campos');
  end
  else
      if (valor>restante) then
          begin
               ShowMessage('VALOR INCORRETO, FALTA LANÇAR O VALOR RESTANTE APENAS.');
          END
          ELSE
          begin

                valor:=StrToFloat(EdtValor.Text);
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

          end;



     end;

procedure TFrmCadParcela.EdtValorChange(Sender: TObject);
begin

end;

procedure TFrmCadParcela.DTDataLancamentoChange(Sender: TObject);
begin

end;

end.

