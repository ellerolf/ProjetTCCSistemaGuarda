unit UForPg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmForPg }

  TFrmForPg = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label10: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure Panel1Click(Sender: TObject);
  private

  public

  end;

var
  FrmForPg: TFrmForPg;

implementation

{$R *.lfm}

{ TFrmForPg }

procedure TFrmForPg.Panel1Click(Sender: TObject);
begin

end;

end.

