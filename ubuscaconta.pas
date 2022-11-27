unit UBuscaConta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids,UModulo;

type

  { TFrmBuscaConta }

  TFrmBuscaConta = class(TForm)
    BtnConsulta: TSpeedButton;
    BtnSelecione: TSpeedButton;
    BtnSelecione1: TSpeedButton;
    DBGCaixa: TDBGrid;
    DBGContasBanc: TDBGrid;
    EdtConsulta: TEdit;
    Label7: TLabel;
    Panel1: TPanel;
    RGBTipoConta: TRadioGroup;
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSelecione1Click(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
    procedure DBGCaixaCellClick(Column: TColumn);
    procedure DBGContasBancCellClick(Column: TColumn);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RGBTipoContaChangeBounds(Sender: TObject);
    procedure RGBTipoContaClick(Sender: TObject);
  private

  public

  end;

var
  FrmBuscaConta: TFrmBuscaConta;

implementation

{$R *.lfm}

{ TFrmBuscaConta }
uses uCadContasBancarias, UbaixaParcela, UMovBanco;

procedure TFrmBuscaConta.BtnSelecione1Click(Sender: TObject);
begin
     FrmCadContasBancarias.AcionaBtnD:='';
     FrmCadContasBancarias.AcionaBtnO:='';
     FRMBaixaParcela.acionaConsConta:='';
     FrmMovBanco.MovBanc:='';

     FrmMovBanco.CodDaConta:=0;
     FrmMovBanco.NomeDaConta:='';
     FrmMovBanco.saldoInicial:=0;

     EdtConsulta.Clear;
     RGBTipoConta.ItemIndex:=-1;
     DBGCaixa.Visible:=False;
     DBGContasBanc.Visible:=False;
     close;
end;

procedure TFrmBuscaConta.BtnConsultaClick(Sender: TObject);
begin
  if (RGBTipoConta.ItemIndex=0) then
  begin
    dm.ZQBuscaConta.Close;
    dm.ZQBuscaConta.SQL.Clear;
    dm.ZQBuscaConta.SQL.Add('select * from vwcontas where CODIGOTIP=3 AND CONNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
    DM.ZQBuscaConta.Open;
  end
  Else If (RGBTipoConta.ItemIndex=1) then
  begin
    dm.ZQBuscaConta.Close;
    dm.ZQBuscaConta.SQL.Clear;
    dm.ZQBuscaConta.SQL.Add('select * from vwcontas where CODIGOTIP<3 AND CONNOME LIKE'+QuotedStr('%'+EdtConsulta.Text+'%'));
    DM.ZQBuscaConta.Open;
  end;


end;

procedure TFrmBuscaConta.BtnSelecioneClick(Sender: TObject);
begin
  If(FrmCadContasBancarias.AcionaBtnO='o') then
  begin
       if (FrmCadContasBancarias.ContaSelecionada>0) then
       begin
            FrmCadContasBancarias.EdtCodContaO.Text:=IntToStr(FrmCadContasBancarias.ContaSelecionada);
            FrmCadContasBancarias.ContaSelecionada:=0;
            RGBTipoConta.ItemIndex:=-1;
            DBGCaixa.Visible:=False;
            DBGContasBanc.Visible:=False;
            EdtConsulta.Clear;

            FrmCadContasBancarias.AcionaBtnO:='';
            FrmBuscaConta.close;
       end;
       FrmCadContasBancarias.AcionaBtnO:='';
       EdtConsulta.Clear;
       FrmBuscaConta.close;
  end;

  If(FrmCadContasBancarias.AcionaBtnD='d') then
  begin
       if (FrmCadContasBancarias.ContaSelecionada>0) then
       begin
            FrmCadContasBancarias.EdtCodContaDes.Text:=IntToStr(FrmCadContasBancarias.ContaSelecionada);
            FrmCadContasBancarias.ContaSelecionada:=0;
            RGBTipoConta.ItemIndex:=-1;
            DBGCaixa.Visible:=False;
            DBGContasBanc.Visible:=False;
            EdtConsulta.Clear;

            FrmCadContasBancarias.AcionaBtnD:='';
            FrmBuscaConta.close;
       end;
       FrmCadContasBancarias.AcionaBtnD:='';
       EdtConsulta.Clear;
       FrmBuscaConta.close;
  end;

  if(FRMBaixaParcela.acionaConsConta='aciona') then
  begin
       if (FRMBaixaParcela.codigoDaContaSelecionada>0) then
       begin
            FRMBaixaParcela.EdtContaBancaria.Text:=IntToStr(FRMBaixaParcela.codigoDaContaSelecionada);
            FRMBaixaParcela.acionaConsConta:='';
            RGBTipoConta.ItemIndex:=-1;
            DBGCaixa.Visible:=False;
            DBGContasBanc.Visible:=False;
            FRMBaixaParcela.codigoDaContaSelecionada:=0;
            EdtConsulta.Clear;
            FrmBuscaConta.close;
       end;
       FRMBaixaParcela.acionaConsConta:='';
       RGBTipoConta.ItemIndex:=-1;
       EdtConsulta.Clear;
       DBGCaixa.Visible:=False;
       DBGContasBanc.Visible:=False;
       FrmBuscaConta.close;
  end;
   if (FrmMovBanco.MovBanc='Aberto') then
   begin
        if (FrmMovBanco.CodDaConta>0) then
        begin
             FrmMovBanco.EdtNConta.Text:=IntToStr(FrmMovBanco.CodDaConta);
             FrmMovBanco.EdtNomeDaConta.Text:=FrmMovBanco.NomeDaConta;
             RGBTipoConta.ItemIndex:=-1;
             DBGCaixa.Visible:=False;
             DBGContasBanc.Visible:=False;
             //FrmMovBanco.CodDaConta:=0;
             FrmMovBanco.NomeDaConta:='';
             EdtConsulta.Clear;
             FrmBuscaConta.close;
        end;
        FrmMovBanco.MovBanc:='';
        RGBTipoConta.ItemIndex:=-1;
        EdtConsulta.Clear;
        DBGCaixa.Visible:=False;
        DBGContasBanc.Visible:=False;
        FrmBuscaConta.close;

   end;
end;

procedure TFrmBuscaConta.DBGCaixaCellClick(Column: TColumn);
begin
     if(FRMBaixaParcela.acionaConsConta='aciona') then
     begin
          FRMBaixaParcela.codigoDaContaSelecionada:=dm.ZQBuscaContaCONCODIGO.AsInteger;
     end;

     if (FrmCadContasBancarias.AcionaBtnO='o') or (FrmCadContasBancarias.AcionaBtnD='d') then
     begin
          FrmCadContasBancarias.ContaSelecionada:=dm.ZQBuscaContaCONCODIGO.AsInteger;
     end;

     if (FrmMovBanco.MovBanc='Aberto') then
     begin
          FrmMovBanco.CodDaConta:=dm.ZQBuscaContaCONCODIGO.AsInteger;
          FrmMovBanco.NomeDaConta:=dm.ZQBuscaContaCONNOME.AsString;
          FrmMovBanco.saldoInicial:=dm.ZQBuscaContaCONSALDO_INICIAL.AsFloat;
     end;
end;

procedure TFrmBuscaConta.DBGContasBancCellClick(Column: TColumn);
begin
     if(FRMBaixaParcela.acionaConsConta='aciona') then
     begin
          FRMBaixaParcela.codigoDaContaSelecionada:=dm.ZQBuscaContaCONCODIGO.AsInteger;
     end;

     if (FrmCadContasBancarias.AcionaBtnO='o') or (FrmCadContasBancarias.AcionaBtnD='d') then
     begin
          FrmCadContasBancarias.ContaSelecionada:=dm.ZQBuscaContaCONCODIGO.AsInteger;
     end;

     if (FrmMovBanco.MovBanc='Aberto') then
     begin
          FrmMovBanco.CodDaConta:=dm.ZQBuscaContaCONCODIGO.AsInteger;
          FrmMovBanco.NomeDaConta:=dm.ZQBuscaContaCONNOME.AsString;
          FrmMovBanco.saldoInicial:=dm.ZQBuscaContaCONSALDO_INICIAL.AsFloat;
     end;
end;

procedure TFrmBuscaConta.EdtConsultaChange(Sender: TObject);
begin

end;

procedure TFrmBuscaConta.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dm.ZQBuscaConta.Active:=false;
  dm.ZQConsTipoConta.Active:=false;
end;

procedure TFrmBuscaConta.FormShow(Sender: TObject);
begin
  dm.ZQBuscaConta.Active:=true;
  dm.ZQConsTipoConta.Active:=true;
end;

procedure TFrmBuscaConta.RGBTipoContaChangeBounds(Sender: TObject);
begin

end;

procedure TFrmBuscaConta.RGBTipoContaClick(Sender: TObject);
begin
   if (RGBTipoConta.ItemIndex=0) then
  begin
    EdtConsulta.Clear;
    DBGCaixa.Visible:=true;
    DBGContasBanc.Visible:=false;
    DM.ZQBuscaConta.Close;
    DM.ZQBuscaConta.SQL.Clear;
    DM.ZQBuscaConta.SQL.Add('SELECT * from vwcontas WHERE CONSTATUS=1 AND CODIGOTIP=3');
    DM.ZQBuscaConta.Open;
  end
  else
  if(RGBTipoConta.ItemIndex=1) then
  begin
    EdtConsulta.Clear;
    DBGCaixa.Visible:=false;
    DBGContasBanc.Visible:=true;
    DM.ZQBuscaConta.Close;
    DM.ZQBuscaConta.SQL.Clear;
    DM.ZQBuscaConta.SQL.Add('SELECT * from vwcontas WHERE CONSTATUS=1 AND CODIGOTIP=2 OR CODIGOTIP=1');
    DM.ZQBuscaConta.Open;
  end;
end;

end.

