unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.ImgList, Vcl.Buttons,
  View.Pedido,View.itens, acPNG, ShellAPI;

type
  Tfrm_Main = class(TForm)
    pnlMenuLateral: TPanel;
    pnlHeader: TPanel;
    pnlViews: TPanel;
    Shape2: TShape;
    btnSair: TSpeedButton;
    btnItem: TSpeedButton;
    btnPedido: TSpeedButton;
    Image1: TImage;
    author: TLabel;
    shpFocus: TShape;
    procedure btnPedidoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnItemClick(Sender: TObject);
  private
    { Private declarations }
    Procedure tagFocus (Sender: TObject);
  public
    { Public declarations }

  end;

var
  frm_Main: Tfrm_Main;

implementation

{$R *.dfm}



procedure Tfrm_Main.btnItemClick(Sender: TObject);
begin
  frm_Itens := Tfrm_Itens.Create(pnlViews);
  frm_Itens.Parent := pnlViews;
  frm_Itens.Show;
  tagFocus(Sender);

end;

procedure Tfrm_Main.btnPedidoClick(Sender: TObject);
begin
  frm_Pedido := Tfrm_Pedido.Create(pnlViews);
  frm_Pedido.Parent := pnlViews;
  frm_Pedido.Show;
  tagFocus(Sender);

end;

procedure Tfrm_Main.btnSairClick(Sender: TObject);
begin
  Application.Terminate;

end;

procedure Tfrm_Main.tagFocus(Sender: TObject);
begin
  With TSpeedButton(Sender) do
  begin
    shpFocus.Visible := True;
    shpFocus.Left := Left+1;
    shpFocus.Top := Top+5;
  end;

end;


{$REGION '   Author  '}
  procedure Tfrm_Main.Image1MouseLeave(Sender: TObject);
  begin
    Author.Font.Color := clBlack;
  end;

procedure Tfrm_Main.Image1Click(Sender: TObject);
  begin
    ShellExecute(Handle,'open','https://github.com/euricopimenta',nil,nil,SW_SHOWMAXIMIZED);
  end;

  procedure Tfrm_Main.Image1MouseEnter(Sender: TObject);
  begin
    Author.Font.Color := $002E2EE6;
{$ENDREGION}
end;

end.
