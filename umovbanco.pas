unit UMovBanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, EditBtn, DBGrids;

type

  { TFrmMovBanco }

  TFrmMovBanco = class(TForm)
    DTInicial: TDateEdit;
    DtFinal: TDateEdit;
    DBGridExtrato: TDBGrid;
    EdtNConta: TEdit;
    EdtNomeDaConta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnPesqConta: TSpeedButton;
    BtnPesquisar: TSpeedButton;
    BtnImprimir: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BtnSair: TSpeedButton;
    procedure BtnPesqContaClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtNContaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
        CodDaConta:Integer;
        NomeDaConta:String;
        //Essa variável é utilizada para que o ubuscaconta identifica qual tela que está
        //solicitando ela.
        MovBanc:String;
  end;

var
  FrmMovBanco: TFrmMovBanco;

implementation

{$R *.lfm}

{ TFrmMovBanco }

uses UBuscaConta,UModulo;

procedure TFrmMovBanco.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmMovBanco.FormShow(Sender: TObject);
begin
     dm.ZQConsExtrato.Active:=True;
end;

procedure TFrmMovBanco.BtnPesqContaClick(Sender: TObject);
begin
     MovBanc:='Aberto';
     FrmBuscaConta.ShowModal;
end;

procedure TFrmMovBanco.BtnPesquisarClick(Sender: TObject);
begin
     if (EdtNConta.Text='')then
     begin
          ShowMessage('Digite o número da conta para efetuar a pesquisa');
     end
     else if (DTInicial.Date=NullDate) or (DtFinal.Date=NullDate) then
     begin
          ShowMessage('É necessário preencher a data inicial e final do período para efetuar a pesquisa!');
     end
     else
     begin
          if (strtoint(EdtNConta.Text)>1) then
          begin
               with dm.ZQConsExtrato do
               begin
                    Close ;
                    sql.Clear;
                    SQL.Add('SELECT * FROM vwextrato where conta=:codconta AND  data BETWEEN :dtinicial and :dtfinal');
                    ParamByName('dtinicial').Value:=FormatDateTime('yyyy-mm-dd',DTInicial.Date);
                    ParamByName('dtfinal').Value:=FormatDateTime('yyyy-mm-dd',DtFinal.Date);
                    ParamByName('codconta').Value:=EdtNConta.Text;
                    Open;
                    DBGridExtrato.Visible:=True;
               end;
          end;

     end;
end;

procedure TFrmMovBanco.BtnSairClick(Sender: TObject);
begin
     EdtNConta.Text:='';
     EdtNomeDaConta.Text:='';
     DBGridExtrato.Visible:=False;
     DTInicial.Clear;
     DtFinal.Clear;
     close;
end;

procedure TFrmMovBanco.EdtNContaChange(Sender: TObject);
begin
     If(EdtNConta.Text='') then
     begin
          EdtNomeDaConta.Clear;
     end;
end;

procedure TFrmMovBanco.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
     dm.ZQConsExtrato.Active:=False;
end;

end.

