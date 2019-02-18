unit Aplicaciones1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAplicaciones = class(TForm)
    Calculadora: TButton;
    Editor: TButton;
    procedure CalculadoraClick(Sender: TObject);
    procedure EditorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Aplicaciones: TAplicaciones;
  
implementation

{$R *.dfm}

procedure TAplicaciones.CalculadoraClick(Sender: TObject);
begin
        Application.CreateForm(TCalculadora, CalcForm);
        CalcForm.ShowModal;
        CalcForm.Release;
end;

procedure TAplicaciones.EditorClick(Sender: TObject);
begin
        EditForm := TEditor.Create(Self);
end;

end.
