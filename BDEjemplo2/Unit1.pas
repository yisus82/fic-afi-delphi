unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, DB, DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Table1: TTable;
    Table1Dni: TStringField;
    Table1Nombre: TStringField;
    Table1Direccion: TMemoField;
    Table1Edad: TSmallintField;
    Table1Telefono: TStringField;
    Table1FechaNacimiento: TDateField;
    Query1Dni: TStringField;
    Query1Nombre: TStringField;
    Query1Direccion: TMemoField;
    Query1Edad: TSmallintField;
    Query1Telefono: TStringField;
    Query1FechaNacimiento: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    BInforme: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BInformeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
        Query1.ExecSQL;
end;

procedure TForm1.BInformeClick(Sender: TObject);
begin
        FR.QuickRep1.Preview;
end;

end.
