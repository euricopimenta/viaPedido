unit Model.Pedido.Item;

interface
Uses Model.Item;

  Type TPedidoItem = Class
  private
    FIDPedidoItem: Integer;
    FValUnitario: Double;
    FQuantidade: Double;
    FIDPedido: Integer;
    FValTotal: Double;
    procedure SetIDPedido(const Value: Integer);
    procedure SetIDPedidoItem(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetValTotal(const Value: Double);
    procedure SetValUnitario(const Value: Double);
  published
    Item : TItem;
    Property IDPedidoItem : Integer read FIDPedidoItem write SetIDPedidoItem;
    Property IDPedido : Integer read FIDPedido write SetIDPedido;
    Property Quantidade : Double read FQuantidade write SetQuantidade;
    Property ValUnitario : Double read FValUnitario write SetValUnitario;
    Property ValTotal : Double read FValTotal write SetValTotal;
  End;

implementation

{ TPedidoItem }

procedure TPedidoItem.SetIDPedido(const Value: Integer);
begin
  FIDPedido := Value;
end;

procedure TPedidoItem.SetIDPedidoItem(const Value: Integer);
begin
  FIDPedidoItem := Value;
end;

procedure TPedidoItem.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TPedidoItem.SetValTotal(const Value: Double);
begin
  FValTotal := Value;
end;

procedure TPedidoItem.SetValUnitario(const Value: Double);
begin
  FValUnitario := Value;
end;

end.
