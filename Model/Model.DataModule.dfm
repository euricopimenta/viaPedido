object DM_viaPedidos: TDM_viaPedidos
  OldCreateOrder = False
  Height = 272
  Width = 252
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Eurico\Documents\VIASOFT\viaSuper\viaPedido\Da' +
        'tabase\DATABASE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 104
    Top = 8
  end
  object qryItem: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Item')
    Left = 56
    Top = 80
    object qryItemID_ITEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemDESC_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      Size = 100
    end
  end
  object dtsItem: TDataSource
    DataSet = qryItem
    Left = 136
    Top = 80
  end
  object qryPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pedidocab')
    Left = 56
    Top = 144
    object qryPedidoID_PEDIDO_CAB: TIntegerField
      FieldName = 'ID_PEDIDO_CAB'
      Origin = 'ID_PEDIDO_CAB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Origin = 'DT_EMISSAO'
    end
    object qryPedidoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryPedidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 100
    end
  end
  object dtsPedido: TDataSource
    DataSet = qryPedido
    Left = 136
    Top = 144
  end
  object qryPedidoItem: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pedidoitem')
    Left = 56
    Top = 208
    object qryPedidoItemID_PEDIDO_ITEM: TIntegerField
      FieldName = 'ID_PEDIDO_ITEM'
      Origin = 'ID_PEDIDO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoItemID_PEDIDO_CAB: TIntegerField
      FieldName = 'ID_PEDIDO_CAB'
      Origin = 'ID_PEDIDO_CAB'
      Required = True
    end
    object qryPedidoItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      Required = True
    end
    object qryPedidoItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryPedidoItemVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
    end
    object qryPedidoItemVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
  end
  object dtsPedidoItem: TDataSource
    DataSet = qryPedidoItem
    Left = 136
    Top = 208
  end
end
