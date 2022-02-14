unit View.itens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,System.Rtti,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,Controller.Item;

type
  Tfrm_Itens = class(TForm)
    pnlItens: TPanel;
    pnlGrid: TPanel;
    dbgItem: TDBGrid;
    pnlHeader: TPanel;
    pnlControls: TPanel;
    Shape1: TShape;
    pnlEdits: TPanel;
    edtCod: TEdit;
    edtDescricao: TEdit;
    btnSair: TSpeedButton;
    btnAdd: TSpeedButton;
    btnRemover: TSpeedButton;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure dbgItemCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    Procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frm_Itens: Tfrm_Itens;
  controllerItem : TItemController;
  isAlterar : Boolean = False;

implementation

{$R *.dfm}

procedure Tfrm_Itens.btnAddClick(Sender: TObject);
begin
  Try
    controllerItem.SalvarItem(edtCod.Text,edtDescricao.Text,isAlterar);
  Except

  End;

  LimparCampos;

end;

procedure Tfrm_Itens.btnRemoverClick(Sender: TObject);
Var
  opc : Integer;
begin
  Opc := MessageDlg('Excluír item ?',mtWarning,mbYesNo,2);

  // Se mbNo
  if opc = 1 then
    Exit
  Else
    try
      dbgItem.DataSource.DataSet.Delete;
    Except
      Showmessage('Não foi possível excluír o item');
    end;

  LimparCampos;

end;

procedure Tfrm_Itens.dbgItemCellClick(Column: TColumn);
begin
  With dbgItem.DataSource.DataSet do
  Begin
    edtCod.Text := FieldByName('ID_ITEM').AsString;
    edtDescricao.Text := FieldByName('DESC_ITEM').AsString;
  End;
  isAlterar := True;
  btnSair.Caption := 'Limpar';

end;

procedure Tfrm_Itens.FormCreate(Sender: TObject);
begin
 controllerItem := TItemController.Create;
 dbgItem.DataSource := controllerItem.dtsItem;
 LimparCampos;

end;

procedure Tfrm_Itens.LimparCampos;
begin
  edtCod.Text := controllerItem.getNovoCod;
  edtDescricao.Clear;
  btnSair.Caption := 'Voltar';
  isAlterar := False;

end;

procedure Tfrm_Itens.btnSairClick(Sender: TObject);
begin
  if isAlterar then
    LimparCampos
  Else
  Begin
    Parent.SetFocus;
    Free;
  End;

end;

end.
