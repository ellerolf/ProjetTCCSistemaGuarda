unit UConsParcelas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  Buttons, UModulo;

type

  { TFrmConsParcelas }

  TFrmConsParcelas = class(TForm)
    BtnSair: TSpeedButton;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Label7Click(Sender: TObject);
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

procedure TFrmConsParcelas.FormActivate(Sender: TObject);
begin
     DM.ZQConsVerParc.Active:=True;
end;

procedure TFrmConsParcelas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   DM.ZQConsVerParc.Active:=False;
end;

procedure TFrmConsParcelas.Label7Click(Sender: TObject);
begin

end;

end.

