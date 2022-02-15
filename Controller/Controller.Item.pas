unit Controller.Item;

interface
Uses
  Model.Item,
  Model.DataModule,
  Data.DB;

  Type TItemController = Class
    objItem : TItem;
  private
    FDtsItem: TDataSource;
    procedure SetDtsItem(const Value: TDataSource);
  Public
    Procedure SalvarItem(ACod, ADesc : String; isAlterar : Boolean = False);
    Procedure ApagarItem;
    Function getNovoCod : String;
    Property dtsItem : TDataSource read FDtsItem write SetDtsItem;
    Constructor Create;
    destructor Destroy ; Override;
  End;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TItemController }

constructor TItemController.Create;
begin
  objItem := TItem.Create;
  SetDtsItem(DataBase.DtsItem);
  DataBase.qryItem.Active := True;
end;

function TItemController.getNovoCod: String;
begin
  With DataBase.Query do
  Begin
    Open('Select Coalesce(MAX(ID_ITEM),0)+1 ID FROM ITEM');
    Result := IntToStr(FieldValues['ID']);
  End;

end;

procedure TItemController.ApagarItem;
Var
  Opc : Integer;
begin
  Opc := MessageDlg('Confirma remoção do Item ?',mtConfirmation,mbYesNo,1);

  if Opc = 6 then
    With DataBase.qryItem do
    Begin
      Delete;
      Refresh;
    End;

end;

procedure TItemController.SalvarItem(ACod, ADesc : String; isAlterar : Boolean);
begin
  objItem.ID := StrToInt(ACod);
  objItem.Descricao := ADesc;

  Try
    With DataBase.qryItem do
    Begin

      if isAlterar then Edit Else Insert;
       
      FieldByName('ID_ITEM').AsInteger := objItem.ID;
      FieldByName('DESC_ITEM').AsString := objItem.Descricao;
      Refresh;
    End;
  Finally
    
  End;

end;

procedure TItemController.SetDtsItem(const Value: TDataSource);
begin
  FDtsItem := Value;
end;

destructor TItemController.Destroy;
begin
  objItem.DisposeOf;
  DataBase.qryItem.Active := False;
  inherited;
end;

end.
