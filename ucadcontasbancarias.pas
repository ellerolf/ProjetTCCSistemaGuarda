unit uCadContasBancarias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ComCtrls;

type

  { TFrmCadContasBancarias }

  TFrmCadContasBancarias = class(TForm)
    BtnCadConta: TRadioButton;
    BtnCadTrans: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboBanco: TComboBox;
    CboTipo: TComboBox;
    EdtAgencia: TEdit;
    EdtNConta: TEdit;
    EdtNDoc: TEdit;
    EdtSaldoInicial: TEdit;
    EdtVlrTras: TEdit;
    GrpCadastro: TGroupBox;
    GrpTrasfe: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    LstCodConta: TListView;
    LstCodConta1: TListView;
    MaskEdit1: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadContasBancarias: TFrmCadContasBancarias;

implementation

{$R *.lfm}

{ TFrmCadContasBancarias }

procedure TFrmCadContasBancarias.Label5Click(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadContasBancarias.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadContasBancarias.MaskEdit1Change(Sender: TObject);
begin

end;

procedure TFrmCadContasBancarias.Panel2Click(Sender: TObject);
begin

end;

end.

