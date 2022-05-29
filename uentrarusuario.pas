unit UEntrarUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFrmEntrarUsuario }

  TFrmEntrarUsuario = class(TForm)
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    BtnEntrar: TSpeedButton;
    procedure LblMensagemClick(Sender: TObject);
  private

  public

  end;

var
  FrmEntrarUsuario: TFrmEntrarUsuario;

implementation

{$R *.lfm}

{ TFrmEntrarUsuario }

procedure TFrmEntrarUsuario.LblMensagemClick(Sender: TObject);
begin

end;

end.

