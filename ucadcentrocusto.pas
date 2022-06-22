unit uCadCentroCusto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids;

type

  { TFrmCadCentroCusto }

  TFrmCadCentroCusto = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboTipo1: TComboBox;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    EdtNome: TEdit;
    EdtNome1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RgbStatus: TRadioGroup;
    RgbTipo: TRadioGroup;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadCentroCusto: TFrmCadCentroCusto;

implementation

{$R *.lfm}

{ TFrmCadCentroCusto }
   uses UModulo;
procedure TFrmCadCentroCusto.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCentroCusto.BtnAlterarClick(Sender: TObject);
begin
  DM.ZQAltCentro.Params.ParamByName('pcennome').Value:=EdtNome.Text;
  if (RgbTipo.ItemIndex=0) then
     begin
       DM.ZQAltCentro.Params.ParamByName('pcodigotip').Value:=1;
     end
  else
  if (RgbTipo.ItemIndex=1) then
     begin
       DM.ZQAltCentro.Params.ParamByName('pcodigotip').Value:=2;
     end;
  DM.ZQAltCentro.Params.ParamByName('pcencodigo').Value:=DM.ZQConsCentroCENCODIGO.AsInteger;
  DM.ZQAltCentro.ExecSQL;

  DM.ZQConsCentro.Close;
  DM.ZQConsCentro.Open;

  EdtNome.Clear;
  RgbTipo.ItemIndex:=-1;
end;

procedure TFrmCadCentroCusto.BtnSalvarClick(Sender: TObject);
begin
  DM.ZQCadCentro.Params.ParamByName('pcennome').Value:=EdtNome.Text;
  if (RgbTipo.ItemIndex=0) then
     begin
       DM.ZQCadCentro.Params.ParamByName('pcodigotip').Value:=1;
     end
  else
  if (RgbTipo.ItemIndex=0) then
     begin
       DM.ZQCadCentro.Params.ParamByName('pcodigotip').Value:=2;
     end;
  DM.ZQCadCentro.ExecSQL;

  DM.ZQConsCentro.Close;
  DM.ZQConsCentro.Open;

  EdtNome.Clear;
  RgbTipo.ItemIndex:=-1;
end;

procedure TFrmCadCentroCusto.DBGrid1CellClick(Column: TColumn);
begin
  EdtNome.Text:=DM.ZQConsCentroCENNOME.AsString;
  If (DM.ZQConsCentroCODIGOTIP.Value=1) then
     begin
       RgbTipo.ItemIndex:=0;
     end
  else
  if (DM.ZQConsCentroCODIGOTIP.Value=2) then
     begin
       RgbTipo.ItemIndex:=1;
     end;
end;

procedure TFrmCadCentroCusto.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadCentroCusto.FormShow(Sender: TObject);
begin
  DM.ZQConsCentro.Active:= true;
  RgbStatus.Visible:=False;
end;

procedure TFrmCadCentroCusto.Label4Click(Sender: TObject);
begin

end;

procedure TFrmCadCentroCusto.Label7Click(Sender: TObject);
begin

end;

procedure TFrmCadCentroCusto.Panel2Click(Sender: TObject);
begin

end;

end.
