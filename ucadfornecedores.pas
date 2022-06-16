unit uCadFornecedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, UModulo;

type

  { TFrmCadFornecedor }

  TFrmCadFornecedor = class(TForm)
    BtnCnpj: TRadioButton;
    BtnAtivo: TRadioButton;
    BtnCpf: TRadioButton;
    BtnInativo: TRadioButton;
    BtnSair: TSpeedButton;
    BtnSalvar: TSpeedButton;
    CboUf: TComboBox;
    EdtCpfCnpj: TEdit;
    EdtDTNasc: TEdit;
    EdtBairro: TEdit;
    EdtCel: TEdit;
    EdtCep: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    EdtEmail: TEdit;
    EdtEndereco: TEdit;
    EdtFantasia: TEdit;
    EdtInsEstadual: TEdit;
    EdtInsMunicipal: TEdit;
    EdtNome: TEdit;
    EdtNumero: TEdit;
    EdtTel: TEdit;
    GrpCnpjCpf: TGroupBox;
    GrpStatus: TGroupBox;
    LblNomeRazao: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    LblDta: TLabel;
    Label3: TLabel;
    LblCpfCnpj: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblMensagem: TLabel;
    MemObs: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnAtivoChange(Sender: TObject);
    procedure BtnCnpjChange(Sender: TObject);
    procedure BtnCpfChange(Sender: TObject);
    procedure BtnInativoChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrpCnpjCpfClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private

  public

  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;

implementation

{$R *.lfm}

{ TFrmCadFornecedor }


procedure TFrmCadFornecedor.Label7Click(Sender: TObject);
begin

end;

procedure TFrmCadFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornecedor.BtnCnpjChange(Sender: TObject);
begin
  //EdtCpfCnpj.EditMask := '00.000.000/0000-00;1;_';
  LblCpfCnpj.Caption := 'CNPJ';
  LblNomeRazao.Caption := 'Razão Social';
  LblDta.Caption := 'Data Emissão';
  EdtFantasia.Enabled := True;
  EdtInsEstadual.Enabled := True;
  EdtInsMunicipal.Enabled := True;
end;

procedure TFrmCadFornecedor.BtnAtivoChange(Sender: TObject);
begin
  BtnAtivo.Enabled := True;
  BtnAtivo.Checked := True;
end;

procedure TFrmCadFornecedor.BtnCpfChange(Sender: TObject);
begin
  //EdtCpfCnpj.EditMask := '000.000.000-00;1;_';
  LblCpfCnpj.Caption := 'CPF';
  LblNomeRazao.Caption := 'Nome';
  LblDta.Caption := 'Data Nascimento';
  EdtFantasia.Enabled := False;
  EdtInsEstadual.Enabled := False;
  EdtInsMunicipal.Enabled := False;
end;

procedure TFrmCadFornecedor.BtnInativoChange(Sender: TObject);
begin
  BtnInativo.Enabled := False;
end;

procedure TFrmCadFornecedor.BtnSalvarClick(Sender: TObject);
begin
  //CNPJ
  if (BtnCnpj.Checked = True) then
  begin
    if EdtCpfCnpj.Text = '' then
    begin
      ShowMessage('Campo CNPJ obrigatório!');
    end
    else if (EdtNome.Text = '') then
    begin
      ShowMessage('Campo Rezão Social obrigatório!');
    end
    else if (EdtFantasia.Text = '') then
    begin
      ShowMessage('Campo Nome Fantasia obrigatório!');
    end
    else if (EdtInsEstadual.Text = '') then
    begin
      ShowMessage('Campo Inscrição Estadual obrigatório!');
    end
    else if (EdtInsMunicipal.Text = '') then
    begin
      ShowMessage('Campo Inscrição Municipal obrigatório!');
    end
    else if (EdtDTNasc.Text = '') then
    begin
      ShowMessage('Campo Data Emissão obrigatório!');
    end
    else if (EdtEndereco.Text = '') then
    begin
      ShowMessage('Campo Endereço obrigatório!');
    end
    else if (EdtNumero.Text = '') then
    begin
      ShowMessage('Campo Numero obrigatório!');
    end
    else if (EdtBairro.Text = '') then
    begin
      ShowMessage('Campo Bairro obrigatório!');
    end
    else if (EdtCep.Text = '') then
    begin
      ShowMessage('Campo CEP obrigatório!');
    end
    else if (EdtCidade.Text = '') then
    begin
      ShowMessage('Campo Cidade obrigatório!');
    end
    else if (CboUf.Caption = 'UF') then
    begin
      ShowMessage('Campo Estado obrigatório!');
    end
    else if (EdtCel.Text = '') then
    begin
      ShowMessage('Campo Celular obrigatório!');
    end
    else
    begin

      EdtCpfCnpj.Clear;
      EdtNome.Clear;
      EdtFantasia.Clear;
      EdtInsEstadual.Clear;
      EdtInsMunicipal.Clear;
      EdtDTNasc.Clear;
      EdtEndereco.Clear;
      EdtNumero.Clear;
      EdtComplemento.Clear;
      EdtBairro.Clear;
      EdtCep.Clear;
      EdtCidade.Clear;
      CboUf.Caption := 'UF';
      EdtTel.Clear;
      EdtCel.Clear;
      EdtEmail.Clear;
      MemObs.Clear;
    end;
  end;

  if (btncpf.Checked = True) then
    if (EdtCpfCnpj.Text = '') then
    begin
      ShowMessage('Campo CPF obrigatório!');
    end
    else if (EdtNome.Text = '') then
    begin
      ShowMessage('Campo Nome obrigatório!');
    end
    else if (EdtDTNasc.Text = '') then
    begin
      ShowMessage('Campo Data de Nascimento obrigatório!');
    end
    else if (EdtEndereco.Text = '') then
    begin
      ShowMessage('Campo Endereço obrigatório!');
    end
    else if (EdtNumero.Text = '') then
    begin
      ShowMessage('Campo Numero obrigatório!');
    end
    else if (EdtBairro.Text = '') then
    begin
      ShowMessage('Campo Bairro obrigatório!');
    end
    else if (EdtCep.Text = '') then
    begin
      ShowMessage('Campo CEP obrigatório!');
    end
    else if (EdtCidade.Text = '') then
    begin
      ShowMessage('Campo Cidade obrigatório!');
    end
    else if (CboUf.Caption = 'UF') then
    begin
      ShowMessage('Campo Estado obrigatório!');
    end
    else if (EdtCel.Text = '') then
    begin
      ShowMessage('Campo Celular obrigatório!');
    end
    else
    begin

      LblMensagem.Caption := 'Dados Gravados';

      EdtCpfCnpj.Clear;
      EdtNome.Clear;
      EdtDTNasc.Clear;
      EdtEndereco.Clear;
      EdtNumero.Clear;
      EdtComplemento.Clear;
      EdtBairro.Clear;
      EdtCep.Clear;
      EdtCidade.Clear;
      CboUf.Caption := 'UF';
      EdtTel.Clear;
      EdtCel.Clear;
      EdtEmail.Clear;
      MemObs.Clear;
    end;

end;

procedure TFrmCadFornecedor.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dm.ZQConsPessoas.Active := False;

end;

procedure TFrmCadFornecedor.FormCreate(Sender: TObject);
begin
  BtnInativo.Enabled := False;
end;

procedure TFrmCadFornecedor.FormResize(Sender: TObject);
begin
  Panel2.Left := (Panel1.ClientWidth div 2) - (Panel2.Width div 2);
  Panel2.Top := (Panel1.ClientHeight div 2) - (Panel2.Height div 2);
end;

procedure TFrmCadFornecedor.FormShow(Sender: TObject);
begin
  dm.ZQConsPessoas.Active := True;
end;

procedure TFrmCadFornecedor.GrpCnpjCpfClick(Sender: TObject);
begin

end;

end.
