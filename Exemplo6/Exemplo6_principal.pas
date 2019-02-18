unit Exemplo6_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Exemplo6_principal2;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichero1: TMenuItem;
    Abrir1: TMenuItem;
    Novo1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Grabar1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure Abrir1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Grabar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FormNuevo: TForm2;

implementation

{$R *.dfm}

procedure TForm1.Abrir1Click(Sender: TObject);
begin
        if (OpenDialog1.Execute)
                then begin
                        Application.CreateForm(TForm2, FormNuevo);
                        FormNuevo.Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
                        FormNuevo.Caption := OpenDialog1.FileName;
                     end
end;

procedure TForm1.Novo1Click(Sender: TObject);
begin
        Application.CreateForm(TForm2, FormNuevo);
end;

procedure TForm1.Grabar1Click(Sender: TObject);
begin
      FormNuevo := TForm2(ActiveMDIChild);
      if (FormNuevo.Caption = '')
          then begin
                 if (SaveDialog1.Execute)
                   then FormNuevo.Memo1.Lines.SaveToFile(SaveDialog1.FileName)
                end
          else FormNuevo.Memo1.Lines.SaveToFile(FormNuevo.Caption);
end;

end.
