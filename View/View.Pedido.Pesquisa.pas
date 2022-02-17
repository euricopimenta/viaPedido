unit View.Pedido.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Firedac.Comp.Client , Vcl.StdCtrls,
  Vcl.WinXCalendars, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_Pesquisa = class(TForm)
    pnlMain: TPanel;
    pnlGrid: TPanel;
    dbgPedidos: TDBGrid;
    pnlEdits: TPanel;
    pnlHeader: TPanel;
    Shape2: TShape;
    btnSair: TSpeedButton;
    edtPesqItem: TEdit;
    edtPesqCliente: TEdit;
    edtDataInicial: TCalendarPicker;
    chkPesqCliente: TCheckBox;
    chkPesqData: TCheckBox;
    chkPesqItem: TCheckBox;
    btnPesquisar: TSpeedButton;
    edtDataFinal: TCalendarPicker;
    lblPeriodo: TLabel;
    Label1: TLabel;
    lblTituloRotina: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure chkPesqItemClick(Sender: TObject);
    procedure chkPesqClienteClick(Sender: TObject);
    procedure chkPesqDataClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure ativaEditPesquisa(ACheck: TCheckBox; AEdit: TEdit);
    Function filtrosDaPesquisa : String;
  public
    { Public declarations }
  end;

var
  frm_Pesquisa: Tfrm_Pesquisa;

implementation

{$R *.dfm}
Uses
  Controller.Pedido;

procedure Tfrm_Pesquisa.FormCreate(Sender: TObject);
begin
  //Configura as Datas
  edtDataInicial.Date := StrToDate(FormatDateTime('01/mm/yyyy',now)) ;
  edtDataFinal.Date  := Now;

end;

procedure Tfrm_Pesquisa.chkPesqClienteClick(Sender: TObject);
begin
  ativaEditPesquisa(chkPesqCliente,edtPesqCliente);
end;

procedure Tfrm_Pesquisa.chkPesqDataClick(Sender: TObject);
begin
  With edtDataInicial do
    if Enabled then  Enabled := False Else Enabled := True ;

  With edtDataFinal do
    if Enabled then  Enabled := False Else Enabled := True ;

end;

procedure Tfrm_Pesquisa.chkPesqItemClick(Sender: TObject);
begin
  ativaEditPesquisa(chkPesqItem,edtPesqItem);
end;

Function Tfrm_Pesquisa.filtrosDaPesquisa : String;
Var
  dtInicial,dtFinal,Cliente,Item : String;
  qry : TStringBuilder;
begin
  //Carregar Variáveis
  dtInicial := FormatDateTime('dd.mm.yyyy',edtDataInicial.Date);
  dtFinal := FormatDateTime('dd.mm.yyyy',edtDataFinal.Date);
  Cliente := edtPesqCliente.Text;
  Item := edtPesqItem.Text;
  qry := TStringBuilder.Create;

  Try
    //Cria Select
    qry.Append(
      'select '+
        'Distinct(pCab.NUMERO) Numero, '+
        'pCab.DT_EMISSAO Data , '+
        'pCab.CLIENTE '+
      'from PEDIDOCAB pCab '+
      'left outer join pedidoitem pItem on pCab.id_pedido_cab = pItem.id_pedido_cab '+
      'left outer join item iItem on iItem.id_item = pItem.id_item '+
      'Where 1=1 '
    );

    //Adiciona Filtros
    if chkPesqData.Checked then
      qry.Append(' and pCab.DT_EMISSAO between '+QuotedStr(dtInicial)+' and '+QuotedStr(dtFinal));

    if chkPesqCliente.Checked then
      qry.Append(' and pCab.CLIENTE containing '+QuotedStr(Cliente));

    if chkPesqItem.Checked then
      qry.Append(' and iItem.desc_item containing '+QuotedStr(Item));

    qry.Append(' Order by pCab.DT_EMISSAO, pCab.Numero ');

  Except
    raise Exception.Create('Erro ao Aplicar Filtros');

  End;

  Result := qry.ToString;
  qry.Free;


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

procedure Tfrm_Pesquisa.btnPesquisarClick(Sender: TObject);
begin
  if Not(chkPesqData.Checked or chkPesqCliente.Checked or chkPesqItem.Checked) then
    raise Exception.Create('Pelo ao menos um filtro deve estar marcado');

  With TFDQuery(dbgPedidos.DataSource.DataSet) do
  Begin
    SQL.Text:=filtrosDaPesquisa;
    Open();
    Refresh;
  End;



end;

procedure Tfrm_Pesquisa.btnSairClick(Sender: TObject);
begin
  Close;
  FreeAndNil(Self);
end;

end.
