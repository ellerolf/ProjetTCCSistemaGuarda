unit umenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, ActnList, StdCtrls, uCadUsuario, uCadContasBancarias,
  uCadCentroCusto, UModulo, uCadFornecedores, uCadLancamento, UConsFornecedores,
  UConsBaixa, UConsContas, UEntrarUsuario, UTranfContas, UConsUsuario,
  uConsCentro, Ferramentas;

type

  { TFrmMenu }

  TFrmMenu = class(TForm)
    EdtSenhaAtual: TEdit;
    EdtSenhaNova: TEdit;
    EdtConfirmaSenha: TEdit;
    espaca1: TLabel;
    espaca2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    espaca: TLabel;
    Image6: TImage;
    Label5: TLabel;
    LblNomeUsu: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LblRetorno: TLabel;
    LblUsuario: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PnTrocaSenha: TPanel;
    Panel8: TPanel;
    PnChama: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    BtnInicial: TSpeedButton;
    BtnCadUsuarios: TSpeedButton;
    BtnConsFornecedores: TSpeedButton;
    BtnConsReceitaDespesas: TSpeedButton;
    BtnRelaMovi: TSpeedButton;
    BtnRelaPresta: TSpeedButton;
    BtnCadBanco: TSpeedButton;
    BtnCadCentro: TSpeedButton;
    BtnCadFornecedor: TSpeedButton;
    BtnCadLancamento: TSpeedButton;
    BtnConsBanco: TSpeedButton;
    BtnTrasf: TSpeedButton;
    BtnConsUsuario: TSpeedButton;
    BtnConsCentro: TSpeedButton;
    BtnLogoff: TSpeedButton;
    BtnMudarSenha: TSpeedButton;
    BtnAlteraSenha: TSpeedButton;
    procedure BtnAlteraSenhaClick(Sender: TObject);
    procedure BtnCadBancoClick(Sender: TObject);
    procedure BtnCadCentroClick(Sender: TObject);
    procedure BtnCadFornecedorClick(Sender: TObject);
    procedure BtnCadLancamentoClick(Sender: TObject);
    procedure BtnCadUsuariosClick(Sender: TObject);
    procedure BtnConsBancoClick(Sender: TObject);
    procedure BtnConsCentroClick(Sender: TObject);
    procedure BtnConsFornecedoresClick(Sender: TObject);
    procedure BtnConsReceitaDespesasClick(Sender: TObject);
    procedure BtnLogoffClick(Sender: TObject);
    procedure BtnMudarSenhaClick(Sender: TObject);
    procedure BtnRelaPrestaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnTrasfClick(Sender: TObject);
    procedure EdtConfirmaSenhaKeyPress(Sender: TObject; var Key: char);
    procedure EdtSenhaAtualKeyPress(Sender: TObject; var Key: char);
    procedure EdtSenhaNovaChange(Sender: TObject);
    procedure EdtSenhaNovaKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LblUsuarioClick(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure BtnRelaMoviClick(Sender: TObject);
    procedure PnChamaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnConsUsuarioClick(Sender: TObject);
  private

  public

  end;

var
  FrmMenu: TFrmMenu;

implementation {$R *.lfm}

//================================ FORM CREATE ===============================\\
procedure TFrmMenu.FormCreate(Sender: TObject);
begin
  Simpl := TSimpl.Create;
end;

//=============================== FORM DESTROY ===============================\\
procedure TFrmMenu.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Simpl);
end;

procedure TFrmMenu.MenuItem3Click(Sender: TObject);
begin

end;

procedure TFrmMenu.MenuItem11Click(Sender: TObject);
begin

end;

procedure TFrmMenu.Image1Click(Sender: TObject);
begin

end;

procedure TFrmMenu.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenu.BtnTrasfClick(Sender: TObject);
begin
  FrmTranfContas.Parent := PnChama;
  FrmTranfContas.Align := alClient;
  FrmTranfContas.Show;
end;

procedure TFrmMenu.EdtConfirmaSenhaKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    BtnAlteraSenha.Click;
  end;
end;

procedure TFrmMenu.EdtSenhaAtualKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    BtnAlteraSenha.Click;
  end;
end;

procedure TFrmMenu.EdtSenhaNovaChange(Sender: TObject);
begin

end;

procedure TFrmMenu.EdtSenhaNovaKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    EdtConfirmaSenha.SetFocus;
  end;
end;

procedure TFrmMenu.FormClose(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMenu.FormResize(Sender: TObject);
begin

end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  FrmEntrarUsuario.hide;
  PnTrocaSenha.Visible := False;
  EdtConfirmaSenha.Enabled := False;
  EdtSenhaNova.Enabled := False;
  LblUsuario.Caption := FrmEntrarUsuario.usuarios;
  if (FrmEntrarUsuario.acesso <> 1) then
  begin
    BtnCadUsuarios.Enabled := False;
    BtnConsUsuario.Enabled := False;
  end;
end;

procedure TFrmMenu.BtnCadUsuariosClick(Sender: TObject);
begin
  FrmCadUsuario.AltOUCad := 'C';
  FrmCadUsuario.EdtSenha.Enabled := True;
  FrmCadUsuario.EdtConfSenha.Enabled := True;
  FrmCadUsuario.Label5.Enabled := True;
  FrmCadUsuario.Label6.Enabled := True;
  FrmCadUsuario.ChkMostrar.Enabled := True;
  FrmCadUsuario.Parent := PnChama;
  FrmCadUsuario.Align := alClient;
  FrmCadUsuario.Show;
end;

procedure TFrmMenu.BtnConsBancoClick(Sender: TObject);
begin
  FrmConsContas.parent := PnChama;
  FrmConsContas.Align := alClient;
  FrmConsContas.Show;
end;

procedure TFrmMenu.BtnConsCentroClick(Sender: TObject);
begin
  FrmConsCentro.Parent := PnChama;
  FrmConsCentro.Align := alClient;
  FrmConsCentro.Show;
end;

procedure TFrmMenu.BtnConsFornecedoresClick(Sender: TObject);
begin
  FrmConsFornecedores.parent := PnChama;
  FrmConsFornecedores.Align := alClient;
  FrmConsFornecedores.Show;
end;

procedure TFrmMenu.BtnConsReceitaDespesasClick(Sender: TObject);
begin
  FrmConsBaixa.parent := PnChama;
  FrmConsBaixa.Align := alClient;
  FrmConsBaixa.Show;
end;

procedure TFrmMenu.BtnLogoffClick(Sender: TObject);
begin

  FrmCadUsuario.BtnSair.Click;
  FrmCadFornecedor.BtnSair.Click;
  FrmCadLancamento.BtnSair.Click;
  FrmCadCentroCusto.BtnSair.Click;
  FrmCadContasBancarias.BtnSair.Click;
  FrmConsUsuario.BtnSair.Click;
  FrmConsFornecedores.BtnSair.Click;
  FrmConsBaixa.BtnSair.Click;
  FrmConsCentro.BtnSair.Click;
  FrmTranfContas.BtnCancela.Click;
  FrmConsContas.BtnSair.Click;
  BtnCadUsuarios.Enabled := True;
  BtnConsUsuario.Enabled := True;
  FrmMenu.hide;
  FrmEntrarUsuario.EdtUsuario.Text := '';
  FrmEntrarUsuario.EdtSenha.Text := '';
  FrmEntrarUsuario.Show;

end;

procedure TFrmMenu.BtnMudarSenhaClick(Sender: TObject);
begin
  if (PnTrocaSenha.Visible = True) then
  begin
    PnTrocaSenha.Visible := False;
    DM.ZQConsUsuario.Active := False;
  end
  else
  if (PnTrocaSenha.Visible = False) then
  begin
    DM.ZQConsUsuario.Active := True;
    EdtConfirmaSenha.Enabled := False;
    EdtSenhaNova.Enabled := False;
    EdtSenhaAtual.Text := '';
    EdtSenhaNova.Text := '';
    EdtConfirmaSenha.Text := '';
    EdtSenhaAtual.Enabled := True;
    PnTrocaSenha.Visible := True;
    EdtSenhaAtual.SetFocus;
  end;
end;

procedure TFrmMenu.BtnRelaPrestaClick(Sender: TObject);
begin

end;

procedure TFrmMenu.BtnCadBancoClick(Sender: TObject);
begin
  FrmCadContasBancarias.OpeCadOuAltConta := 'i';
  FrmCadContasBancarias.OpecadOuAltTransf := 'I';
  FrmCadContasBancarias.Parent := PnChama;
  FrmCadContasBancarias.Align := alClient;
  FrmCadContasBancarias.Show;
end;

procedure TFrmMenu.BtnAlteraSenhaClick(Sender: TObject);
var
  verificar: integer;
begin
  verificar := Length(EdtSenhaNova.Text);
  if ((EdtSenhaNova.Enabled = False) and (EdtConfirmaSenha.Enabled = False)) then
  begin
    if ((EdtSenhaAtual.Text = DM.ZQConsUsuarioUSUSENHA.Value) and
      (FrmEntrarUsuario.indentidade = DM.ZQConsUsuarioUSUCODIGO.Value)) then
    begin
      EdtSenhaNova.Enabled := True;
      EdtConfirmaSenha.Enabled := True;
      EdtSenhaAtual.Enabled := False;
      EdtSenhaNova.SetFocus;
    end
    else
    begin
      ShowMessage('FAVOR VERIFIQUE SE SUA SENHA ESTA ERRADA');
    end;
  end
  else
  if ((EdtSenhaNova.Enabled = True) and (EdtConfirmaSenha.Enabled = True)) then
  begin
    if ((EdtSenhaNova.Text = '') or (EdtConfirmaSenha.Text = '')) then
    begin
      ShowMessage('CAMPOS FALTANDO');
    end
    else
    if (EdtSenhaNova.Text <> EdtConfirmaSenha.Text) then
    begin
      ShowMessage('SENHAS NAO CONFEREM, FAVOR CONFERIR NOVAMENTE');
    end
    else
    if (verificar < 8) then
    begin
      ShowMessage('A SENHA DEVE TER NO MINIMO 8 DIGITOS');
    end
    else
    begin
      DM.ZQAltUsuario.Params.ParamByName('pusunome').Value :=
        DM.ZQConsUsuarioUSUNOME.Value;
      DM.ZQAltUsuario.Params.ParamByName('pusulogin').Value :=
        DM.ZQConsUsuarioUSULOGIN.Value;
      DM.ZQAltUsuario.Params.ParamByName('pususenha').Value := EdtSenhaNova.Text;
      DM.ZQAltUsuario.Params.ParamByName('pcodigoniv').Value :=
        DM.ZQConsUsuarioCODIGONIV.Value;
      DM.ZQAltUsuario.Params.ParamByName('pusustatus').Value :=
        DM.ZQConsUsuarioUSUSTATUS.Value;
      DM.ZQAltUsuario.Params.ParamByName('pusucodigo').Value :=
        FrmEntrarUsuario.indentidade;
      DM.ZQAltUsuario.ExecSQL;

      DM.ZQBuscaUsuario.Close;
      DM.ZQBuscaUsuario.Open;

      ShowMessage('SENHA ALTERADA COM SUCESSO');
      EdtSenhaAtual.Text := '';
      EdtSenhaNova.Text := '';
      EdtConfirmaSenha.Text := '';
      EdtSenhaNova.Enabled := False;
      EdtConfirmaSenha.Enabled := False;
      PnTrocaSenha.Visible := False;
    end;
  end;
end;

procedure TFrmMenu.BtnCadCentroClick(Sender: TObject);
begin
  FrmCadCentroCusto.CadOUAlt := 'C';
  FrmCadCentroCusto.Parent := PnChama;
  FrmCadCentroCusto.Align := alClient;
  FrmCadCentroCusto.Show;
end;

procedure TFrmMenu.BtnCadFornecedorClick(Sender: TObject);
begin
  FrmCadFornecedor.OpForn := 'I';
  FrmCadFornecedor.Parent := PnChama;
  FrmCadFornecedor.Align := alClient;
  FrmCadFornecedor.BtnAlterar.Visible := False;
  FrmCadFornecedor.Show;
end;

procedure TFrmMenu.BtnCadLancamentoClick(Sender: TObject);
begin
  FrmCadLancamento.CadOuAltLanDatValor := 'i';
  FrmCadLancamento.Parent := PnChama;
  FrmCadLancamento.Align := alClient;
  FrmCadLancamento.Show;
end;

procedure TFrmMenu.LblUsuarioClick(Sender: TObject);
begin

end;

procedure TFrmMenu.MenuItem16Click(Sender: TObject);
begin

end;

procedure TFrmMenu.MenuItem8Click(Sender: TObject);
begin

end;

procedure TFrmMenu.BtnRelaMoviClick(Sender: TObject);
begin

end;

procedure TFrmMenu.PnChamaClick(Sender: TObject);
begin

end;

procedure TFrmMenu.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMenu.BtnConsUsuarioClick(Sender: TObject);
begin
  FrmConsUsuario.Parent := PnChama;
  FrmConsUsuario.Align := alClient;
  FrmConsUsuario.Show;
end;

end.
