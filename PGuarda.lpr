program PGuarda;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, UEntrarUsuario, umenu, uCadUsuario,
  uCadContasBancarias, uCadCentroCusto, uCadFornecedores, uCadLancamento,
  UConsFornecedores, UConsBaixa, UConsContas, UModulo, UBuscaConta,
  UTranfContas, UConsUsuario, uConsCentro, UBuscaDoc, UCadPagamento, 
Ferramentas;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmCadContasBancarias, FrmCadContasBancarias);
  Application.CreateForm(TFrmCadFornecedor, FrmCadFornecedor);
  Application.CreateForm(TFrmCadCentroCusto, FrmCadCentroCusto);
  Application.CreateForm(TFrmCadUsuario, FrmCadUsuario);
  Application.CreateForm(TFrmCadLancamento, FrmCadLancamento);
  Application.CreateForm(TFrmConsFornecedores, FrmConsFornecedores);
  Application.CreateForm(TFrmConsBaixa, FrmConsBaixa);
  Application.CreateForm(TFrmConsContas, FrmConsContas);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmBuscaConta, FrmBuscaConta);
  Application.CreateForm(TFrmTranfContas, FrmTranfContas);
  Application.CreateForm(TFrmConsUsuario, FrmConsUsuario);
  Application.CreateForm(TFrmConsCentro, FrmConsCentro);
  Application.CreateForm(TFrmBuscaDoc, FrmBuscaDoc);
  Application.CreateForm(TFrmCadParcela, FrmCadParcela);
  Application.CreateForm(TFrmEntrarUsuario, FrmEntrarUsuario);
  Application.Run;
end.

