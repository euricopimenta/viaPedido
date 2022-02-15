unit Model.Pedido.Item;

interface
Uses Model.Item;

  Type TPedidoItem = Class
  private
    FIDPedidoItem: Integer;
    FValUnitario: Double;
    FQuantidade: Double;
    FValTotal: Double;
    FIDItem: Integer;
    procedure SetIDPedidoItem(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetValTotal(const Value: Double);
    procedure SetValUnitario(const Value: Double);
    procedure SetIDItem(const Value: Integer);
  published
    Property IDPedidoItem : Integer read FIDPedidoItem write SetIDPedidoItem;
    Property IDItem : Integer read FIDItem write SetIDItem;
    Property Quantidade : Double read FQuantidade write SetQuantidade;
    Property ValUnitario : Double read FValUnitario write SetValUnitario;
    Property ValTotal : Double read FValTotal write SetValTotal;

  End;

implementation
uses
  System.SysUtils;

{ TPedidoItem }


procedure TPedidoItem.SetIDItem(const Value: Integer);
begin
  if Value < 1 then
    raise Exception.Create('Insira um código para o item');
  FIDItem := Value;
end;

procedure TPedidoItem.SetIDPedidoItem(const Value: Integer);
begin
  FIDPedidoItem := Value;
end;

procedure TPedidoItem.SetQuantidade(const Value: Double);
begin
  if Value <= 0 then
    raise Exception.Create('Insira a quantidade');
  FQuantidade := Value;
end;

procedure TPedidoItem.SetValTotal(const Value: Double);
begin
  FValTotal := Value;
end;

procedure TPedidoItem.SetValUnitario(const Value: Double);
begin
  if Value <= 0 then
    raise Exception.Create('Insira o Valor unitário');
  FValUnitario := Value;
end;


end.
