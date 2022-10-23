unit umenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, ActnList, StdCtrls, uCadUsuario, uCadContasBancarias,
  uCadCentroCusto, uCadFornecedores, uCadLancamento, UConsFornecedores,
  UConsBaixa, UConsContas, UEntrarUsuario, UTranfContas, UConsUsuario,
  uConsCentro, Ferramentas;

type

  { TFrmMenu }

  TFrmMenu = class(TForm)
    espaca1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    espaca: TLabel;
    LblUsuario: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
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
    procedure BtnRelaPrestaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnTrasfClick(Sender: TObject);
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
  LblUsuario.Caption:=FrmEntrarUsuario.usuarios;
  if (FrmEntrarUsuario.acesso<>1)then
  begin
    BtnCadUsuarios.Enabled:=False;
    BtnConsUsuario.Enabled:=False;
  end;
end;

procedure TFrmMenu.BtnCadUsuariosClick(Sender: TObject);
begin
  {if (FrmEntrarUsuario.acesso=2)then
  begin
    ShowMessage('Sua conta de usuario não tem acesso a essa função');
  end;}
  FrmCadUsuario.AltOUCad:='C';
  FrmCadUsuario.Parent := PnChama;
  FrmCadUsuario.Align := alClient;
  FrmCadUsuario.Show;
end;

procedure TFrmMenu.BtnConsBancoClick(Sender: TObject);
begin
  FrmConsContas.parent := PnChama;
  FrmConsContas.Align := alClient;
  FrmConsContas.show;
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
  FrmMenu.hide;
  FrmEntrarUsuario.EdtUsuario.Text:='';
  FrmEntrarUsuario.EdtSenha.Text:='';
  FrmEntrarUsuario.Show;

end;

procedure TFrmMenu.BtnRelaPrestaClick(Sender: TObject);
begin

end;

procedure TFrmMenu.BtnCadBancoClick(Sender: TObject);
begin
  FrmCadContasBancarias.OpeCadOuAltConta:='i';
  FrmCadContasBancarias.OpecadOuAltTransf:='I';
  FrmCadContasBancarias.Parent := PnChama;
  FrmCadContasBancarias.Align := alClient;
  FrmCadContasBancarias.Show;
end;

procedure TFrmMenu.BtnCadCentroClick(Sender: TObject);
begin
  FrmCadCentroCusto.CadOUAlt:='C';
  FrmCadCentroCusto.Parent := PnChama;
  FrmCadCentroCusto.Align := alClient;
  FrmCadCentroCusto.Show;
end;

procedure TFrmMenu.BtnCadFornecedorClick(Sender: TObject);
begin
  FrmCadFornecedor.OpForn:='I';
  FrmCadFornecedor.Parent := PnChama;
  FrmCadFornecedor.Align := alClient;
  FrmCadFornecedor.BtnAlterar.Visible:=false;
  FrmCadFornecedor.Show;
end;

procedure TFrmMenu.BtnCadLancamentoClick(Sender: TObject);
begin
  FrmCadLancamento.CadOuAltLanDatValor:='i';
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
