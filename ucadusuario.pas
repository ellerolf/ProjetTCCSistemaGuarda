unit uCadUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, LResources;

type

  { TFrmCadUsuario }

  TFrmCadUsuario = class(TForm)
    BtnAdm: TRadioButton;
    BtnAlterar: TSpeedButton;
    BtnOpera: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    ChkMostrar: TCheckBox;
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConfSenha: TEdit;
    EdtConsulta: TEdit;
    EdtNome: TEdit;
    EdtNomeUsuario: TEdit;
    EdtSenha: TEdit;
    GrpNivel: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    BtnConsulta: TSpeedButton;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GrpNivel1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.lfm}

{ TFrmCadUsuario }

procedure TFrmCadUsuario.GrpNivel1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Label1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadUsuario.BtnSalvarClick(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.Panel2Click(Sender: TObject);
begin

end;

end.
