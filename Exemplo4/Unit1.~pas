unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TEditor = class(TForm)
    MainMenu1: TMainMenu;
    Abrir: TButton;
    Guardar: TButton;
    Cerrar: TButton;
    Salir: TButton;
    Memo1: TMemo;
    MenuFichero: TMenuItem;
    Abrir1: TMenuItem;
    Guardar1: TMenuItem;
    Cerrar1: TMenuItem;
    Salir1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure AbrirClick(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure CerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Editor: TEditor;

implementation

{$R *.dfm}

procedure TEditor.AbrirClick(Sender: TObject);
begin
        if (OpenDialog1.Execute) then
           Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TEditor.GuardarClick(Sender: TObject);
begin
        if (SaveDialog1.Execute) then
           Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TEditor.CerrarClick(Sender: TObject);
begin
        Memo1.Lines.Clear;
end;

procedure TEditor.SalirClick(Sender: TObject);
begin
        Close;
end;

end.
