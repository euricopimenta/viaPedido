unit Model.DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TDataBase = class(TDataModule)
    FDConnection1: TFDConnection;
    qryItem: TFDQuery;
    qryPedido: TFDQuery;
    dtsPedido: TDataSource;
    qryPedidoItem: TFDQuery;
    dtsPedidoItem: TDataSource;
    qryPedidoID_PEDIDO_CAB: TIntegerField;
    qryPedidoDT_EMISSAO: TDateField;
    qryPedidoNUMERO: TIntegerField;
    qryPedidoCLIENTE: TStringField;
    dtsItem: TDataSource;
    Query: TFDQuery;
    qryItemID_ITEM: TIntegerField;
    qryItemDESC_ITEM: TStringField;
    qryPedidoItemCódigo: TIntegerField;
    qryPedidoItemDescrição: TStringField;
    qryPedidoItemQuant: TFloatField;
    qryPedidoItemValor: TFloatField;
    qryPedidoItemTotal: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataBase: TDataBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
