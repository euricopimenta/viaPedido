unit View.itens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Model.DataModule;

type
  Tfrm_Itens = class(TForm)
    pnlItens: TPanel;
    edtCod: TEdit;
    edtDescricao: TEdit;
    dbgItem: TDBGrid;
    pnlControls: TPanel;
    Shape1: TShape;
    btnAdd: TSpeedButton;
    btnRemover: TSpeedButton;
    btnSair: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Itens: Tfrm_Itens;

implementation

{$R *.dfm}

end.
