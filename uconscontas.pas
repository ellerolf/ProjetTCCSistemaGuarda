unit UConsContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids;

type

  { TFrmConsContas }

  TFrmConsContas = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  FrmConsContas: TFrmConsContas;

implementation

{$R *.lfm}

{ TFrmConsContas }

procedure TFrmConsContas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsContas.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

end.
