unit UConsContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, Grids, UModulo;

type

  { TFrmConsContas }

  TFrmConsContas = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboStatus: TComboBox;
    DBGConsCaixa: TDBGrid;
    DBGConsContasBancarias: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RGBConsTipoConta: TRadioGroup;
    procedure BtnSairClick(Sender: TObject);
    procedure CboStatusChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGBConsTipoContaClick(Sender: TObject);
    procedure ConsContas();
  private

  public

  end;

var
  FrmConsContas: TFrmConsContas;

implementation

{$R *.lfm}

{ TFrmConsContas }

procedure TFrmConsContas.BtnSairClick(Sender: TObject);
begin
    RGBConsTipoConta.ItemIndex:=-1;
    CboStatus.ItemIndex:=-1;
    DBGConsContasBancarias.Visible:=false;
    DBGConsCaixa.Visible:=false;
    Close;
end;

procedure TFrmConsContas.CboStatusChange(Sender: TObject);
begin
  ConsContas();
end;

procedure TFrmConsContas.EdtConsultaChange(Sender: TObject);
begin

end;

procedure TFrmConsContas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsBancarias.Active:=False;
end;

procedure TFrmConsContas.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsContas.FormShow(Sender: TObject);
begin
  DM.ZQConsBancarias.Active:=True;
end;

procedure TFrmConsContas.RGBConsTipoContaClick(Sender: TObject);
begin
  ConsContas();
end;

procedure TFrmConsContas.ConsContas;
begin
    if (RGBConsTipoConta.ItemIndex=0) AND (CboStatus.ItemIndex=0)then
    begin
         dm.ZQConsBancarias.close;
         dm.ZQConsBancarias.SQL.clear;
         dm.ZQConsBancarias.SQL.Add('select *from contas WHERE CODIGOTIP=3');
         dm.ZQConsBancarias.Open;
         DBGConsCaixa.Visible:=true;
         DBGConsContasBancarias.Visible:=false;
    end
    else if (RGBConsTipoConta.ItemIndex=0) AND (CboStatus.ItemIndex=1)then
    begin
         dm.ZQConsBancarias.close;
         dm.ZQConsBancarias.SQL.clear;
         dm.ZQConsBancarias.SQL.Add('select *from contas WHERE CODIGOTIP=3 and CONSTATUS=1');
         dm.ZQConsBancarias.Open;
         DBGConsCaixa.Visible:=true;
         DBGConsContasBancarias.Visible:=false;
    end
    else if (RGBConsTipoConta.ItemIndex=0) AND (CboStatus.ItemIndex=2)then
    begin
         dm.ZQConsBancarias.close;
         dm.ZQConsBancarias.SQL.clear;
         dm.ZQConsBancarias.SQL.Add('select *from contas WHERE CODIGOTIP=3 and CONSTATUS=0');
         dm.ZQConsBancarias.Open;
         DBGConsCaixa.Visible:=true;
         DBGConsContasBancarias.Visible:=false;

    end
    else if (RGBConsTipoConta.ItemIndex=1) AND (CboStatus.ItemIndex=0) then
    begin
         dm.ZQConsBancarias.close;
         dm.ZQConsBancarias.SQL.clear;
         dm.ZQConsBancarias.SQL.Add('select * from contas WHERE CODIGOTIP<3');
         dm.ZQConsBancarias.Open;
         DBGConsCaixa.Visible:=False;
         DBGConsContasBancarias.Visible:=True;
    end
    else if (RGBConsTipoConta.ItemIndex=1) AND (CboStatus.ItemIndex=1) then
    begin
         dm.ZQConsBancarias.close;
         dm.ZQConsBancarias.SQL.clear;
         dm.ZQConsBancarias.SQL.Add('select * from contas WHERE CODIGOTIP<3 and CONSTATUS=1');
         dm.ZQConsBancarias.Open;
         DBGConsCaixa.Visible:=False;
         DBGConsContasBancarias.Visible:=True;
    end
    else if (RGBConsTipoConta.ItemIndex=1) AND (CboStatus.ItemIndex=2) then
    begin
         dm.ZQConsBancarias.close;
         dm.ZQConsBancarias.SQL.clear;
         dm.ZQConsBancarias.SQL.Add('select * from contas WHERE CODIGOTIP<3 and CONSTATUS=0');
         dm.ZQConsBancarias.Open;
         DBGConsCaixa.Visible:=False;
         DBGConsContasBancarias.Visible:=True;
    end
    else
    begin

    end;
end;

end.
