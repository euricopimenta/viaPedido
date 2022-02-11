unit Model.Pedido;

interface
Uses Model.Pedido.Item, System.Classes, System.Generics.Collections;

  Type TPedido = Class
  private
    FNomeCliente: String;
    FNumero: Integer;
    FIDPedido: Integer;
    FData: TDateTime;
    ItensPedido : TObjectList<TPedidoItem>;
    procedure SetData(const Value: TDateTime);
    procedure SetIDPedido(const Value: Integer);
    procedure SetNomeCliente(const Value: String);
    procedure SetNumero(const Value: Integer);

  published
    Property IDPedido : Integer read FIDPedido write SetIDPedido;
    Property Data : TDateTime read FData write SetData;
    Property Numero : Integer read FNumero write SetNumero;
    Property NomeCliente : String read FNomeCliente write SetNomeCliente;

  Public
    Procedure addItensPedido(AItemPedido : TPedidoItem);
    Constructor Create;
    Destructor Destroy; Override;

  End;

implementation

{ TPedido }

procedure TPedido.addItensPedido(AItemPedido: TPedidoItem);
begin

end;

constructor TPedido.Create;
begin

end;

destructor TPedido.Destroy;
begin

  inherited;
end;

procedure TPedido.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TPedido.SetIDPedido(const Value: Integer);
begin
  FIDPedido := Value;
end;

procedure TPedido.SetNomeCliente(const Value: String);
begin
  FNomeCliente := Value;
end;

procedure TPedido.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
