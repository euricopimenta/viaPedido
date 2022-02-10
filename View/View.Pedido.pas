unit View.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCalendars, Vcl.WinXCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Model.DataModule;

type
  Tfrm_Pedido = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    shpPedido: TShape;
    PageControl1: TPageControl;
    tabNovoPedido: TTabSheet;
    tabConsultaPedido: TTabSheet;
    pnlNovoPedido: TPanel;
    edtNumero: TEdit;
    edtCliente: TEdit;
    CalendarPicker1: TCalendarPicker;
    pnlItens: TPanel;
    edtCodItem: TEdit;
    edtDescricaoItem: TEdit;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    edtValorTotal: TEdit;
    btnVoltar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnRemoverPedido: TSpeedButton;
    edtPesqItem: TEdit;
    edtPesqCliente: TEdit;
    datePesqData: TCalendarPicker;
    chkPesqData: TCheckBox;
    chkPesqItem: TCheckBox;
    chkCliente: TCheckBox;
    pnlClient: TPanel;
    dbgPedidos: TDBGrid;
    pnlControls: TPanel;
    Shape1: TShape;
    btnAdd: TSpeedButton;
    btnRemoverItem: TSpeedButton;
    procedure tabConsultaPedidoShow(Sender: TObject);
    procedure tabNovoPedidoShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Pedido: Tfrm_Pedido;

implementation

{$R *.dfm}

procedure Tfrm_Pedido.tabConsultaPedidoShow(Sender: TObject);
begin
  pnlControls.Visible := False;
  btnRemoverPedido.Visible := False;
  btnSalvar.Visible := False;
end;

procedure Tfrm_Pedido.tabNovoPedidoShow(Sender: TObject);
begin
  pnlControls.Visible := True;
  btnRemoverPedido.Visible := True;
  btnSalvar.Visible := True;
end;

end.
