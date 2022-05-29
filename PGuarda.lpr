program PGuarda;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, UEntrarUsuario, umenu, uCadUsuario, uCadContasBancarias,
  uCadCentroCusto, uCadFornecedores, uCadLancamento, UConsFornecedores,
UConsBaixa, UConsContas;

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
  Application.CreateForm(TFrmEntrarUsuario, FrmEntrarUsuario);
  Application.CreateForm(TFrmCadLancamento, FrmCadLancamento);
  Application.CreateForm(TFrmConsFornecedores, FrmConsFornecedores);
  Application.CreateForm(TFrmConsBaixa, FrmConsBaixa);
  Application.CreateForm(TFrmConsContas, FrmConsContas);
  Application.Run;
end.

