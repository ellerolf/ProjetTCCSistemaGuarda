unit uCadLancamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls;

type

  { TFrmCadLancamento }

  TFrmCadLancamento = class(TForm)
    BtnConsCentro: TSpeedButton;
    BtnConsCentro1: TSpeedButton;
    BtnDespesa: TRadioButton;
    BtnReceita: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboTipoDoc: TComboBox;
    EdtConsCentro: TEdit;
    EdtConsFornecedor: TEdit;
    EdtData: TMaskEdit;
    EdtNDoc: TEdit;
    EdtValor: TEdit;
    GroupBox1: TGroupBox;
    GrpTipo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    MemObservacao: TMemo;
    Panel1: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure EdtDataChange(Sender: TObject);
  private

  public

  end;

var
  FrmCadLancamento: TFrmCadLancamento;

implementation

{$R *.lfm}

{ TFrmCadLancamento }

procedure TFrmCadLancamento.EdtDataChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.

