program Project1;

uses
  Forms,
  Editor1 in 'Editor1.pas' {Editor};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Editor';
  Application.CreateForm(TEditor, Editor);
  Application.Run;
end.
