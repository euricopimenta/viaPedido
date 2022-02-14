unit Model.Pedido;

interface
Uses Model.Pedido.Item, Model.DataModule, Data.DB, System.Classes, System.Generics.Collections;

  Type TPedido = Class
  private
    FNomeCliente: String;
    FNumero: Integer;
    FIDPedido: Integer;
    FData: TDateTime;
    LItensPedido : TObjectList<TPedidoItem>;
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
    Procedure SalvarPedido;
    Procedure SalvarItemPedido;
    Constructor Create;
    Destructor Destroy; Override;

  End;

implementation
uses
  System.SysUtils, Dialogs;

{ TPedido }

constructor TPedido.Create;
begin
  LItensPedido := TObjectList<TPedidoItem>.Create;
end;

procedure TPedido.SalvarPedido;
begin
  With DataBase.Query do
    Try
      ExecSQL(
        'update or insert into PEDIDOCAB (ID_PEDIDO_CAB, DT_EMISSAO, NUMERO, CLIENTE)'+
        'VALUES (:ID_PEDIDO_CAB, :DT_EMISSAO, :NUMERO, :CLIENTE) matching (ID_PEDIDO_CAB)',
          FIDPedido,
          FormatDateTime('dd.mm.yyyy',FData),
          FNumero,
          FNomeCliente
      );

    Except on E:Exception do
      ShowMessage('Ao Salvar no objeto :' + E.Message);
    End;

end;

procedure TPedido.SalvarItemPedido;
Var
  I : Integer;
  ObjItemPedido : TPedidoItem;
begin
  With DataBase.Query do
    Try
      for ObjItemPedido in LItensPedido do
        ExecSQL(
          'update or insert into PEDIDOITEM (ID_PEDIDO_ITEM, ID_PEDIDO_CAB, ID_ITEM, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) '+
          'values (:ID_PEDIDO_ITEM, :ID_PEDIDO_CAB, :ID_ITEM, :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL) '+
          'matching (ID_PEDIDO_ITEM)',
            LItensPedido.IndexOf(ObjItemPedido), //ID_PEDIDO_ITEM
            FIdPedido, //ID_PEDIDO_CAB
            ObjItemPedido.Item.ID, //ID_ITEM
            ObjItemPedido.Quantidade, //QUANTIDADE
            ObjItemPedido.ValUnitario, //VALOR_UNITARIO
            ObjItemPedido.ValTotal //VALOR_TOTAL
        );

    Except on E:Exception do
      ShowMessage('Ao Salvar Itens :' + E.Message);
    End;

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

destructor TPedido.Destroy;
begin
  LItensPedido.Free;
  inherited;
end;

end.
