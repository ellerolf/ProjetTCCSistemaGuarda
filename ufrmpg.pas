unit UFrmPg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids;

type

  { TFrmPagamento }

  TFrmPagamento = class(TForm)
    BtnBuscaTipoDoc: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnSelecionar: TSpeedButton;
    DBGrid2: TDBGrid;
    EdtBuscaTipoDoc: TEdit;
    Label7: TLabel;
    Panel1: TPanel;
    procedure BtnBuscaTipoDocClick(Sender: TObject);
    procedure EdtBuscaTipoDocChange(Sender: TObject);
  private

  public

  end;

var
  FrmPagamento: TFrmPagamento;

implementation

{$R *.lfm}

{ TFrmPagamento }

procedure TFrmPagamento.EdtBuscaTipoDocChange(Sender: TObject);
begin

end;

procedure TFrmPagamento.BtnBuscaTipoDocClick(Sender: TObject);
begin

end;

end.

