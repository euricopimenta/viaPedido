unit View.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCalendars, Vcl.WinXCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Controller.Pedido;

type
  Tfrm_Pedido = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    shpPedido: TShape;
    btnVoltar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnRemoverPedido: TSpeedButton;
    pnlClient: TPanel;
    dbgPedidos: TDBGrid;
    pnlControls: TPanel;
    Shape1: TShape;
    btnAdd: TSpeedButton;
    btnRemoverItem: TSpeedButton;
    edtNumero: TEdit;
    edtCliente: TEdit;
    dateEdtPedido: TCalendarPicker;
    pnlItens: TPanel;
    edtCodItem: TEdit;
    edtDescricaoItem: TEdit;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    edtValorTotal: TEdit;
    btnNovoPedido: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDescricaoItemEnter(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Reiniciar;
  public
    { Public declarations }
  end;

var
  frm_Pedido: Tfrm_Pedido;
  Controller : TPedidoController;
implementation
Uses 
  Model.Pedido.Item, Model.Pedido;
  
{$R *.dfm}


procedure Tfrm_Pedido.edtDescricaoItemEnter(Sender: TObject);
begin
  if edtNumero.Text = EmptyStr then
    raise Exception.Create('Preencha o campo : Número');

  try
    edtDescricaoItem.Text := Controller.getNomeItem(edtNumero.Text);  
  except on E: Exception do
    ShowMessage('Item não encontrado'); 
    
  end; 


end;

procedure Tfrm_Pedido.FormCreate(Sender: TObject);
begin
  Controller := TPedidoController.Create;
  dbgPedidos.DataSource := Controller.dtsPedido;
  Reiniciar;

end;

procedure Tfrm_Pedido.Reiniciar;
begin
  dateEdtPedido.Date := Now;
  edtNumero.Text := Controller.getNovoCod;

end;

procedure Tfrm_Pedido.btnNovoPedidoClick(Sender: TObject);
Var
  objPedido : TPedido;
begin
  objPedido := TPedido.Create;
  Try
    With objPedido do
    Begin 
      IDPedido := Controller.getNovoCod.ToInteger;
      NomeCliente := edtCliente.Text;
      Numero := StrToInt(edtNumero.Text);      
    End;                                     
  Finally
    
  End;
  
end;

procedure Tfrm_Pedido.btnVoltarClick(Sender: TObject);
begin
  Parent.SetFocus;
  Free;
end;



end.
