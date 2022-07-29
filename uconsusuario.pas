unit UConsUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmConsUsuario }

  TFrmConsUsuario = class(TForm)
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnConsulta: TSpeedButton;
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  FrmConsUsuario: TFrmConsUsuario;

implementation

{$R *.lfm}

{ TFrmConsUsuario }

procedure TFrmConsUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

end.

