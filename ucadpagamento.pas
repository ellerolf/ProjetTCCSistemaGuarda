unit UCadPagamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBExtCtrls, Buttons, DBGrids;

type

  { TForm1 }

  TForm1 = class(TForm)
    DTDataLancamento: TDBDateEdit;
    DBGrid1: TDBGrid;
    EdtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LblValor: TLabel;
    Label7: TLabel;
    LblValorRestante: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

