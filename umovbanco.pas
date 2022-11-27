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
    Label4: TLabel;
    Label5: TLabel;
    LblSaldoAnt: TLabel;
    LblValorTotal: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnPesqConta: TSpeedButton;
    BtnPesquisar: TSpeedButton;
    BtnImprimir: TSpeedButton;
    BtnLimpar: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BtnSair: TSpeedButton;
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnPesqContaClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtNContaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LblSaldoAntClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
         //Variável que recebe o valor total (saldo inicial+saldo anterior+ saldo da dbgrid)
         //valortotal:Double;
         //Variável que recebe o valor do saldo anterior da dbgrid.
         //saldoAnterior:Double;
         //variavel que recebe o valor do saldo anterior a data digitada+ saldo inicial
         //saldoTotal:Double;

  public
        CodDaConta:Integer;
        NomeDaConta:String;
        //Essa variável é utilizada para que o ubuscaconta identifica qual tela que está
        //solicitando ela.
        MovBanc:String;
        //Variável que recebe o valor do saldo inicial ao selecionar a conta bancária
        saldoInicial:Double;
        //variavel que recebe o valor do saldo anterior a data digitada+ saldo inicial
        saldoTotal:Double;
        //Variável que recebe o valor total (saldo inicial+saldo anterior+ saldo da dbgrid)
         valortotal:Double;
         //Variável que recebe o valor do saldo anterior da dbgrid.
         saldoAnterior:Double;
         //variavel que recebe o valor do saldo anterior a data digitada+ saldo inicial
         //saldoTotal:Double;
  end;

var
  FrmMovBanco: TFrmMovBanco;

implementation

{$R *.lfm}

{ TFrmMovBanco }

uses UBuscaConta,UModulo, urlmovimbanc;

procedure TFrmMovBanco.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmMovBanco.FormShow(Sender: TObject);
begin
     dm.ZQConsExtrato.Active:=True;
     dm.ZQConsSaldoAnt.Active:=True;
end;

procedure TFrmMovBanco.LblSaldoAntClick(Sender: TObject);
begin

end;

procedure TFrmMovBanco.Panel2Click(Sender: TObject);
begin

end;

procedure TFrmMovBanco.BtnPesqContaClick(Sender: TObject);
begin
     MovBanc:='Aberto';
     FrmBuscaConta.ShowModal;
end;

procedure TFrmMovBanco.BtnLimparClick(Sender: TObject);
begin
     EdtNConta.Clear;
     EdtNomeDaConta.Clear;
end;

procedure TFrmMovBanco.BtnImprimirClick(Sender: TObject);
begin
     if  (EdtNConta.Text='') then
     begin
          ShowMessage('Selecione a conta que deseja exibir o relatório!');
     end
     else if (DTInicial.Date=NullDate) or (DtFinal.Date=NullDate) then
     begin
          ShowMessage('É necessário preencher a data inicial e final do período para efetuar a pesquisa!');
     end
     else if (DtFinal.Date<DTInicial.Date) then
     begin
          ShowMessage('Período pesquisado não é válido, digite novamente');
     end
     else
     begin
          if (dm.ZQConsExtrato.RecordCount>0) then
          begin
               FrmRlMovimBanc.RLMovimBanc.Preview();
          end;


     end;
end;

procedure TFrmMovBanco.BtnPesquisarClick(Sender: TObject);
begin
     //limpando as label e variável antes de receber novo calculo
     DBGridExtrato.Visible:=false;
     LblSaldoAnt.Caption:='';
     LblValorTotal.Caption:='';
     valortotal:=0;
     //saldoInicial:=0;
     saldoAnterior:=0;

     if (EdtNConta.Text='')then
     begin
          ShowMessage('Digite o número da conta para efetuar a pesquisa');
     end
     else if (DTInicial.Date=NullDate) or (DtFinal.Date=NullDate) then
     begin
          ShowMessage('É necessário preencher a data inicial e final do período para efetuar a pesquisa!');
     end
     else if (DtFinal.Date<DTInicial.Date) then
     begin
          ShowMessage('Período pesquisado não é válido, digite novamente');
     end
     else
     begin
          DM.ZQConsSaldoAnt.Close;
          DM.ZQConsSaldoAnt.SQL.Clear;
          DM.ZQConsSaldoAnt.SQL.Add('SELECT sum(VALOR) from vwextrato where conta = '+IntToStr(FrmMovBanco.CodDaConta)+' and data < ''' + FormatDateTime('yyyy-mm-dd',DTInicial.Date) + '''');
          DM.ZQConsSaldoAnt.Open;

          saldoAnterior:=DM.ZQConsSaldoAntsumVALOR.AsFloat;


           //ShowMessage(dm.ZQConsSaldoAnt.SQL.Text);




          saldoTotal:=saldoAnterior+saldoInicial;

          LblSaldoAnt.Caption:=FormatCurr('0.00',saldoTotal);

          if (strtoint(EdtNConta.Text)>0) then
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
               while not dm.ZQConsExtrato.EOF  do
               begin
                    valortotal:=valortotal+dm.ZQConsExtratovalor.AsFloat;
                    dm.ZQConsExtrato.Next;
               end;
               LblValorTotal.Caption:=FormatCurr('0.00',valortotal+saldoTotal);
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
     LblValorTotal.Caption:='';
     LblSaldoAnt.Caption:='';
     valortotal:=0;
     saldoInicial:=0;
     saldoAnterior:=0;
     saldoTotal:=0;
     close;
end;

procedure TFrmMovBanco.EdtNContaChange(Sender: TObject);
begin
     If(EdtNConta.Text<>EdtNConta.Text) then
     begin
          CodDaConta:=0;
     end;
end;

procedure TFrmMovBanco.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
     dm.ZQConsExtrato.Active:=False;
     dm.ZQConsSaldoAnt.Active:=False;
end;

end.

