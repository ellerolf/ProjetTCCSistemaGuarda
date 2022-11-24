unit UForPg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmForPg }

  TFrmForPg = class(TForm)
    DBGrid1: TDBGrid;
    EdtPesquisar: TEdit;
    Label10: TLabel;
    Panel1: TPanel;
    BtnPesquisar: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSeleciona: TSpeedButton;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private

  public

  end;

var
  FrmForPg: TFrmForPg;

implementation

{$R *.lfm}

{ TFrmForPg }
uses UModulo, UbaixaParcela;

procedure TFrmForPg.Panel1Click(Sender: TObject);
begin

end;

procedure TFrmForPg.FormShow(Sender: TObject);
begin
     DM.ZQFormaPagto.Active:=True;
end;

procedure TFrmForPg.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     DM.ZQFormaPagto.Active:=False;
end;

procedure TFrmForPg.DBGrid1CellClick(Column: TColumn);
begin
     FRMBaixaParcela.codigoFormPgto:=dm.ZQFormaPagtoFORCODIGO.AsInteger;
end;

procedure TFrmForPg.BtnSairClick(Sender: TObject);
begin
     EdtPesquisar.Clear;
     FRMBaixaParcela.codigoFormPgto:=0;
     Close;
end;

procedure TFrmForPg.BtnPesquisarClick(Sender: TObject);
begin
     dm.ZQFormaPagto.Close;
     dm.ZQFormaPagto.SQL.Clear;
     dm.ZQFormaPagto.SQL.Add('select * from forma_pagamento where  FORNOME LIKE'+QuotedStr('%'+EdtPesquisar.Text+'%'));
     DM.ZQFormaPagto.Open;
     EdtPesquisar.Clear;
end;

procedure TFrmForPg.BtnSelecionaClick(Sender: TObject);
begin
     if (FRMBaixaParcela.codigoFormPgto>0) then
     begin
          FRMBaixaParcela.EdtFormaPagamento.Text:=IntToStr(FRMBaixaParcela.codigoFormPgto);
          FRMBaixaParcela.codigoFormPgto:=0;
          EdtPesquisar.Clear;
          Close;
     end;
     EdtPesquisar.Clear;
     Close;
end;

end.

