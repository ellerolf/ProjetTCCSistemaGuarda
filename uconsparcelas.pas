unit UConsParcelas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  Buttons;

type

  { TFrmConsParcelas }

  TFrmConsParcelas = class(TForm)
    BtnSair: TSpeedButton;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    procedure BtnSairClick(Sender: TObject);
  private

  public

  end;

var
  FrmConsParcelas: TFrmConsParcelas;

implementation

{$R *.lfm}

{ TFrmConsParcelas }

procedure TFrmConsParcelas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.

