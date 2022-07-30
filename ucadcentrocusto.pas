unit uCadCentroCusto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids;

type

  { TFrmCadCentroCusto }

  TFrmCadCentroCusto = class(TForm)
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    DBGrid1: TDBGrid;
    EdtNome: TEdit;
    Label1: TLabel;
    Label7: TLabel;
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
    codigo:Integer;
    CadOUAlt:String;
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

end;

procedure TFrmCadCentroCusto.BtnSalvarClick(Sender: TObject);
begin
  if(CadOUAlt='C')then
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

      ShowMessage('CADASTRO FEITO COM SUCESSO!!');
      EdtNome.Clear;
      RgbTipo.ItemIndex := -1;
      LblMensagem.Caption:='*Campos Obrigatorios';
    end;
  end
  else
  if (CadOUAlt='A')then
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
        DM.ZQAltCentro.Params.ParamByName('pcencodigo').Value :=codigo;
        DM.ZQAltCentro.ExecSQL;

        DM.ZQBuscaCentro.Close;
        DM.ZQBuscaCentro.Open;

        ShowMessage('ALTERAÇÃO FEITA COM SUCESSO!!');
        EdtNome.Clear;
        RgbTipo.ItemIndex := -1;
        RgbStatus.ItemIndex:=-1;
        RgbStatus.Visible:=false;
        close;
      end;

  end;
end;

procedure TFrmCadCentroCusto.DBGrid1CellClick(Column: TColumn);
begin

end;

procedure TFrmCadCentroCusto.EdtNome1Change(Sender: TObject);
begin

end;

procedure TFrmCadCentroCusto.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DM.ZQConsCentro.Active:=False;
  EdtNome.Text:='';
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
  DM.ZQConsCentro.Active:=true;
  RgbStatus.Visible := False;
  EdtNome.Text:='';
  EdtNome.SetFocus;
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
