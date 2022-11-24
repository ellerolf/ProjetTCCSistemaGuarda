unit UMovBanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, EditBtn, DBGrids;

type

  { TFrmMovBanco }

  TFrmMovBanco = class(TForm)
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  FrmMovBanco: TFrmMovBanco;

implementation

{$R *.lfm}

{ TFrmMovBanco }

procedure TFrmMovBanco.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

end.

