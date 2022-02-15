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
    Procedure addItemPedido (AItem : TPedidoItem);
    Function CountItemPedido : Integer;
    Constructor Create;
    Destructor Destroy; Override;

  End;

implementation
uses
  System.SysUtils;

{ TPedido }


constructor TPedido.Create;
begin
  LItensPedido := TObjectList<TPedidoItem>.Create;
end;

procedure TPedido.SalvarPedido;
begin
  With DataBase.qryPedido do
    Try
      ExecSQL(
        'update or insert into PEDIDOCAB (ID_PEDIDO_CAB, DT_EMISSAO, NUMERO, CLIENTE)'+
        'VALUES (:ID_PEDIDO_CAB, :DT_EMISSAO, :NUMERO, :CLIENTE) matching (ID_PEDIDO_CAB)',
          [IDPedido,
          FormatDateTime('dd.mm.yyyy',Self.Data),
          Numero,
          NomeCliente]
      );

    Except
      raise Exception.Create('Erro ao gravar pedido');
    End;

end;

procedure TPedido.addItemPedido(AItem: TPedidoItem);
begin
  Try
    DataBase.qryPedidoItem.ExecSQL(
      'update or insert into PEDIDOITEM (ID_PEDIDO_CAB, ID_ITEM, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) '+
      'values (:ID_PEDIDO_CAB, :ID_ITEM, :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL) matching (ID_ITEM,ID_PEDIDO_CAB) ',
        [Self.IDPedido, //ID_PEDIDO_CAB
        AItem.IDItem, //ID_ITEM
        AItem.Quantidade, //QUANTIDADE
        AItem.ValUnitario, //VALOR_UNITARIO
        AItem.ValTotal] //VALOR_TOTAL
    );
  Except
    raise Exception.Create('Erro ao salvar Item');
  End;

  Try
    With DataBase.qryPedidoItem Do
    Begin
      ExecSQL(SQL.Text,[IDPedido]);
      Active := True;
    End;
  Except
    raise Exception.Create('Erro ao atualizar Grid');
  End;

end;

function TPedido.CountItemPedido: Integer;
begin
  Result := LItensPedido.Count;
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
  if Value = EmptyStr then
    raise Exception.Create('O Nome do Cliente precisa ser preenchido');
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
