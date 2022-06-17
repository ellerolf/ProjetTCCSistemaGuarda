unit UBuscaConta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmBuscaConta }

  TFrmBuscaConta = class(TForm)
    BtnConsulta: TSpeedButton;
    BtnSelecione: TSpeedButton;
    BtnSelecione1: TSpeedButton;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    Panel1: TPanel;
    procedure BtnSelecione1Click(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
  private

  public

  end;

var
  FrmBuscaConta: TFrmBuscaConta;

implementation

{$R *.lfm}

{ TFrmBuscaConta }

procedure TFrmBuscaConta.BtnSelecione1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmBuscaConta.BtnSelecioneClick(Sender: TObject);
begin

end;

end.

