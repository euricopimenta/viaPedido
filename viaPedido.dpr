program viaPedido;

uses
  Vcl.Forms,
  View.Pedido in 'View\View.Pedido.pas' {frm_Pedido},
  View.itens in 'View\View.itens.pas' {frm_Itens},
  View.Main in 'View\View.Main.pas' {frm_Main},
  Model.DataModule in 'Model\Model.DataModule.pas' {DM_viaPedidos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TDM_viaPedidos, DM_viaPedidos);
  Application.Run;
end.
