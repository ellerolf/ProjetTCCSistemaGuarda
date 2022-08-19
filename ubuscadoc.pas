unit UBuscaDoc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmBuscaDoc }

  TFrmBuscaDoc = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
  private

  public

  end;

var
  FrmBuscaDoc: TFrmBuscaDoc;

implementation

{$R *.lfm}

{ TFrmBuscaDoc }

procedure TFrmBuscaDoc.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

end.

