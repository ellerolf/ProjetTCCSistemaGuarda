unit uConsCentro;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids;

type

  { TFrmConsCentro }

  TFrmConsCentro = class(TForm)
    CboStatus: TComboBox;
    CboTipo: TComboBox;
    DBGrid1: TDBGrid;
    EdtNome1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  FrmConsCentro: TFrmConsCentro;

implementation

{$R *.lfm}

{ TFrmConsCentro }

procedure TFrmConsCentro.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

end.

