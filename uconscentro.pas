unit uConsCentro;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids, Buttons;

type

  { TFrmConsCentro }

  TFrmConsCentro = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnConsulta: TSpeedButton;
    BtnSair: TSpeedButton;
    CboStatus: TComboBox;
    CboTipo: TComboBox;
    DBGrid1: TDBGrid;
    EdtNome1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSelecione: TSpeedButton;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSelecioneClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtNome1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    cencodigo:integer;
  end;

var
  FrmConsCentro: TFrmConsCentro;

implementation

{$R *.lfm}

{ TFrmConsCentro }
  uses uCadCentroCusto,UModulo,uCadLancamento,UConsBaixa;

procedure TFrmConsCentro.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmConsCentro.FormShow(Sender: TObject);
begin
  DM.ZQBuscaCentro.open;
end;

procedure TFrmConsCentro.BtnSairClick(Sender: TObject);
begin
  if(FrmCadLancamento.AcionaBtnPesqCen='ativa') then
  begin
    //após pegar o valor do centro de custo, os códigos abaixo foi feito para limpar essa tela, e o último para fechar o form
    BtnSelecione.Visible:=False;
    CboTipo.ItemIndex:=0;
    CboStatus.ItemIndex:=0;
    CboTipo.Enabled:=True;
    CboStatus.Enabled:=True;
    FrmCadLancamento.AcionaBtnPesqCen:='';
    //Foi necessário colocar o código abaixo, pq quando a pessoa entrava em lançamento e saia, e depois abria conscentro,
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
    dm.ZQBuscaCentro.Close;
    cencodigo:=0;
    FrmConsCentro.Close;
  end;
  //codigo para quando o usuario acessa pelo cons baixa
  if(FrmConsBaixa.acionaPesqCenCustConsBaix='Consbaixa') then
  begin
    //após pegar o valor do centro de custo, os códigos abaixo foi feito para limpar essa tela, e o último para fechar o form
    BtnSelecione.Visible:=False;
    CboTipo.ItemIndex:=0;
    CboStatus.ItemIndex:=0;
    CboTipo.Enabled:=True;
    CboStatus.Enabled:=True;
    FrmConsBaixa.acionaPesqCenCustConsBaix:='Consbaixa';
    //Foi necessário colocar o código abaixo, pq quando a pessoa entrava em lançamento e saia, e depois abria conscentro,
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
    dm.ZQBuscaCentro.Close;
    cencodigo:=0;
    FrmConsCentro.Close;
  end;
  Close;
end;

procedure TFrmConsCentro.BtnSelecioneClick(Sender: TObject);
begin
  if(FrmCadLancamento.AcionaBtnPesqCen='ativa') then
  begin
       if (cencodigo>0) then
       begin
            FrmCadLancamento.EdtConsCentro.Caption:=IntToStr(cencodigo);
            BtnSelecione.Visible:=False;
            CboTipo.ItemIndex:=0;
            CboStatus.ItemIndex:=0;
            CboTipo.Enabled:=True;
            CboStatus.Enabled:=True;
            FrmCadLancamento.AcionaBtnPesqCen:='';

            DM.ZQBuscaCentro.SQL.Clear;
            DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
            DM.ZQBuscaCentro.Open;
            dm.ZQBuscaCentro.Close;
            cencodigo:=0;
            FrmConsCentro.Close;
       end;

    //após pegar o valor do centro de custo, os códigos abaixo foi feito para limpar essa tela, e o último para fechar o form
    BtnSelecione.Visible:=False;
    CboTipo.ItemIndex:=0;
    CboStatus.ItemIndex:=0;
    CboTipo.Enabled:=True;
    CboStatus.Enabled:=True;
    FrmCadLancamento.AcionaBtnPesqCen:='';
    //Foi necessário colocar o código abaixo, pq quando a pessoa entrava em lançamento e saia, e depois abria conscentro,
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
    dm.ZQBuscaCentro.Close;
    FrmConsCentro.Close;
  end;

  //codigo abaixo é para quando ele selecione o centro de custo para tela de consbaixa

  if(FrmConsBaixa.acionaPesqCenCustConsBaix='Consbaixa') then
  begin
       if (cencodigo>0) then
       begin
            FrmConsBaixa.EdtConsCentro.Caption:=IntToStr(cencodigo);
            BtnSelecione.Visible:=False;
            CboTipo.ItemIndex:=0;
            CboStatus.ItemIndex:=0;
            CboTipo.Enabled:=True;
            CboStatus.Enabled:=True;
            FrmConsBaixa.acionaPesqCenCustConsBaix:='';

            DM.ZQBuscaCentro.SQL.Clear;
            DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
            DM.ZQBuscaCentro.Open;
            dm.ZQBuscaCentro.Close;
            cencodigo:=0;
            FrmConsCentro.Close;
       end;

    //após pegar o valor do centro de custo, os códigos abaixo foi feito para limpar essa tela, e o último para fechar o form
    BtnSelecione.Visible:=False;
    CboTipo.ItemIndex:=0;
    CboStatus.ItemIndex:=0;
    CboTipo.Enabled:=True;
    CboStatus.Enabled:=True;
    FrmConsBaixa.acionaPesqCenCustConsBaix:='';
    //Foi necessário colocar o código abaixo, pq quando a pessoa entrava atraves do consbaixa e saia, e depois abria conscentro,
    //Os campos aparecia habilitado mas a dbgrid estava com os dados da tela de lançamento. Com o ajuste abaixo isso foi resolvido
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
    dm.ZQBuscaCentro.Close;
    FrmConsCentro.Close;
  end;
end;

procedure TFrmConsCentro.DBGrid1CellClick(Column: TColumn);
begin
  cencodigo:=DM.ZQBuscaCentroCENCODIGO.AsInteger;
end;

procedure TFrmConsCentro.EdtNome1Change(Sender: TObject);
begin

end;

procedure TFrmConsCentro.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DM.ZQBuscaCentro.Close;
end;

procedure TFrmConsCentro.BtnAlterarClick(Sender: TObject);
begin
  FrmCadCentroCusto.CadOUAlt:='A';
  FrmCadCentroCusto.Show;
  FrmCadCentroCusto.codigo:=cencodigo;
  FrmCadCentroCusto.EdtNome.Text := DM.ZQBuscaCentroCENNOME.AsString;
  if (DM.ZQBuscaCentroCODIGOTIP.Value = 1) then
  begin
    FrmCadCentroCusto.RgbTipo.ItemIndex := 0;
  end
  else
  if (DM.ZQBuscaCentroCODIGOTIP.Value = 2) then
  begin
    FrmCadCentroCusto.RgbTipo.ItemIndex := 1;
  end;

  FrmCadCentroCusto.RgbStatus.Visible := True;

  if (DM.ZQBuscaCentroCENSTATUS.Value = 1) then
  begin
    FrmCadCentroCusto.RgbStatus.ItemIndex := 0;
  end
  else
  if (DM.ZQBuscaCentroCENSTATUS.Value=0) then
  begin
    FrmCadCentroCusto.RgbStatus.ItemIndex:=1;
  end;
end;

procedure TFrmConsCentro.BtnConsultaClick(Sender: TObject);
begin
  //Quando não tiver valor especifico
  if (CboTipo.ItemIndex = 0) and (CboStatus.ItemIndex = 0) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  //quando tipo for nada e status for ativo(1)
  if (CboTipo.ItemIndex = 0) and (CboStatus.ItemIndex = 1) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where censtatus=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  //Quando tipo for nada e status for inativo(2)
  if (CboTipo.ItemIndex = 0) and (CboStatus.ItemIndex = 2) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where censtatus=0 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  // quando for tipo receita(1) e qualquer status
  if (CboTipo.ItemIndex = 1) and (CboStatus.ItemIndex = 0) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  // quando for tipo receita(1) e status ativo(1)
  if (CboTipo.ItemIndex = 1) and (CboStatus.ItemIndex = 1) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=1 and censtatus=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  // quando for tipo receita(1) e status inativo(2)
  if (CboTipo.ItemIndex = 1) and (CboStatus.ItemIndex = 2) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=1 and censtatus=0 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  // quando for tipo despeza(2) e qualquer status
  if (CboTipo.ItemIndex = 2) and (CboStatus.ItemIndex = 0) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=2 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else

  // quando for tipo despeza(2) e status ativo(1)
  if (CboTipo.ItemIndex = 2) and (CboStatus.ItemIndex = 1) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=2 and censtatus=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  // quando for tipo despeza(2) e status inativo(2)
  if (CboTipo.ItemIndex = 2) and (CboStatus.ItemIndex = 2) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=2 and censtatus=0 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end;

end;

end.

