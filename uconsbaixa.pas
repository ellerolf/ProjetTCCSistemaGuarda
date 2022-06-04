unit UConsBaixa;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, MaskEdit,
  StdCtrls, Buttons, DBGrids;

type

  { TFrmConsBaixa }

  TFrmConsBaixa = class(TForm)
    BtnAlterar: TRadioButton;
    BtnAlterar1: TSpeedButton;
    BtnPagar: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnSalvar1: TSpeedButton;
    CboConta: TComboBox;
    CboStatus: TComboBox;
    CboStatus1: TComboBox;
    DBGrid1: TDBGrid;

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
    EdtDataInicio: TMaskEdit;
    EdtDataFim: TMaskEdit;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure EdtDataInicioChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  FrmConsBaixa: TFrmConsBaixa;

implementation

{$R *.lfm}

{ TFrmConsBaixa }

procedure TFrmConsBaixa.EdtDataInicioChange(Sender: TObject);
begin

end;

procedure TFrmConsBaixa.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsBaixa.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.

