unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Unit3, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TForm2 = class(TForm)
    Icon: TFrame3;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IconClick(Sender: TObject);
  private
    procedure ClickBack(Sender: TObject);
    procedure ClickMenu(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
Icon.ToBack;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Icon.ToHamburger;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
Icon.OnCLickMenu := ClickMenu;
Icon.OnClickBack := ClickBack;
end;

procedure TForm2.IconClick(Sender: TObject);
begin
Memo1.Lines.Add('Clicou no icone');
end;

procedure TForm2.ClickMenu(Sender: TObject);
begin
Memo1.Lines.Add('Clicou no icone Menu');
End;

procedure TForm2.ClickBack(Sender: TObject);
begin
Memo1.Lines.Add('Clicou no icone Back');
End;

end.
