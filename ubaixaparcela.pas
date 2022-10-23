unit UbaixaParcela;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  EditBtn, Buttons;

type

  { TFRMBaixaParcela }

  TFRMBaixaParcela = class(TForm)
    DateEdit1: TDateEdit;
    DtaVencimento: TDateEdit;
    EdtValorParcela: TEdit;
    EdtContaBank: TEdit;
    EdtFormPg: TEdit;
    EdtMulta: TEdit;
    EdtDesconto: TEdit;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblTotPg: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    BtnConsFormPg: TSpeedButton;
    BtnConsConta: TSpeedButton;
    BtnConfirma: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnCancela: TSpeedButton;
    procedure DtaVencimentoChange(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FRMBaixaParcela: TFRMBaixaParcela;

implementation

{$R *.lfm}

{ TFRMBaixaParcela }

procedure TFRMBaixaParcela.Panel2Click(Sender: TObject);
begin

end;

procedure TFRMBaixaParcela.DtaVencimentoChange(Sender: TObject);
begin

end;

end.

