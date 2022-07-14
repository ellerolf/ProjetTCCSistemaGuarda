unit UTranfContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids;

type

  { TFrmTranfContas }

  TFrmTranfContas = class(TForm)
    BtnCancela: TSpeedButton;
    BtnSeleciona: TSpeedButton;
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton3: TSpeedButton;
    procedure BtnSelecioneClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
  private

  public

  end;

var
  FrmTranfContas: TFrmTranfContas;

implementation

{$R *.lfm}

{ TFrmTranfContas }

procedure TFrmTranfContas.BtnSelecioneClick(Sender: TObject);
begin

end;

procedure TFrmTranfContas.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmTranfContas.Panel1Resize(Sender: TObject);
begin

end;

end.

