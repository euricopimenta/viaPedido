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
    btnBuscarPedidos: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure edtCodItemKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure edtCodItemExit(Sender: TObject);
    procedure btnBuscarPedidosClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Reiniciar;
    Procedure resetPnlItens;
  public
    { Public declarations }
    Procedure mostrarControles(State : Boolean);
  end;

var
  frm_Pedido: Tfrm_Pedido;
  Controller : TPedidoController;
implementation
Uses 
  Model.Pedido.Item, Model.Pedido;

Var
  objPedido : TPedido;
   
{$R *.dfm}

procedure Tfrm_Pedido.FormCreate(Sender: TObject);
begin
  Controller := TPedidoController.Create;
  dbgPedidos.DataSource := Controller.dtsPedido;
  Reiniciar;

end;

procedure Tfrm_Pedido.mostrarControles(State : Boolean);
begin
  pnlClient.Visible := State;
  pnlItens.Visible := State;
  btnSalvar.Visible := State;
  btnRemoverPedido.Visible := State;

end;

procedure Tfrm_Pedido.edtCodItemExit(Sender: TObject);
var
  Ret : Integer;
begin
  if TryStrToInt(edtCodItem.Text,Ret) then
    try
      edtDescricaoItem.Text := Controller.getNomeItem(edtCodItem.Text);
      Next;
    except
      ShowMessage('Item não encontrado');
      resetPnlItens;
    end
  Else
    Exit

end;

procedure Tfrm_Pedido.edtCodItemKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #$D then
    Next
end;

procedure Tfrm_Pedido.edtValorExit(Sender: TObject);
begin
  edtValorTotal.Text := Controller.CalculaTotalItem(edtQuantidade.Text, edtValor.Text);
  btnAddClick(Self);
  resetPnlItens;

end;

procedure Tfrm_Pedido.Reiniciar;
begin   
  dateEdtPedido.Date := Now;
  edtNumero.Text := Controller.getNovoCod;
  edtCliente.Clear;
  btnNovoPedido.Enabled := True;
  mostrarControles(False);

end;

procedure Tfrm_Pedido.btnAddClick(Sender: TObject);
Var
  objItemPedido : TPedidoItem;
begin
  objItemPedido := TPedidoItem.Create;
  try
    with objItemPedido do
    Begin
      IDPedidoItem := objPedido.CountItemPedido;
      IDItem := StrToint(edtCodItem.Text);
      Quantidade := StrToCurr(edtQuantidade.Text);
      ValUnitario := StrToCurr(edtValor.Text);
      ValTotal := StrToCurr(edtValorTotal.Text);

    End;
    objPedido.addItemPedido(objItemPedido);   //Adiciona Item
  finally
    objItemPedido.Free;
  end;
 
end;

procedure Tfrm_Pedido.btnBuscarPedidosClick(Sender: TObject);
begin
  Controller.BuscarPedidos;
end;

procedure Tfrm_Pedido.btnNovoPedidoClick(Sender: TObject);
begin
  objPedido := TPedido.Create;
  Try
    With objPedido do
    Begin 
      IDPedido := Controller.getNovoCod.ToInteger;
      Data := dateEdtPedido.Date;
      NomeCliente := edtCliente.Text;
      Numero := StrToInt(edtNumero.Text);
      SalvarPedido;
    End;
  Finally

  End;  
  //Prepara a tela para receber os Itens.
  mostrarControles(True);
  btnNovoPedido.Enabled := False;
  edtCodItem.SetFocus;
  
end;

procedure Tfrm_Pedido.btnVoltarClick(Sender: TObject);
begin
  if btnNovoPedido.Enabled = False then
    Reiniciar //Limpa a rotina, para continuar lançando;
  Else 
  Begin
    Parent.SetFocus;
    FreeAndNil(Self);
  End;
end;

procedure Tfrm_Pedido.resetPnlItens;
Var
  I : Integer;
begin
  With pnlItens do
    for I := 0 to pnlItens.ControlCount-1 do
      if Controls[i] is TEdit then
        TEdit(Controls[i]).Clear;

  edtCodItem.SetFocus;
end;

end.
