program Project1;

uses
  Forms,
  Unit4 in '..\BDEjemplo3\Unit4.pas' {Form4},
  Unit1 in '..\BDEjemplo3\Unit1.pas' {DataModule1: TDataModule},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
