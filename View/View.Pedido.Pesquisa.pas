unit View.Pedido.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.WinXCalendars, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_Pesquisa = class(TForm)
    pnlItens: TPanel;
    pnlGrid: TPanel;
    dbgPedidos: TDBGrid;
    pnlEdits: TPanel;
    pnlHeader: TPanel;
    Shape2: TShape;
    btnSair: TSpeedButton;
    edtPesqItem: TEdit;
    edtPesqCliente: TEdit;
    datePesqData: TCalendarPicker;
    chkPesqCliente: TCheckBox;
    chkPesqData: TCheckBox;
    chkPesqItem: TCheckBox;
    btnPesquisar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure chkPesqItemClick(Sender: TObject);
    procedure chkPesqClienteClick(Sender: TObject);
    procedure chkPesqDataClick(Sender: TObject);
  private
    { Private declarations }
    Procedure ativaEditPesquisa(ACheck: TCheckBox; AEdit: TEdit);
  public
    { Public declarations }
  end;

var
  frm_Pesquisa: Tfrm_Pesquisa;

implementation

{$R *.dfm}



procedure Tfrm_Pesquisa.FormCreate(Sender: TObject);
begin
  datePesqData.Date := Now;
end;

procedure Tfrm_Pesquisa.chkPesqClienteClick(Sender: TObject);
begin
  ativaEditPesquisa(chkPesqCliente,edtPesqCliente);
end;

procedure Tfrm_Pesquisa.chkPesqDataClick(Sender: TObject);
begin
  With datePesqData do
    if Enabled then  Enabled := False Else Enabled := True ;

end;

procedure Tfrm_Pesquisa.chkPesqItemClick(Sender: TObject);
begin
  ativaEditPesquisa(chkPesqItem,edtPesqItem);
end;







procedure Tfrm_Pesquisa.ativaEditPesquisa(ACheck: TCheckBox; AEdit: TEdit);
begin
  With AEdit Do
  Begin
    if ACheck.Checked = True then
    begin
      Enabled := True;
      Clear;
    end
    Else
    Begin
      Enabled := False;
      Text := TextHint;
    End;

  End;

end;

procedure Tfrm_Pesquisa.btnSairClick(Sender: TObject);
begin
  Parent.SetFocus;
  Free;
end;




end.
