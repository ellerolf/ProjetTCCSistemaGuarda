unit UEntrarUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFrmEntrarUsuario }

  TFrmEntrarUsuario = class(TForm)
    ChkMostrar: TCheckBox;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LblMensagem: TLabel;
    pncentro: TPanel;
    BtnEntrar: TSpeedButton;
    Panel2: TPanel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure ChkMostrarChange(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: char);
    procedure EdtUsuarioChange(Sender: TObject);
    procedure EdtUsuarioKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LblMensagemClick(Sender: TObject);
    procedure pncentroClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public
    usuarios: string;
    indentidade, acesso: integer;

  end;

var
  FrmEntrarUsuario: TFrmEntrarUsuario;

implementation

{$R *.lfm}

{ TFrmEntrarUsuario }
uses UModulo, umenu;

procedure TFrmEntrarUsuario.LblMensagemClick(Sender: TObject);
begin

end;

procedure TFrmEntrarUsuario.pncentroClick(Sender: TObject);
begin

end;

procedure TFrmEntrarUsuario.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEntrarUsuario.BtnEntrarClick(Sender: TObject);
begin
  if (EdtUsuario.Text = '') or (EdtSenha.Text = '') then
  begin
    LblMensagem.Caption := '*CAMPOS FALTANDO*';
  end
  else
  begin
    DM.ZQConsUsuario.Close;
    DM.ZQConsUsuario.SQL.Clear;
    DM.ZQConsUsuario.SQL.Add('select * from usuario where usulogin=' + QuotedStr(EdtUsuario.Text) + 'and ususenha=' + QuotedStr(EdtSenha.Text));
    DM.ZQConsUsuario.Open;
    if ((EdtUsuario.Text <> DM.ZQConsUsuarioUSULOGIN.Value) and (EdtSenha.Text <> DM.ZQConsUsuarioUSUSENHA.Value)) then
    begin
      ShowMessage('*USUARIO OU SENHA ERRADOS*');
    end
    else
    if (DM.ZQConsUsuarioUSUSTATUS.Value <> 1) then
    begin
       ShowMessage('*USUARIO INATIVO*');
    end
    else
    if (DM.ZQConsUsuario.RecordCount = 1) then
    begin
      LblMensagem.Caption := '*Campos Obrigatorios!';
      //aqui ao logar o nome do usuari aparecera no menu de entrada
      usuarios := DM.ZQConsUsuarioUSUNOME.AsString;
      //aqui esta atribuindo o codigo do usuario para como "indentidade" para uso de outros frorms
      indentidade:= DM.ZQConsUsuarioUSUCODIGO.AsInteger;
      acesso:= DM.ZQConsUsuarioCODIGONIV.AsInteger;
      FrmMenu.Show;
    end;
  end;
end;

procedure TFrmEntrarUsuario.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntrarUsuario.ChkMostrarChange(Sender: TObject);
begin
  if (ChkMostrar.Checked = True) then
  begin
    EdtSenha.PasswordChar := #0;
  end
  else if (ChkMostrar.Checked = False) then
  begin
    EdtSenha.PasswordChar := '*';
  end;
end;

procedure TFrmEntrarUsuario.EdtSenhaKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  begin
       BtnEntrar.Click;
  end;
end;

procedure TFrmEntrarUsuario.EdtUsuarioChange(Sender: TObject);
begin


end;

procedure TFrmEntrarUsuario.EdtUsuarioKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  begin
    EdtSenha.setfocus;
  end;
end;

procedure TFrmEntrarUsuario.FormCreate(Sender: TObject);
begin

end;

procedure TFrmEntrarUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmEntrarUsuario.Image1Click(Sender: TObject);
begin

end;

end.
