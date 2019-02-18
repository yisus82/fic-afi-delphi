unit Exemplo6_principal2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
        if (Memo1.Modified) then begin
           if MessageDlg('El fichero ha sido modificado. ¿Desea grabarlo?',
               mtConfirmation, mbYesNoCancel, 0) = mrYes then
             if (Caption = '')
                then begin
                      if (SaveDialog1.Execute)
                         then Memo1.Lines.SaveToFile(SaveDialog1.FileName)
                     end
                else Memo1.Lines.SaveToFile(Caption);
           end;
end;

end.
