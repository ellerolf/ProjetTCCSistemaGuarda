unit uCadUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, LResources;

type

  { TFrmCadUsuario }

  TFrmCadUsuario = class(TForm)
    BtnAlterar: TSpeedButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    ChkMostrar: TCheckBox;
    CboStatus: TComboBox;
    DBGrid1: TDBGrid;
    EdtConfSenha: TEdit;
    EdtConsulta: TEdit;
    EdtNome: TEdit;
    EdtNomeUsuario: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    BtnConsulta: TSpeedButton;
    Panel2: TPanel;
    RgbAltStatus: TRadioGroup;
    RgbNivel: TRadioGroup;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChkMostrarChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrpNivel1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.lfm}

{ TFrmCadUsuario }
  uses UModulo;
procedure TFrmCadUsuario.GrpNivel1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Label1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.ChkMostrarChange(Sender: TObject);
begin
  if (ChkMostrar.Checked=True)then
   begin
     EdtSenha.PasswordChar:=#0;
     EdtConfSenha.PasswordChar:=#0;
   end
  else if (ChkMostrar.Checked=False)then
   begin
     EdtSenha.PasswordChar:='*';
     EdtConfSenha.PasswordChar:='*';
   end;
end;

procedure TFrmCadUsuario.DBGrid1CellClick(Column: TColumn);
begin
   EdtNome.Text:=DM.ZQConsUsuarioUSUNOME.AsString;
   EdtNomeUsuario.Text:=DM.ZQConsUsuarioUSULOGIN.AsString;
   EdtSenha.Text:=DM.ZQConsUsuarioUSUSENHA.AsString;
   EdtConfSenha.Text:=DM.ZQConsUsuarioUSUSENHA.AsString;
   if (DM.ZQConsUsuarioCODIGONIV.Value=1)then
    begin
      RgbNivel.ItemIndex:=0;
    end
   else
   if(DM.ZQConsUsuarioCODIGONIV.Value=2) then
    begin
      RgbNivel.ItemIndex:=1;
    end;

    RgbAltStatus.Visible:=True;

   if(DM.ZQConsUsuarioUSUSTATUS.Value=1)then
    begin
      RgbAltStatus.ItemIndex:=0;
    end
   else
   if(DM.ZQConsUsuarioUSUSTATUS.Value=0)then
    begin
      RgbAltStatus.ItemIndex:=1;
    end;
end;

procedure TFrmCadUsuario.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DM.ZQConsUsuario.Active:=False;
  EdtNome.Clear;
  EdtNomeUsuario.Clear;
  EdtSenha.clear;
  EdtConfSenha.Clear;
  RgbNivel.ItemIndex:=-1;
  CboStatus.ItemIndex:=0;
  LblMensagem.Caption:='*Campos Obrigatorios';
end;

procedure TFrmCadUsuario.BtnAlterarClick(Sender: TObject);
var verifica:Integer;
begin
   verifica := Length(EdtSenha.Text);
  if (EdtNome.text='') or (EdtNomeUsuario.text='') or (EdtSenha.Text='') or (EdtConfSenha.Text='') or (RgbNivel.ItemIndex=-1) then
   begin
     LblMensagem.Caption:='POR FAVOR PREENCHE TODOS OS CAMPOS';
   end
  else
  if (EdtSenha.Text<>EdtConfSenha.Text)then
    begin
      LblMensagem.Caption:='SENHAS NAO CONFEREM, FAVOR CONFERIR NOVAMENTE';
    end
   else
   if (verifica < 8)then
     begin
         LblMensagem.Caption:='A SENHA DEVE TER 8 CARACTERS NO MINIMO';
     end
   else
     try
       begin
        DM.ZQAltUsuario.Params.ParamByName('pusunome').Value:=EdtNome.Text;
        DM.ZQAltUsuario.Params.ParamByName('pusulogin').Value:=EdtNomeUsuario.Text;
        DM.ZQAltUsuario.Params.ParamByName('pususenha').Value:=EdtSenha.Text;
        DM.ZQAltUsuario.Params.ParamByName('pususenha').Value:=EdtConfSenha.Text;

         if(RgbNivel.ItemIndex=0)then
         begin
           DM.ZQAltUsuario.Params.ParamByName('pcodigoniv').Value:= 1;
         end
        else if(RgbNivel.ItemIndex=1)then
         begin
           DM.ZQAltUsuario.Params.ParamByName('pcodigoniv').Value:=2;
         end;

         if ( RgbAltStatus.ItemIndex=0) then
          begin
             DM.ZQAltUsuario.Params.ParamByName('pusustatus').Value:=1;
          end
         else
          if ( RgbAltStatus.ItemIndex=1) then
          begin
             DM.ZQAltUsuario.Params.ParamByName('pusustatus').Value:=0;
          end;
        DM.ZQAltUsuario.Params.ParamByName('pusucodigo').Value:=DM.ZQConsUsuarioUSUCODIGO.AsInteger;
        DM.ZQAltUsuario.ExecSQL;

        DM.ZQConsUsuario.Close;
        DM.ZQConsUsuario.Open;

        EdtNome.Clear;
        EdtNomeUsuario.Clear;
        EdtSenha.clear;
        EdtConfSenha.Clear;
        RgbNivel.ItemIndex:=-1;
        RgbAltStatus.ItemIndex:=-1;
        RgbAltStatus.Visible:=False;
        LblMensagem.Caption:='*Campos Obrigatorios';
        end;
     except
       begin
         LblMensagem.Caption:='NOME DE USUARIO JA ESTA SENDO UTILIZADO!!';
       end;
end;

end;

procedure TFrmCadUsuario.BtnConsultaClick(Sender: TObject);
begin
    if (CboStatus.ItemIndex=0) then
      begin
        DM.ZQConsUsuario.close;
        DM.ZQConsUsuario.SQL.clear;
        DM.ZQConsUsuario.SQL.Add('select * from usuario where usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
        DM.ZQConsUsuario.Open;
        EdtConsulta.clear;
      end
      else
    if (CboStatus.ItemIndex=1) then
      begin
        DM.ZQConsUsuario.close;
        DM.ZQConsUsuario.SQL.clear;
        DM.ZQConsUsuario.SQL.Add('select * from usuario where usustatus=1 and usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
        DM.ZQConsUsuario.Open;
        EdtConsulta.clear;
      end
      else
     if (CboStatus.ItemIndex=2) then
       begin
         DM.ZQConsUsuario.close;
         DM.ZQConsUsuario.SQL.clear;
         DM.ZQConsUsuario.SQL.Add('select * from usuario where usustatus=0 and usunome like'+QuotedStr('%'+EdtConsulta.Text+'%'));
         DM.ZQConsUsuario.Open;
         EdtConsulta.clear;
       end;
end;

procedure TFrmCadUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadUsuario.FormShow(Sender: TObject);
begin
  RgbAltStatus.Visible:=False;
  DM.ZQConsUsuario.Active:=true;
  EdtNome.Clear;
  EdtNome.SetFocus;
  EdtNomeUsuario.Clear;
  EdtSenha.clear;
  EdtConfSenha.Clear;
  RgbNivel.ItemIndex:=-1;
  CboStatus.ItemIndex:=0;
  LblMensagem.Caption:='*Campos Obrigatorios';
end;

procedure TFrmCadUsuario.BtnSalvarClick(Sender: TObject);
var verifica:Integer;
begin
  verifica := Length(EdtSenha.Text);
  if (EdtNome.text='') or (EdtNomeUsuario.text='') or (EdtSenha.Text='') or (EdtConfSenha.Text='') or (RgbNivel.ItemIndex=-1) then
    begin
      LblMensagem.Caption:='CAMPOS FALTANDO, FAVOR CONFERIR';
    end
  else
  if (EdtSenha.Text<>EdtConfSenha.Text)then
    begin
      LblMensagem.Caption:='SENHAS NAO CONFEREM, FAVOR CONFERIR NOVAMENTE';
    end
  else
  if (verifica < 8)then
    begin
      LblMensagem.Caption:='A SENHA DEVE TER 8 CARACTERS NO MINIMO';
    end
   else
   begin
     DM.ZQConsUsuario.Close;
     DM.ZQConsUsuario.SQL.Clear;
     DM.ZQConsUsuario.SQL.Add('select * from usuario where usulogin='+QuotedStr(EdtNomeUsuario.Text));
     DM.ZQConsUsuario.Open;
     if (DM.ZQConsUsuario.RecordCount=1) then
       begin
         ShowMessage('NOME DE USUARIO JÁ EXISTE, FAVOR ESCOLHER OUTRO');
       end
       else
      begin
          DM.ZQCadUsuario.Params.ParamByName('pusunome').Value:=EdtNome.Text;
          DM.ZQCadUsuario.Params.ParamByName('pusulogin').Value:=EdtNomeUsuario.Text;
          DM.ZQCadUsuario.Params.ParamByName('pususenha').Value:=EdtSenha.Text;
          DM.ZQCadUsuario.Params.ParamByName('pususenha').Value:=EdtConfSenha.Text;
          if(RgbNivel.ItemIndex=0)then
           begin
             DM.ZQCadUsuario.Params.ParamByName('pcodigoniv').Value:= 1;
           end
          else if(RgbNivel.ItemIndex=1)then
           begin
             DM.ZQCadUsuario.Params.ParamByName('pcodigoniv').Value:=2;
           end;
          DM.ZQCadUsuario.ExecSQL;

          DM.ZQConsUsuario.Close;
          DM.ZQConsUsuario.Open;

          EdtNome.Clear;
          EdtNomeUsuario.Clear;
          EdtSenha.clear;
          EdtConfSenha.Clear;
          RgbNivel.ItemIndex:=-1;
          LblMensagem.Caption:='*Campos Obrigatorios';
        end;

   end;

end;

procedure TFrmCadUsuario.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.Panel2Click(Sender: TObject);
begin

end;

end.
