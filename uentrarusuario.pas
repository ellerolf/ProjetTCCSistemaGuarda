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
    Panel1: TPanel;
    BtnEntrar: TSpeedButton;
    procedure BtnEntrarClick(Sender: TObject);
    procedure ChkMostrarChange(Sender: TObject);
    procedure LblMensagemClick(Sender: TObject);
  private

  public
   usuarios:string;
  end;

var
  FrmEntrarUsuario: TFrmEntrarUsuario;

implementation

{$R *.lfm}

{ TFrmEntrarUsuario }
  uses UModulo,umenu;
procedure TFrmEntrarUsuario.LblMensagemClick(Sender: TObject);
begin

end;

procedure TFrmEntrarUsuario.BtnEntrarClick(Sender: TObject);
begin
   if (EdtUsuario.Text= '') or (EdtSenha.Text='')then
   begin
     LblMensagem.Caption:='*CAMPOS FALTANDO*';
   end
   else
   begin
     DM.ZQConsUsuario.Close;
     DM.ZQConsUsuario.SQL.Clear;
     DM.ZQConsUsuario.SQL.Add('select * from usuario where usulogin='+QuotedStr(EdtUsuario.Text)+'and ususenha='+QuotedStr(EdtSenha.Text));
     DM.ZQConsUsuario.Open;
     if (DM.ZQConsUsuario.RecordCount=1) then
     begin
       LblMensagem.Caption:='*Campos Obrigatorios!';
       usuarios:=DM.ZQConsUsuarioUSUNOME.AsString;
       FrmMenu.show;
     end
     else
     begin
      ShowMessage('*USUARIO OU SENHA ERRADOS*');
     end;

   end;
end;

procedure TFrmEntrarUsuario.ChkMostrarChange(Sender: TObject);
begin
  if (ChkMostrar.Checked=True)then
   begin
     EdtSenha.PasswordChar:=#0;
   end
  else if (ChkMostrar.Checked=False)then
   begin
     EdtSenha.PasswordChar:='*';
   end;
end;

end.

