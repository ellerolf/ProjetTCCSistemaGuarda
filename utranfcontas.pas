unit UTranfContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, EditBtn, DateTimePicker, UModulo,uCadContasBancarias;

type

  { TFrmTranfContas }

  TFrmTranfContas = class(TForm)
    BtnCancela: TSpeedButton;
    BtnSeleciona: TSpeedButton;
    CboStatus: TComboBox;
    DTFinal: TDateEdit;
    DTInicial: TDateEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnImprimir: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private

  public
        //Essa variável recebe o código da transferencia ao clicar na dbgrid.
        CodigoDaTransf:Integer;
        //Essa variável recebe o status da transferencia.
        StatusDaTransf:Integer;
  end;

var
  FrmTranfContas: TFrmTranfContas;

implementation

{$R *.lfm}

uses urltransferencia;

{ TFrmTranfContas }

procedure TFrmTranfContas.BtnSelecioneClick(Sender: TObject);
begin

end;

procedure TFrmTranfContas.DBGrid1CellClick(Column: TColumn);
begin
     CodigoDaTransf:=dm.ZQConsTransferenciaTRACODIGO.AsInteger;
     StatusDaTransf:=dm.ZQConsTransferenciaTRASTATUS.AsInteger;
end;

procedure TFrmTranfContas.BtnSelecionaClick(Sender: TObject);
begin
  FrmCadContasBancarias.OpecadOuAltTransf:='U';
  if (CodigoDaTransf>0) then
  begin

       //se o status da transferência for 0(inativo)
       if (dm.ZQConsTransferenciaTRASTATUS.AsInteger=0) then
       begin
            FrmCadContasBancarias.RdbCadConta.Enabled:=False;
            FrmCadContasBancarias.RdbCadTrans.Checked:=true;
            FrmCadContasBancarias.RdbCadTrans.Caption:='Alteração da Transferência';
            FrmCadContasBancarias.RGBStatusTransf.Visible:=True;
            FrmCadContasBancarias.RGBStatusTransf.ItemIndex:=0;
            FrmCadContasBancarias.DtDataTransf.Date:=DM.ZQConsTransferenciaTRADATA.AsDateTime;
            FrmCadContasBancarias.EdtNDoc.Text:=DM.ZQConsTransferenciaTRANUMERO_DOCUMENTO.Text;
            FrmCadContasBancarias.EdtVlrTras.Text:=FormatFloat('0.00',dm.ZQConsTransferenciaTRAVALOR.AsFloat);
            FrmCadContasBancarias.EdtCodContaO.Text:=dm.ZQConsTransferenciaCODIGODACONTADEORIGEM.Text;
            FrmCadContasBancarias.EdtCodContaDes.Text:=dm.ZQConsTransferenciaCODIGODACONTADEDESTINO.Text;
            FrmCadContasBancarias.Show;
       end;

       // se o status da transferência for 1(ativo)
       if (dm.ZQConsTransferenciaTRASTATUS.AsInteger=1) then
       begin
            FrmCadContasBancarias.RdbCadConta.Enabled:=False;
            FrmCadContasBancarias.RdbCadTrans.Checked:=true;
            FrmCadContasBancarias.RdbCadTrans.Caption:='Alteração da Transferência';
            FrmCadContasBancarias.RGBStatusTransf.Visible:=True;
            FrmCadContasBancarias.RGBStatusTransf.ItemIndex:=1;
            FrmCadContasBancarias.DtDataTransf.Date:=DM.ZQConsTransferenciaTRADATA.AsDateTime;
            FrmCadContasBancarias.EdtNDoc.Text:=DM.ZQConsTransferenciaTRANUMERO_DOCUMENTO.Text;
            FrmCadContasBancarias.EdtVlrTras.Text:=FormatFloat('0.00',dm.ZQConsTransferenciaTRAVALOR.AsFloat);
            FrmCadContasBancarias.EdtCodContaO.Text:=dm.ZQConsTransferenciaCODIGODACONTADEORIGEM.Text;
            FrmCadContasBancarias.EdtCodContaDes.Text:=dm.ZQConsTransferenciaCODIGODACONTADEDESTINO.Text;
            FrmCadContasBancarias.Show;
       end;
  end;


end;

procedure TFrmTranfContas.BtnCancelaClick(Sender: TObject);
begin
  DTFinal.Clear;
  DTInicial.Clear;
  DBGrid1.Visible:=False;
  CboStatus.ItemIndex:=0;
  CodigoDaTransf:=0;
  SpeedButton3.Click;
  Close;
end;

procedure TFrmTranfContas.BtnImprimirClick(Sender: TObject);
begin
     if (CboStatus.ItemIndex>=0) then
     Begin
          if (dm.ZQConsTransferencia.RecordCount>0) then
          begin
              FrmRlTransferencia.RLTransferencia.Preview();
          end;
     end;
end;

procedure TFrmTranfContas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQConsTransferencia.Active:=False;
end;

procedure TFrmTranfContas.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmTranfContas.FormShow(Sender: TObject);
begin
  dm.ZQConsTransferencia.Active:=True;
end;

procedure TFrmTranfContas.Panel1Resize(Sender: TObject);
begin

end;

procedure TFrmTranfContas.SpeedButton3Click(Sender: TObject);
begin
     if (DTInicial.Date=NullDate) or (DTFinal.date=NullDate) then
     begin
          ShowMessage('Digite as data inicial e final para efetuar a pesquisa');
     end
     else if (DTFinal.Date<DTInicial.Date) then
     begin
          ShowMessage('Período pesquisado não é valido, digite novamente');
          DBGrid1.Visible:=False;
          DTFinal.Clear;
          DTInicial.Clear;
     end
     Else
         begin
               if (CboStatus.ItemIndex=0) then
               begin
                with dm.ZQConsTransferencia do
                begin
                     Close ;
                     sql.Clear;
                     SQL.Add('SELECT * FROM vwtransferencia WHERE TRADATA between :dtini and :dtfin');
                     ParamByName('dtini').Value:=FormatDateTime('yyyy-mm-dd',DTInicial.Date);
                     ParamByName('dtfin').Value:=FormatDateTime('yyyy-mm-dd',DTFinal.Date);
                     Open;
                     DBGrid1.Visible:=True;
                end;
               end;

               if (CboStatus.ItemIndex=1) then
               begin
                with dm.ZQConsTransferencia do
                begin
                     Close;
                     sql.Clear;
                     SQL.Add('SELECT * FROM vwtransferencia WHERE TRASTATUS=1 and TRADATA between :dtini and :dtfin');
                     ParamByName('dtini').Value:=FormatDateTime('yyyy-mm-dd',DTInicial.Date);
                     ParamByName('dtfin').Value:=FormatDateTime('yyyy-mm-dd',DTFinal.Date);
                     Open;
                     DBGrid1.Visible:=True;
                end;
               end;

                if (CboStatus.ItemIndex=2) then
               begin
                with dm.ZQConsTransferencia do
                begin
                     Close ;
                     sql.Clear;
                     SQL.Add('SELECT * FROM vwtransferencia WHERE TRASTATUS=0 and TRADATA between :dtini and :dtfin');
                     ParamByName('dtini').Value:=FormatDateTime('yyyy-mm-dd',DTInicial.Date);
                     ParamByName('dtfin').Value:=FormatDateTime('yyyy-mm-dd',DTFinal.Date);
                     Open;
                     DBGrid1.Visible:=True;
                end;
               end;
         end;
end;

  {//todas trasnferência
  if (CboStatus.ItemIndex=0) then
  begin
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.SQL.Clear;
    dm.ZQConsTransferencia.SQL.Add('SELECT * from transferencia');
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.open;
  end
  Else
  //todas transferência ativa
  if (CboStatus.ItemIndex=1) then
  begin
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.SQL.Clear;
    dm.ZQConsTransferencia.SQL.Add('SELECT * from transferencia where trastatus=1');
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.open;
  end
  Else
  //todas transferência inativa
  begin
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.SQL.Clear;
    dm.ZQConsTransferencia.SQL.Add('SELECT * from transferencia where trastatus=0');
    dm.ZQConsTransferencia.close;
    dm.ZQConsTransferencia.open;
  end;
end; }

end.

