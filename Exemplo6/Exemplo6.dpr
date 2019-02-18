program Exemplo6;

uses
  Forms,
  Exemplo6_principal in 'Exemplo6_principal.pas' {Form1},
  Exemplo6_principal2 in 'Exemplo6_principal2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
