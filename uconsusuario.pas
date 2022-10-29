unit UConsUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmConsUsuario }

  TFrmConsUsuario = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnConsulta: TSpeedButton;
    Panel4: TPanel;
    PnAlterausu: TPanel;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CboStatusChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    usualtera:integer;
  end;

var
  FrmConsUsuario: TFrmConsUsuario;

implementation

{$R *.lfm}

{ TFrmConsUsuario }
  uses uCadUsuario,UModulo;
procedure TFrmConsUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsUsuario.FormShow(Sender: TObject);
begin
  PnAlterausu.Visible:=False;
  DM.ZQBuscaUsuario.Open;
end;

procedure TFrmConsUsuario.BtnAlterarClick(Sender: TObject);
begin
  FrmCadUsuario.AltOUCad:='A';
  PnAlterausu.Visible:=True;
  FrmCadUsuario.Parent := PnAlterausu;
  FrmCadUsuario.Align := alClient;
  FrmCadUsuario.Show;

  FrmCadUsuario.codigo:=usualtera;
  FrmCadUsuario.EdtNome.Text:=DM.ZQBuscaUsuarioUSUNOME.AsString;
  FrmCadUsuario.EdtNomeUsuario.Text:=DM.ZQBuscaUsuarioUSULOGIN.AsString;
  FrmCadUsuario.EdtSenha.Text:=DM.ZQBuscaUsuarioUSUSENHA.AsString;
  FrmCadUsuario.EdtConfSenha.Text:=DM.ZQBuscaUsuarioUSUSENHA.AsString;
  if (DM.ZQBuscaUsuarioCODIGONIV.Value=1)then
  begin
    FrmCadUsuario.RgbNivel.ItemIndex:=0;
  end
  else
  if(DM.ZQBuscaUsuarioCODIGONIV.Value=2) then
  begin
    FrmCadUsuario.RgbNivel.ItemIndex:=1;
  end;

  FrmCadUsuario.RgbAltStatus.Visible:=True;

  if(DM.ZQBuscaUsuarioUSUSTATUS.Value=1)then
  begin
    FrmCadUsuario.RgbAltStatus.ItemIndex:=0;
  end
  else
  if(DM.ZQBuscaUsuarioUSUSTATUS.Value=0)then
  begin
    FrmCadUsuario.RgbAltStatus.ItemIndex:=1;
  end;
end;

procedure TFrmConsUsuario.BtnConsultaClick(Sender: TObject);
begin
  if (CboStatus.ItemIndex=0) then
      begin
        DM.ZQBuscaCentro.close;
        DM.ZQBuscaUsuario.SQL.clear;
        DM.ZQBuscaUsuario.SQL.Add('select * from vwmostrausu where usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
        DM.ZQBuscaUsuario.Open;
        EdtConsulta.clear;
      end
      else
    if (CboStatus.ItemIndex=1) then
      begin
        DM.ZQBuscaUsuario.close;
        DM.ZQBuscaUsuario.SQL.clear;
        DM.ZQBuscaUsuario.SQL.Add('select * from vwmostrausu where usustatus=1 and usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
        DM.ZQBuscaUsuario.Open;
        EdtConsulta.clear;
      end
      else
     if (CboStatus.ItemIndex=2) then
       begin
         DM.ZQBuscaUsuario.close;
         DM.ZQBuscaUsuario.SQL.clear;
         DM.ZQBuscaUsuario.SQL.Add('select * from vwmostrausu where usustatus=0 and usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
         DM.ZQBuscaUsuario.Open;
         EdtConsulta.clear;
       end;
end;

procedure TFrmConsUsuario.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsUsuario.CboStatusChange(Sender: TObject);
begin

end;

procedure TFrmConsUsuario.DBGrid1CellClick(Column: TColumn);
begin
  usualtera:=DM.ZQBuscaUsuarioUSUCODIGO.AsInteger;
end;

procedure TFrmConsUsuario.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   PnAlterausu.Visible:=False;
   DM.ZQBuscaUsuario.Close;
end;

end.

