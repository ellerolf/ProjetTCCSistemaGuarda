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
    ChkDespesa: TRadioButton;
    ChkReceita: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboTipoDoc: TComboBox;
    EdtConsCentro: TEdit;
    EdtConsFornecedor: TEdit;
    EdtData: TMaskEdit;
    EdtNDoc: TEdit;
    EdtValor: TEdit;
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
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CboTipoDocChange(Sender: TObject);
    procedure EdtDataChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadLancamento: TFrmCadLancamento;

implementation

{$R *.lfm}

{ TFrmCadLancamento }

uses UModulo;

procedure TFrmCadLancamento.EdtDataChange(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadLancamento.Panel2Click(Sender: TObject);
begin

end;

procedure TFrmCadLancamento.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadLancamento.BtnSalvarClick(Sender: TObject);
begin




end;



procedure TFrmCadLancamento.CboTipoDocChange(Sender: TObject);
begin

end;

end.
