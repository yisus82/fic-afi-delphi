unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask;

type
  TForm4 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    DataSource2: TDataSource;
    Table1Numero: TSmallintField;
    Table1Fecha: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Table2NumFac: TSmallintField;
    Table2Linea: TSmallintField;
    Table2Cantidad: TSmallintField;
    Table2Producto: TStringField;
    Table2Precio: TCurrencyField;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Table1TotalFactura: TCurrencyField;
    Label3: TLabel;
    DBText1: TDBText;
    Table2TotalLinea: TCurrencyField;
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Table2CalcFields(DataSet: TDataSet);
begin
        Table2TotalLinea.Value := Table2Precio.Value * Table2Cantidad.Value;
end;

procedure TForm4.Table1CalcFields(DataSet: TDataSet);
var consulta: TQuery;
begin
        try
           consulta := TQuery.Create(nil);
           consulta.SQL.Add('SELECT SUM(Cantidad*Precio) FROM Linea WHERE NumFac = :numero');
           consulta.ParamByName('numero').Value := Table1Numero.Value;
           consulta.Open;
           if not consulta.Fields[0].IsNull then
                Table1TotalFactura.Value := consulta.Fields[0].Value;
        finally
         consulta.Free;
        end;
end;

procedure TForm4.Table2AfterPost(DataSet: TDataSet);
begin
        Table1.Refresh;
end;

procedure TForm4.Table2AfterDelete(DataSet: TDataSet);
begin
        Table1.Refresh;
end;

end.
