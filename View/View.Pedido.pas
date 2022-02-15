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
    procedure edtCodItemKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    { Private declarations }
    Procedure Reiniciar;
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

procedure Tfrm_Pedido.edtCodItemKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #10 then
    edtDescricaoItemEnter(Self);
  
end;

procedure Tfrm_Pedido.edtDescricaoItemEnter(Sender: TObject);
begin
  if StrToInt(edtCodItem.Text) > 0 then
  try
    edtDescricaoItem.Text := Controller.getNomeItem(edtCodItem.Text);  
  except
    ShowMessage('Item não encontrado'); 
    
  end; 

end;

procedure Tfrm_Pedido.edtValorExit(Sender: TObject);
Var
  Total : Currency;
begin  
  Total := StrToFloat(edtQuantidade.Text) * StrToFloat(edtValor.Text);   
  edtValorTotal.Text := CurrToStrF(Total,ffNumber,2);
   
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
      Quantidade := StrToFloat(edtQuantidade.Text);
      ValUnitario := StrToFloat(edtValor.Text);
      ValTotal := StrToFloat(edtValorTotal.Text);
      
    End;
    objPedido.addItemPedido(objItemPedido);
    
  finally    
    objItemPedido.Free;
  end;
 
end;

procedure Tfrm_Pedido.btnNovoPedidoClick(Sender: TObject);
begin
  objPedido := TPedido.Create;
  Try
    With objPedido do
    Begin 
      IDPedido := Controller.getNovoCod.ToInteger;
      NomeCliente := edtCliente.Text;
      Numero := StrToInt(edtNumero.Text);
      SalvarPedido;
    End;
  Finally

  End;  
  
  mostrarControles(True);
  btnNovoPedido.Enabled := False;  
  
end;

procedure Tfrm_Pedido.btnVoltarClick(Sender: TObject);
begin
  if btnNovoPedido.Enabled = False then
    Reiniciar
  Else 
  Begin 
    Parent.SetFocus;
    FreeAndNil(Self);
  End;
end;

end.
