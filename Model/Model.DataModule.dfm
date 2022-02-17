object DataBase: TDataBase
  OldCreateOrder = False
  Height = 310
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
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvRefreshMode, uvCheckReadOnly]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.CheckReadOnly = False
    SQL.Strings = (
      'select * from Item order by ID_ITEM')
    Left = 64
    Top = 120
    object qryItemID_ITEM: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 9
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryItemDESC_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 90
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      Size = 100
    end
  end
  object qryPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pedidocab')
    Left = 64
    Top = 176
  end
  object dtsPedido: TDataSource
    DataSet = qryPedido
    Left = 144
    Top = 176
  end
  object qryPedidoItem: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '    P.id_item "C'#243'digo",'
      '    i.desc_item "Descri'#231#227'o",'
      '    p.quantidade "Quant",'
      '    p.valor_unitario "Valor",'
      '    p.valor_total "Total"'
      'from pedidoitem p'
      'Left outer join item i on i.id_item = p.id_item'
      'where p.id_pedido_cab = :IDPedido')
    Left = 64
    Top = 240
    ParamData = <
      item
        Name = 'IDPEDIDO'
        ParamType = ptInput
      end>
    object qryPedidoItemCódigo: TIntegerField
      FieldName = 'C'#243'digo'
      Origin = 'ID_ITEM'
      Required = True
    end
    object qryPedidoItemDescrição: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Descri'#231#227'o'
      Origin = 'DESC_ITEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPedidoItemQuant: TFloatField
      FieldName = 'Quant'
      Origin = 'QUANTIDADE'
    end
    object qryPedidoItemValor: TFloatField
      FieldName = 'Valor'
      Origin = 'VALOR_UNITARIO'
      currency = True
    end
    object qryPedidoItemTotal: TFloatField
      FieldName = 'Total'
      Origin = 'VALOR_TOTAL'
      currency = True
    end
  end
  object dtsPedidoItem: TDataSource
    DataSet = qryPedidoItem
    Left = 144
    Top = 240
  end
  object dtsItem: TDataSource
    DataSet = qryItem
    Left = 148
    Top = 120
  end
  object Query: TFDQuery
    Connection = FDConnection1
    Left = 104
    Top = 64
  end
end
