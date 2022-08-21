unit UBuscaDoc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, UModulo;

type

  { TFrmBuscaDoc }

  TFrmBuscaDoc = class(TForm)
    DBGrid1: TDBGrid;
    EdtBuscaTipoDoc: TEdit;
    Panel1: TPanel;
    BtnBuscaTipoDoc: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnSelecionar: TSpeedButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmBuscaDoc: TFrmBuscaDoc;

implementation

{$R *.lfm}

{ TFrmBuscaDoc }
uses uCadLancamento;

procedure TFrmBuscaDoc.BtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBuscaDoc.BtnSelecionarClick(Sender: TObject);
begin
  FrmCadLancamento.EdtTipoDocumento.Text:=DM.ZQBuscaTipoDocDOCCODIGO.AsString;
  Close;
end;

procedure TFrmBuscaDoc.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    DM.ZQBuscaTipoDoc.Active:=False;
end;

procedure TFrmBuscaDoc.FormShow(Sender: TObject);
begin
  DM.ZQBuscaTipoDoc.Active:=True;
end;

end.
