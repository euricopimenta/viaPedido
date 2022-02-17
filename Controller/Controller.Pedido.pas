unit Controller.Pedido;

interface
Uses
  Model.Pedido, Model.Pedido.Item, Model.DataModule, Data.DB, Vcl.Forms;

  Type TPedidoController = Class
  private
    FdtsPedido: TDataSource;
    procedure SetdtsPedido(const Value: TDataSource);

  published
    Property dtsPedido : TDataSource read FdtsPedido write SetdtsPedido;
    Function getNovoCod : String;
    Function getNomeItem(ACod : String) : String;
    Procedure delItemPedido(ACod : String);
    Function BuscarPedidos(Sender:TForm): TPedido;
    Function CalculaTotalItem (AQuant,AValor : String) : String;
    Constructor Create;
    destructor Destroy ; Override;
  End;

implementation

uses
  System.SysUtils,Dialogs,
  View.Pedido.Pesquisa;
{ TPedidoController }



function TPedidoController.CalculaTotalItem(AQuant, AValor: String): String;
Var
  iQuant,iValor : Currency;
begin
  If TryStrToCurr(AQuant,iQuant) then
    If TryStrToCurr(AValor,iValor) then
      Result := CurrToStrF(iQuant * iValor,ffNumber,2) //Retorna Total calculado
    Else
      raise Exception.Create('Valor Inválido')
  Else
   raise Exception.Create('Quantidade Inválida')

end;


Function TPedidoController.BuscarPedidos(Sender:TForm) : TPedido;
begin
  //Carrega e Chama a tela de Pesquisa de Pedidos

  Application.CreateForm(Tfrm_Pesquisa,frm_Pesquisa);
  frm_Pesquisa.Parent := Sender.Parent;
  frm_Pesquisa.dbgPedidos.DataSource := Database.dtsPedido;
  frm_Pesquisa.btnPesquisarClick(nil);
  frm_Pesquisa.Show;

end;

constructor TPedidoController.Create;
begin
  SetdtsPedido(DataBase.dtsPedidoItem);
  DataBase.qryPedidoItem.Active := True;

end;

procedure TPedidoController.delItemPedido(ACod: String);
begin
  if MessageDlg('Remover Item ?',mtWarning,mbYesNo,1) = 6 then
    DataBase.qryPedidoItem.Delete;

end;

function TPedidoController.getNomeItem(ACod: String): String;
begin
  DataBase.Query.Open('Select DESC_ITEM as NOME from item where id_item = :COD',[ACod.ToInteger]);
  Result := DataBase.Query.FieldValues['NOME'];

end;

function TPedidoController.getNovoCod: String;
begin
  With DataBase.Query do
  Begin
    Open('Select Coalesce(MAX(ID_PEDIDO_CAB),0)+1 ID FROM PEDIDOCAB');
    Result := IntToStr(FieldValues['ID']);
  End;

end;

procedure TPedidoController.SetdtsPedido(const Value: TDataSource);
begin
  FdtsPedido := Value;
end;


destructor TPedidoController.Destroy;
begin
  DataBase.qryPedidoItem.Active := False;

  inherited;
end;

end.
