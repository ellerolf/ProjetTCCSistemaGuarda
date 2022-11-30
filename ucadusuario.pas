unit uCadUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, LResources;

type

  { TFrmCadUsuario }

  TFrmCadUsuario = class(TForm)
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    ChkMostrar: TCheckBox;
    EdtConfSenha: TEdit;
    EdtNome: TEdit;
    EdtNomeUsuario: TEdit;
    EdtSenha: TEdit;
    LblNomedeform: TLabel;
    LblNome: TLabel;
    LblNomUsuario: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LblMensagem: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RgbAltStatus: TRadioGroup;
    RgbNivel: TRadioGroup;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChkMostrarChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtConfSenhaKeyPress(Sender: TObject; var Key: char);
    procedure EdtNomeChange(Sender: TObject);
    procedure EdtNomeKeyPress(Sender: TObject; var Key: char);
    procedure EdtNomeUsuarioKeyPress(Sender: TObject; var Key: char);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrpNivel1Click(Sender: TObject);
    procedure LblNomedeformClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure RgbNivelClick(Sender: TObject);
  private

  public
    codigo: integer;
    AltOUCad, BAlterar: string;
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.lfm}

{ TFrmCadUsuario }
uses UModulo, UConsUsuario, umenu;

procedure TFrmCadUsuario.GrpNivel1Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.LblNomedeformClick(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUsuario.ChkMostrarChange(Sender: TObject);
begin
  //Aqui se o botão mostra senha for ativo mostrar
  if (ChkMostrar.Checked = True) then
  begin
    EdtSenha.PasswordChar := #0;
    EdtConfSenha.PasswordChar := #0;
  end
  else
  //Aqui se não for ativo esconder
  if (ChkMostrar.Checked = False) then
  begin
    EdtSenha.PasswordChar := '*';
    EdtConfSenha.PasswordChar := '*';
  end;
end;

procedure TFrmCadUsuario.DBGrid1CellClick(Column: TColumn);
begin

end;

procedure TFrmCadUsuario.EdtConfSenhaKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TFrmCadUsuario.EdtNomeChange(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.EdtNomeKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TFrmCadUsuario.EdtNomeUsuarioKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TFrmCadUsuario.EdtSenhaKeyPress(Sender: TObject; var Key: char);
begin
  i;
end;

procedure TFrmCadUsuario.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DM.ZQConsUsuario.Active := False;
  EdtNome.Clear;
  EdtNomeUsuario.Clear;
  EdtSenha.Clear;
  EdtConfSenha.Clear;
  LblMensagem.Caption := 'Todos os campos são Obrigatorios';
end;

procedure TFrmCadUsuario.BtnAlterarClick(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.BtnConsultaClick(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadUsuario.FormShow(Sender: TObject);
begin
  EdtNome.SetFocus;
  //Se o altOUcad for = A então ele não vai poder alterar os campos de senha e nem poder ve-la pois
  //isso vem da privacidade do usuario.
  if (AltOUCad = 'A') then
  begin
    LblNomedeform.Caption := 'Alteração de Usuário';
    EdtSenha.Enabled := False;
    EdtConfSenha.Enabled := False;
    ChkMostrar.Enabled := False;
    Label5.Enabled := False;
    Label6.Enabled := False;
  end
  else
    // se não ele mostra para o cadastro de usuario
  begin
    LblNomedeform.Caption := 'Cadastro de Usuário';
    RgbAltStatus.Visible := False;
    DM.ZQConsUsuario.Active := True;
    EdtNome.Clear;
    EdtNome.SetFocus;
    EdtNomeUsuario.Clear;
    EdtSenha.Clear;
    EdtConfSenha.Clear;
    RgbNivel.ItemIndex := -1;
    LblMensagem.Caption := 'Todos os campos são Obrigatorios';
  end;

end;

procedure TFrmCadUsuario.BtnSalvarClick(Sender: TObject);
var
  verifica, verifica2: integer;
begin
  // aqui mostrar que esta Cadastrando um usuario
  if (AltOUCad = 'C') then
  begin
    //A variavel esta contando quantos caracteres tem no campo
    verifica := Length(EdtSenha.Text);
    //validação para ver se existe campos faltando
    if (EdtNome.Text = '') or (EdtNomeUsuario.Text = '') or
      (EdtSenha.Text = '') or (EdtConfSenha.Text = '') or (RgbNivel.ItemIndex = -1) then
    begin
      ShowMessage('CAMPOS FALTANDO, FAVOR CONFERIR');
    end
    else
    //validação para ver se as senhas sao iguais
    if (EdtSenha.Text <> EdtConfSenha.Text) then
    begin
      ShowMessage('SENHAS NAO CONFEREM, FAVOR CONFERIR NOVAMENTE');
    end
    else
    //validação para ver se tem menos de 8 caracters a senha
    if (verifica < 8) then
    begin
      ShowMessage('A SENHA DEVE TER 8 CARACTERS NO MINIMO');
    end
    else
    begin
      ChkMostrar.Checked := False;
      DM.ZQConsUsuario.Close;
      DM.ZQConsUsuario.SQL.Clear;
      DM.ZQConsUsuario.SQL.Add('select * from usuario where usulogin=' +
        QuotedStr(EdtNomeUsuario.Text));
      DM.ZQConsUsuario.Open;
      //validação no cadastr para ver se o nome de usuario ja existe e não trarvar a execução do programa
      if (DM.ZQConsUsuario.RecordCount = 1) then
      begin
        ShowMessage('NOME DE USUARIO JÁ EXISTE, FAVOR ESCOLHER OUTRO');
      end
      else
      begin
        //começo do insert na tabela de usuario
        DM.ZQCadUsuario.Params.ParamByName('pusunome').Value := EdtNome.Text;
        DM.ZQCadUsuario.Params.ParamByName('pusulogin').Value := EdtNomeUsuario.Text;
        DM.ZQCadUsuario.Params.ParamByName('pususenha').Value := EdtSenha.Text;
        DM.ZQCadUsuario.Params.ParamByName('pususenha').Value := EdtConfSenha.Text;

        if (RgbNivel.ItemIndex = 0) then
        begin
          DM.ZQCadUsuario.Params.ParamByName('pcodigoniv').Value := 1;
        end
        else if (RgbNivel.ItemIndex = 1) then
        begin
          DM.ZQCadUsuario.Params.ParamByName('pcodigoniv').Value := 2;
        end;

        DM.ZQCadUsuario.ExecSQL;
        DM.ZQConsUsuario.Close;
        DM.ZQConsUsuario.Open;

        //finalização terminar os campos e limpa-los
        ShowMessage('CADASTRO DE USUARIO FEITO COM SUCESSO!');
        EdtNome.Clear;
        EdtNomeUsuario.Clear;
        EdtSenha.Clear;
        EdtConfSenha.Clear;
        RgbNivel.ItemIndex := -1;
      end;
    end;
  end
  else
  //aqui mostra que esta Alterando as informaçoes de usuario
  if (AltOUCad = 'A') then
  begin
    //A variavel esta contando quantos caracteres tem no campo
    verifica2 := Length(EdtSenha.Text);
    // As mesmas validações do cadastrar usuario
    if (EdtNome.Text = '') or (EdtNomeUsuario.Text = '') or
      (EdtSenha.Text = '') or (EdtConfSenha.Text = '') or (RgbNivel.ItemIndex = -1) then
    begin
      ShowMessage('POR FAVOR PREENCHE TODOS OS CAMPOS');
    end
    else
    if (EdtSenha.Text <> EdtConfSenha.Text) then
    begin
      ShowMessage('SENHAS NAO CONFEREM, FAVOR CONFERIR NOVAMENTE');
    end
    else
    if (verifica2 < 8) then
    begin
      ShowMessage('A SENHA DEVE TER 8 CARACTERS NO MINIMO');
    end
    else
{o try serve para caso o nome de usuario ja for existente,
ele não vai consequi para que a execução não trave ele vai mostrar um mensagem que servira como alerta}
      try
        begin
          DM.ZQAltUsuario.Params.ParamByName('pusunome').Value := EdtNome.Text;
          DM.ZQAltUsuario.Params.ParamByName('pusulogin').Value := EdtNomeUsuario.Text;
          DM.ZQAltUsuario.Params.ParamByName('pususenha').Value := EdtSenha.Text;
          // DM.ZQAltUsuario.Params.ParamByName('pususenha').Value:=EdtConfSenha.Text;

          if (RgbNivel.ItemIndex = 0) then
          begin
            DM.ZQAltUsuario.Params.ParamByName('pcodigoniv').Value := 1;
          end
          else if (RgbNivel.ItemIndex = 1) then
          begin
            DM.ZQAltUsuario.Params.ParamByName('pcodigoniv').Value := 2;
          end;

          if (RgbAltStatus.ItemIndex = 0) then
          begin
            DM.ZQAltUsuario.Params.ParamByName('pusustatus').Value := 1;
          end
          else
          if (RgbAltStatus.ItemIndex = 1) then
          begin
            DM.ZQAltUsuario.Params.ParamByName('pusustatus').Value := 0;
          end;
          DM.ZQAltUsuario.Params.ParamByName('pusucodigo').Value := codigo;
          DM.ZQAltUsuario.ExecSQL;

          DM.ZQBuscaUsuario.Close;
          DM.ZQBuscaUsuario.Open;

          ShowMessage('ALTERAÇÃO DE USUARIO FEITO COM SUCESSO!');
          EdtNome.Clear;
          EdtNomeUsuario.Clear;
          EdtSenha.Enabled := True;
          EdtConfSenha.Enabled := True;
          Label5.Enabled := True;
          Label6.Enabled := True;
          ChkMostrar.Enabled := True;
          RgbNivel.ItemIndex := -1;
          RgbAltStatus.ItemIndex := -1;
          RgbAltStatus.Visible := False;
          FrmConsUsuario.PnAlterausu.Visible := False;
          Close;
        end;
      except
        begin
         ShowMessage('NOME DE USUARIO JA ESTA SENDO UTILIZADO!!');
        end;
      end;

  end;
end;

procedure TFrmCadUsuario.BtnSairClick(Sender: TObject);
begin
  FrmConsUsuario.PnAlterausu.Visible := False;
  EdtSenha.Enabled := True;
  EdtConfSenha.Enabled := True;
  ChkMostrar.Enabled := True;
  Label5.Enabled := True;
  Label6.Enabled := True;
  Close;
end;

procedure TFrmCadUsuario.Panel2Click(Sender: TObject);
begin

end;

procedure TFrmCadUsuario.RgbNivelClick(Sender: TObject);
begin

end;

end.
