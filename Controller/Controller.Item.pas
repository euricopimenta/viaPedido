unit Controller.Item;

interface
Uses Model.Item;

  Type TItemController = Class
    objItem : TItem;
  Public
    Procedure SalvarItem;
    Procedure ApagarItem;
    Function getNovoCod : String;
    Constructor Create;
    Destructor Destroy ; Override;
  End;

implementation

{ TItemController }

constructor TItemController.Create;
begin
  objItem := TItem.Create;
end;

procedure TItemController.ApagarItem;
begin

end;

function TItemController.getNovoCod: String;
begin
  Result := objItem.getNovoCod;
end;

procedure TItemController.SalvarItem;
begin

end;

destructor TItemController.Destroy;
begin
  objItem.DisposeOf;

  inherited;
end;

end.
