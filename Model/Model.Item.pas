unit Model.Item;

interface
Uses Model.DataModule;

  Type TItem = Class
  private
    FDescricao: String;
    FID: Integer;
    procedure SetCod(const Value: Integer);
    procedure SetDescricao(const Value: String);
  published
    Property ID : Integer read FID write SetCod;
    Property Descricao : String read FDescricao write SetDescricao;
  Public
    Function getNovoCod : String; //Vamos inicializar a rotina com um novo cod;
    Function carregaItem (ACod : Integer) : TItem ;
    Procedure SalvarItem(AItem : TItem);
    Procedure DeletarItem(AItem : TItem);
  End;

implementation

uses
  System.SysUtils;

{ TItem }


function TItem.carregaItem(ACod: Integer): TItem;
begin

end;

procedure TItem.DeletarItem(AItem: TItem);
begin

end;

function TItem.getNovoCod: String;
begin
  With DataBase.qryItem do
  Begin
    Open('Select Coalesce(MAX(ID_ITEM),0)+1 ID FROM ITEM');
    Result := IntToStr(FieldValues['ID']);
  End;
end;

procedure TItem.SalvarItem(AItem: TItem);
begin

end;

procedure TItem.SetCod(const Value: Integer);
begin
  FID := Value;
end;

procedure TItem.SetDescricao(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('Descrição precisa ser preenchida');
  FDescricao := Value;
end;

end.
