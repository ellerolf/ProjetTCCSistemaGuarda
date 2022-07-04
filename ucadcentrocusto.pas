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
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtNome: TEdit;
    EdtNome1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RgbStatus: TRadioGroup;
    RgbTipo: TRadioGroup;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtNome1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadCentroCusto: TFrmCadCentroCusto;

implementation

{$R *.lfm}

{ TFrmCadCentroCusto }
uses UModulo;

procedure TFrmCadCentroCusto.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCentroCusto.BtnAlterarClick(Sender: TObject);
begin
  if (EdtNome.Text='') or (RgbTipo.ItemIndex=-1) or (RgbStatus.ItemIndex=-1) then
  begin
     LblMensagem.Caption:='CAMPOS FALTANDO';
  end
  else
  begin
    RgbStatus.Visible := True;

    DM.ZQAltCentro.Params.ParamByName('pcennome').Value := EdtNome.Text;
    if (RgbTipo.ItemIndex = 0) then
    begin
      DM.ZQAltCentro.Params.ParamByName('pcodigotip').Value := 1;
    end
    else
      if (RgbTipo.ItemIndex = 1) then
      begin
        DM.ZQAltCentro.Params.ParamByName('pcodigotip').Value := 2;
      end;

      if (RgbStatus.ItemIndex=0)then
      begin
        DM.ZQAltCentro.Params.ParamByName('pcenstatus').Value:=1;
      end
      else
      if (RgbStatus.ItemIndex=1)then
      begin
        DM.ZQAltCentro.Params.ParamByName('pcenstatus').Value:=0;
      end;
      DM.ZQAltCentro.Params.ParamByName('pcencodigo').Value := DM.ZQConsCentroCENCODIGO.AsInteger;
      DM.ZQAltCentro.ExecSQL;

      DM.ZQConsCentro.Close;
      DM.ZQConsCentro.Open;

      EdtNome.Clear;
      RgbTipo.ItemIndex := -1;
      RgbStatus.ItemIndex:=-1;
      RgbStatus.Visible:=false;
  end;
end;

procedure TFrmCadCentroCusto.BtnSalvarClick(Sender: TObject);
begin
  if(EdtNome.Text='') or (RgbTipo.ItemIndex=-1) then
  begin
    LblMensagem.Caption:='CAMPOS FALTANDO';
  end
  else
  begin
    DM.ZQCadCentro.Params.ParamByName('pcennome').Value := EdtNome.Text;
    if (RgbTipo.ItemIndex = 0) then
    begin
      DM.ZQCadCentro.Params.ParamByName('pcodigotip').Value := 1;
    end
    else
    if (RgbTipo.ItemIndex = 0) then
    begin
      DM.ZQCadCentro.Params.ParamByName('pcodigotip').Value := 2;
    end;
    DM.ZQCadCentro.ExecSQL;

    DM.ZQConsCentro.Close;
    DM.ZQConsCentro.Open;

    EdtNome.Clear;
    RgbTipo.ItemIndex := -1;
    LblMensagem.Caption:='*Campos Obrigatorios';
  end;
end;

procedure TFrmCadCentroCusto.DBGrid1CellClick(Column: TColumn);
begin
  EdtNome.Text := DM.ZQConsCentroCENNOME.AsString;
  if (DM.ZQConsCentroCODIGOTIP.Value = 1) then
  begin
    RgbTipo.ItemIndex := 0;
  end
  else
  if (DM.ZQConsCentroCODIGOTIP.Value = 2) then
  begin
    RgbTipo.ItemIndex := 1;
  end;

  RgbStatus.Visible := True;

  if (DM.ZQConsCentroCENSTATUS.Value = 1) then
  begin
    RgbStatus.ItemIndex := 0;
  end
  else
  if (DM.ZQConsCentroCENSTATUS.Value=0) then
  begin
    RgbStatus.ItemIndex:=1;
  end;

end;

procedure TFrmCadCentroCusto.EdtNome1Change(Sender: TObject);
begin
  if (CboTipo.ItemIndex = 0) and (CboStatus.ItemIndex = 0) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  if (CboTipo.ItemIndex = 1) and (CboStatus.ItemIndex = 0) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  if (CboTipo.ItemIndex = 2) and (CboStatus.ItemIndex = 0) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=2 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  if (CboTipo.ItemIndex = 1) and (CboStatus.ItemIndex = 1) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=1 and censtatus=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  if (CboTipo.ItemIndex = 2) and (CboStatus.ItemIndex = 1) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where codigotip=2 and censtatus=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  if (CboTipo.ItemIndex = 0) and (CboStatus.ItemIndex = 1) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where censtatus=1 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end
  else
  if (CboTipo.ItemIndex = 0) and (CboStatus.ItemIndex = 2) then
  begin
    DM.ZQBuscaCentro.Close;
    DM.ZQBuscaCentro.SQL.Clear;
    DM.ZQBuscaCentro.SQL.Add('select * from vwmostracentro where censtatus=0 and cennome like' +QuotedStr('%' + EdtNome1.Text + '%'));
    DM.ZQBuscaCentro.Open;
  end;
end;

procedure TFrmCadCentroCusto.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  EdtNome.Text:='';
  EdtNome1.Text:='';
  CboTipo.ItemIndex:=-1;
  CboStatus.ItemIndex:=-1;
  RgbTipo.ItemIndex:=0;
  RgbStatus.ItemIndex:=0;
  LblMensagem.Caption:='*Campos Obrigatorios';
end;

procedure TFrmCadCentroCusto.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadCentroCusto.FormShow(Sender: TObject);
begin
  DM.ZQConsCentro.Active := True;
  DM.ZQBuscaCentro.Active := True;
  RgbStatus.Visible := False;
  EdtNome.Text:='';
  EdtNome.SetFocus;
  EdtNome1.Text:='';
  CboTipo.ItemIndex:=-1;
  CboStatus.ItemIndex:=-1;
  RgbTipo.ItemIndex:=0;
  RgbStatus.ItemIndex:=0;
  LblMensagem.Caption:='*Campos Obrigatorios';
end;

procedure TFrmCadCentroCusto.Label4Click(Sender: TObject);
begin

end;

procedure TFrmCadCentroCusto.Label7Click(Sender: TObject);
begin

end;

procedure TFrmCadCentroCusto.Panel2Click(Sender: TObject);
begin

end;

end.
