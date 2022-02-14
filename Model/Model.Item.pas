unit Model.Item;

interface


  Type TItem = Class
  private
    FDescricao: String;
    FID: Integer;
    procedure SetCod(const Value: Integer);
    procedure SetDescricao(const Value: String);
  published
    Property ID : Integer read FID write SetCod;
    Property Descricao : String read FDescricao write SetDescricao;

  End;

implementation

uses
  System.SysUtils, System.Variants;

{ TItem }

procedure TItem.SetCod(const Value: Integer);
begin
  if Value = Null then
    raise Exception.Create('O Item precisa de um Código');
  FID := Value;
end;

procedure TItem.SetDescricao(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('Descrição precisa ser preenchida');
  FDescricao := Value;
end;

end.
