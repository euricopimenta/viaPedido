program viaPedido;

uses
  Vcl.Forms,
  View.Pedido in 'View\View.Pedido.pas' {frm_Pedido},
  View.itens in 'View\View.itens.pas' {frm_Itens},
  View.Main in 'View\View.Main.pas' {frm_Main},
  Model.DataModule in 'Model\Model.DataModule.pas' {DataBase: TDataModule},
  Model.Item in 'Model\Model.Item.pas',
  Model.Pedido.Item in 'Model\Model.Pedido.Item.pas',
  Model.Pedido in 'Model\Model.Pedido.pas',
  Controller.Item in 'Controller\Controller.Item.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TDataBase, DataBase);
  Application.Run;
end.
