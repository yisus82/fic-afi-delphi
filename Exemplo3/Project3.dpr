program Project2;

uses
  Forms,
  Calculadora1 in 'Calculadora1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
