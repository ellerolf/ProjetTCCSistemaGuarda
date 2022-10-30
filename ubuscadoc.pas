unit UBuscaDoc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, UModulo;

type

  { TFrmBuscaDoc }

  TFrmBuscaDoc = class(TForm)
    DBGrid1: TDBGrid;
    EdtBuscaTipoDoc: TEdit;
    Label7: TLabel;
    Panel1: TPanel;
    BtnBuscaTipoDoc: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnSelecionar: TSpeedButton;
    procedure BtnBuscaTipoDocClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private

  public
        //variavel abaixo é responsável por identificar de onde está sendo solicitado
        //para alterar o tipo de documento.
        BuscaDocTela:String;
  end;

var
  FrmBuscaDoc: TFrmBuscaDoc;

implementation

{$R *.lfm}

{ TFrmBuscaDoc }
uses uCadLancamento,UConsBaixa;

procedure TFrmBuscaDoc.BtnCancelarClick(Sender: TObject);
begin
  BuscaDocTela:='';
  EdtBuscaTipoDoc.Clear;
  close;
end;

procedure TFrmBuscaDoc.BtnBuscaTipoDocClick(Sender: TObject);
begin
  if (BuscaDocTela='lanc') then
  begin
  if (FrmCadLancamento.ChkReceita.Checked=True) then
      begin
          dm.ZQBuscaTipoDoc.Close;
          dm.ZQBuscaTipoDoc.SQL.Clear;
          dm.ZQBuscaTipoDoc.SQL.Add('select * from tipo_documento where DOCTIPO=1 AND DOCNOME LIKE'+QuotedStr('%'+EdtBuscaTipoDoc.Text+'%'));
          DM.ZQBuscaTipoDoc.Open;
          EdtBuscaTipoDoc.Clear;
      end;
    if (FrmCadLancamento.ChkDespesa.Checked=True) then
      begin
          dm.ZQBuscaTipoDoc.Close;
          dm.ZQBuscaTipoDoc.SQL.Clear;
          dm.ZQBuscaTipoDoc.SQL.Add('select * from tipo_documento where DOCTIPO=0 AND DOCNOME LIKE'+QuotedStr('%'+EdtBuscaTipoDoc.Text+'%'));
          DM.ZQBuscaTipoDoc.Open;
          EdtBuscaTipoDoc.Clear;
      end;
  end;

    if (BuscaDocTela='consbaix') then
  begin
  if (FrmConsBaixa.ChkReceita.Checked=True) then
      begin
          dm.ZQBuscaTipoDoc.Close;
          dm.ZQBuscaTipoDoc.SQL.Clear;
          dm.ZQBuscaTipoDoc.SQL.Add('select * from tipo_documento where DOCTIPO=1 AND DOCNOME LIKE'+QuotedStr('%'+EdtBuscaTipoDoc.Text+'%'));
          DM.ZQBuscaTipoDoc.Open;
          EdtBuscaTipoDoc.Clear;
      end;
    if (FrmConsBaixa.ChkDespesa.Checked=True) then
      begin
          dm.ZQBuscaTipoDoc.Close;
          dm.ZQBuscaTipoDoc.SQL.Clear;
          dm.ZQBuscaTipoDoc.SQL.Add('select * from tipo_documento where DOCTIPO=0 AND DOCNOME LIKE'+QuotedStr('%'+EdtBuscaTipoDoc.Text+'%'));
          DM.ZQBuscaTipoDoc.Open;
          EdtBuscaTipoDoc.Clear;
      end;
  end;
end;

procedure TFrmBuscaDoc.BtnSelecionarClick(Sender: TObject);
begin
  if (BuscaDocTela='lanc') then
    begin
         if (FrmCadLancamento.NdoDocSelecionado>0) then
           begin
                FrmCadLancamento.EdtTipoDocumento.Text:=IntToStr(FrmCadLancamento.NdoDocSelecionado);
                EdtBuscaTipoDoc.Clear;
                FrmCadLancamento.NdoDocSelecionado:=0;
                Close;
           end;
         EdtBuscaTipoDoc.Clear;
         Close;
    end;

  if (BuscaDocTela='consbaix') then
    begin
         if (FrmConsBaixa.NdoDocumentoSelecionado>0) then
           begin
                FrmConsBaixa.EdtTipoDocumento.Text:=IntToStr(FrmConsBaixa.NdoDocumentoSelecionado);
                EdtBuscaTipoDoc.Clear;
                FrmConsBaixa.NdoDocumentoSelecionado:=0;
                close;
           end;
         EdtBuscaTipoDoc.Clear;
         Close;
    end;
end;

procedure TFrmBuscaDoc.DBGrid1CellClick(Column: TColumn);
begin
     if (BuscaDocTela='lanc') then
     begin
        FrmCadLancamento.NdoDocSelecionado:=DM.ZQBuscaTipoDocDOCCODIGO.AsInteger;
     end;

     if (BuscaDocTela='consbaix') then
    begin
        FrmConsBaixa.NdoDocumentoSelecionado:=DM.ZQBuscaTipoDocDOCCODIGO.AsInteger;
    end;
end;

procedure TFrmBuscaDoc.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    DM.ZQBuscaTipoDoc.Active:=False;
end;

procedure TFrmBuscaDoc.FormShow(Sender: TObject);
begin
  DM.ZQBuscaTipoDoc.Active:=True;
end;

procedure TFrmBuscaDoc.Label7Click(Sender: TObject);
begin

end;

end.

