unit uCadCentroCusto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids;

type

  { TFrmCadCentroCusto }

  TFrmCadCentroCusto = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboTipo: TComboBox;
    CboTipo1: TComboBox;
    DBGrid1: TDBGrid;
    EdtNome: TEdit;
    EdtNome1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadCentroCusto: TFrmCadCentroCusto;

implementation

{$R *.lfm}

{ TFrmCadCentroCusto }

procedure TFrmCadCentroCusto.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCentroCusto.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadCentroCusto.Label4Click(Sender: TObject);
begin

end;

procedure TFrmCadCentroCusto.Label7Click(Sender: TObject);
begin

end;

end.
