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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    procedure BtnSairClick(Sender: TObject);
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

end.
