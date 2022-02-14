unit Controller.Pedido;

interface
Uses
  Model.Pedido, Model.Pedido.Item, Model.DataModule, Data.DB;

  Type TPedidoController = Class
  private
    objPedido : TPedido;
    FdtsPedido: TDataSource;
    procedure SetdtsPedido(const Value: TDataSource);
    procedure salvarItem;

  published
    Property dtsPedido : TDataSource read FdtsPedido write SetdtsPedido;
    Function getNovoCod : String;
    Function getNomeItem(ACod : String) : String;
    Procedure criarPedido(APedido:TPedido);
    Procedure addItemPedido(AItemPedido:TPedidoItem);
    Constructor Create;
    destructor Destroy ; Override;
  End;


implementation

uses
  System.SysUtils;

{ TPedidoController }

procedure TPedidoController.addItemPedido(AItemPedido:TPedidoItem);
Begin
     //
end;

constructor TPedidoController.Create;
begin
  SetdtsPedido(DataBase.dtsPedidoItem);
  DataBase.qryPedidoItem.Active := True;
end;

procedure TPedidoController.criarPedido(APedido:TPedido);
begin

end;

function TPedidoController.getNomeItem(ACod: String): String;

begin

    With DataBase.Query do
    Begin
      Open('Select DESC_ITEM as NOME from item where id_item = '+ ACod);
      Result := FieldValues['NOME'];

    End;

end;

function TPedidoController.getNovoCod: String;
begin
  With DataBase.Query do
  Begin
    Open('Select Coalesce(MAX(ID_PEDIDO_CAB),0)+1 ID FROM PEDIDOCAB');
    Result := IntToStr(FieldValues['ID']);

  End;

end;

procedure TPedidoController.salvarItem;
begin
//  With objPedido do
//  Try
//    With DataBase.qryItem do
//    Begin
//
//      if isAlterar then Edit Else Insert;
//
//      FieldByName('ID_ITEM').AsInteger := objItem.ID;
//      FieldByName('DESC_ITEM').AsString := objItem.Descricao;
//      Refresh;
//    End;
//  Finally
//
//  End;
end;

procedure TPedidoController.SetdtsPedido(const Value: TDataSource);
begin
  FdtsPedido := Value;
end;

destructor TPedidoController.Destroy;
begin
  objPedido.Free;
  DataBase.qryPedidoItem.Active := False;
  inherited;
end;

end.
