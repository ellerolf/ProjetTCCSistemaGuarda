unit umenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls, Grids,
  Buttons, ActnList, StdCtrls, uCadUsuario, uCadContasBancarias,
  uCadCentroCusto, uCadFornecedores, uCadLancamento, UConsFornecedores,
  UConsBaixa, UConsContas, UEntrarUsuario, VTHeaderPopup;

type

  { TFrmMenu }

  TFrmMenu = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    LblUsuario: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
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
    SpeedButton1: TSpeedButton;
    BtnTrasf: TSpeedButton;
    procedure BtnCadBancoClick(Sender: TObject);
    procedure BtnCadCentroClick(Sender: TObject);
    procedure BtnCadFornecedorClick(Sender: TObject);
    procedure BtnCadLancamentoClick(Sender: TObject);
    procedure BtnCadUsuariosClick(Sender: TObject);
    procedure BtnConsBancoClick(Sender: TObject);
    procedure BtnConsFornecedoresClick(Sender: TObject);
    procedure BtnConsReceitaDespesasClick(Sender: TObject);
    procedure BtnRelaPrestaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  private

  public

  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.lfm}

{ TFrmMenu }

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

procedure TFrmMenu.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmMenu.FormResize(Sender: TObject);
begin

end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  FrmEntrarUsuario.hide;
end;

procedure TFrmMenu.BtnCadUsuariosClick(Sender: TObject);
begin
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

procedure TFrmMenu.BtnRelaPrestaClick(Sender: TObject);
begin

end;

procedure TFrmMenu.BtnCadBancoClick(Sender: TObject);
begin
  FrmCadContasBancarias.OpeCadOuAltConta:='i';
  FrmCadContasBancarias.Parent := PnChama;
  FrmCadContasBancarias.Align := alClient;
  FrmCadContasBancarias.Show;
end;

procedure TFrmMenu.BtnCadCentroClick(Sender: TObject);
begin
  FrmCadCentroCusto.Parent := PnChama;
  FrmCadCentroCusto.Align := alClient;
  FrmCadCentroCusto.Show;
end;

procedure TFrmMenu.BtnCadFornecedorClick(Sender: TObject);
begin
  FrmCadFornecedor.OpForn:='I';
  FrmCadFornecedor.Parent := PnChama;
  FrmCadFornecedor.Align := alClient;
  FrmCadFornecedor.Show;
end;

procedure TFrmMenu.BtnCadLancamentoClick(Sender: TObject);
begin
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
  Close;
end;



end.
