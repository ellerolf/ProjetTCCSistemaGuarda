unit uCadUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, LResources;

type

  { TFrmCadUsuario }

  TFrmCadUsuario = class(TForm)
    BtnAdm: TRadioButton;
    BtnAlterar: TSpeedButton;
    BtnOpera: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    ChkMostrar: TCheckBox;
    CboStatus: TComboBox;
    CboAltStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConfSenha: TEdit;
    EdtConsulta: TEdit;
    EdtNome: TEdit;
    EdtNomeUsuario: TEdit;
    EdtSenha: TEdit;
    GrpNivel: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    BtnConsulta: TSpeedButton;
    Panel2: TPanel;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChkMostrarChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrpNivel1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.lfm}

{ TFrmCadUsuario }
  uses UModulo;
procedure TFrmCadUsuario.GrpNivel1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Label1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.ChkMostrarChange(Sender: TObject);
begin
  if (ChkMostrar.Checked=True)then
   begin
     EdtSenha.PasswordChar:=#0;
     EdtConfSenha.PasswordChar:=#0;
   end
  else if (ChkMostrar.Checked=False)then
   begin
     EdtSenha.PasswordChar:='*';
     EdtConfSenha.PasswordChar:='*';
   end;
end;

procedure TFrmCadUsuario.DBGrid1CellClick(Column: TColumn);
begin
   EdtNome.Text:=DM.ZQConsUsuarioUSUNOME.AsString;
   EdtNomeUsuario.Text:=DM.ZQConsUsuarioUSULOGIN.AsString;
   EdtSenha.Text:=DM.ZQConsUsuarioUSUSENHA.AsString;
   EdtConfSenha.Text:=DM.ZQConsUsuarioUSUSENHA.AsString;
end;

procedure TFrmCadUsuario.BtnAlterarClick(Sender: TObject);
begin
  DM.ZQAltUsuario.Params.ParamByName('pusunome').Value:=EdtNome.Text;
  DM.ZQAltUsuario.Params.ParamByName('pusulogin').Value:=EdtNomeUsuario.Text;
  DM.ZQAltUsuario.Params.ParamByName('pususenha').Value:=EdtSenha.Text;
  DM.ZQAltUsuario.Params.ParamByName('pususenha').Value:=EdtConfSenha.Text;
  DM.ZQAltUsuario.Params.ParamByName('pusucodigo').Value:=DM.ZQConsUsuarioUSUCODIGO.AsInteger;
  DM.ZQAltUsuario.ExecSQL;

  DM.ZQConsUsuario.Close;
  DM.ZQConsUsuario.Open;

  EdtNome.Clear;
  EdtNomeUsuario.Clear;
  EdtSenha.clear;
  EdtConfSenha.Clear;
  BtnAdm.Enabled:= False;
  BtnOpera.Enabled:= False;
end;

procedure TFrmCadUsuario.BtnConsultaClick(Sender: TObject);
begin
  if (CboStatus.ItemIndex=0) then
    begin
      DM.ZQConsUsuario.close;
      DM.ZQConsUsuario.SQL.clear;
      DM.ZQConsUsuario.SQL.Add('select * from usuario where usustatus=1 and usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
      DM.ZQConsUsuario.Open;
      EdtConsulta.clear;
    end
    else
   if (CboStatus.ItemIndex=1) then
     begin
       DM.ZQConsUsuario.close;
       DM.ZQConsUsuario.SQL.clear;
       DM.ZQConsUsuario.SQL.Add('select * from usuario where usustatus=0 and usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
       DM.ZQConsUsuario.Open;
       EdtConsulta.clear;
     end;
end;

procedure TFrmCadUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadUsuario.FormShow(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.BtnSalvarClick(Sender: TObject);
begin
   DM.ZQCadUsuario.Params.ParamByName('pusunome').Value:=EdtNome.Text;
  DM.ZQCadUsuario.Params.ParamByName('pusulogin').Value:=EdtNomeUsuario.Text;
  DM.ZQCadUsuario.Params.ParamByName('pususenha').Value:=EdtSenha.Text;
  DM.ZQCadUsuario.Params.ParamByName('pususenha').Value:=EdtConfSenha.Text;
  if(BtnAdm.Enabled=true)then
   begin
     DM.ZQCadUsuario.Params.ParamByName('pcodigoniv').Value:= 1;
   end
  else if(BtnOpera.Enabled=true)then
   begin
     DM.ZQCadUsuario.Params.ParamByName('pcodigoniv').Value:=2;
   end;
  DM.ZQCadUsuario.ExecSQL;

  DM.ZQConsUsuario.Close;
  DM.ZQConsUsuario.Open;

  EdtNome.Clear;
  EdtNomeUsuario.Clear;
  EdtSenha.clear;
  EdtConfSenha.Clear;
  BtnAdm.Enabled:= False;
  BtnOpera.Enabled:= False;
end;

procedure TFrmCadUsuario.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.Panel2Click(Sender: TObject);
begin

end;

end.
