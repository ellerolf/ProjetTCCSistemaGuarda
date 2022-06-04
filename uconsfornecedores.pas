unit UConsFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, ComCtrls, DBGrids;

type

  { TFrmConsFornecedores }

  TFrmConsFornecedores = class(TForm)
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
    BtnConsulta: TSpeedButton;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private

  public

  end;

var
  FrmConsFornecedores: TFrmConsFornecedores;

implementation

{$R *.lfm}

{ TFrmConsFornecedores }

procedure TFrmConsFornecedores.Label8Click(Sender: TObject);
begin

end;

procedure TFrmConsFornecedores.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsFornecedores.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

end.

