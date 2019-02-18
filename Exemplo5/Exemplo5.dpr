program Exemplo5;

uses
  Forms,
  Aplicaciones1 in 'Aplicaciones1.pas' {Aplicaciones};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAplicaciones, Aplicaciones);
  Application.Run;
end.
