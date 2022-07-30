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
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CboStatusChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

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
  DM.ZQBuscaUsuario.Open;
end;

procedure TFrmConsUsuario.BtnAlterarClick(Sender: TObject);
begin
  FrmCadUsuario.AltOUCad:='A';
  FrmCadUsuario.BtnAlterar.Visible:=True;
  FrmCadUsuario.Show;
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

procedure TFrmConsUsuario.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   DM.ZQBuscaUsuario.Close;
end;

end.

