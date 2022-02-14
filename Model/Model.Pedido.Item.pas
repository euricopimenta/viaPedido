unit Model.Pedido.Item;

interface
Uses Model.Item;

  Type TPedidoItem = Class
  private
    FIDPedidoItem: Integer;
    FValUnitario: Double;
    FQuantidade: Double;
    FValTotal: Double;
    procedure SetIDPedidoItem(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetValTotal(const Value: Double);
    procedure SetValUnitario(const Value: Double);
  published
    Item : TItem;
    Property IDPedidoItem : Integer read FIDPedidoItem write SetIDPedidoItem;
    Property Quantidade : Double read FQuantidade write SetQuantidade;
    Property ValUnitario : Double read FValUnitario write SetValUnitario;
    Property ValTotal : Double read FValTotal write SetValTotal;
  Public
    Constructor Create ;
    Destructor Destroy ; Override;

  End;

implementation

{ TPedidoItem }


constructor TPedidoItem.Create;
begin
  Item := TItem.Create;
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

destructor TPedidoItem.Destroy;
begin
  Item.Free;
  inherited;
end;

end.
