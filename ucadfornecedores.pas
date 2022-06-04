unit uCadFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit;

type

  { TFrmCadFornecedor }

  TFrmCadFornecedor = class(TForm)
    BtnCnpj: TRadioButton;
    BtnAtivo: TRadioButton;
    BtnCpf: TRadioButton;
    BtnInativo: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboTipo: TComboBox;
    CboUf: TComboBox;
    EdtBairro: TEdit;
    EdtCel: TEdit;
    EdtCep: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    EdtCpfCnpj: TEdit;
    EdtDTNasc: TMaskEdit;
    EdtEmail: TEdit;
    EdtEndereco: TEdit;
    EdtFantasia: TEdit;
    EdtInsEstadual: TEdit;
    EdtInsMunicipal: TEdit;
    EdtNDoc: TEdit;
    EdtNome: TEdit;
    EdtNumero: TEdit;
    EdtTel: TEdit;
    GrpCnpjCpf: TGroupBox;
    GrpStatus: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    MemObs: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;

implementation

{$R *.lfm}

{ TFrmCadFornecedor }

procedure TFrmCadFornecedor.Label7Click(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornecedor.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

end.

