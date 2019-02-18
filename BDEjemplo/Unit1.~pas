unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Table1Dni: TStringField;
    Table1Nombre: TStringField;
    Table1Direccion: TMemoField;
    Table1Edad: TSmallintField;
    Table1Telefono: TStringField;
    Table1FechaNacimiento: TDateField;
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
    BPrincipio: TButton;
    BAtras: TButton;
    BCancelar: TButton;
    BRefrescar: TButton;
    BAdelante: TButton;
    BFinal: TButton;
    BMas: TButton;
    BMenos: TButton;
    BAceptar: TButton;
    BSuma: TButton;
    Table1Jubilado: TBooleanField;
    EDNI: TEdit;
    BInsertar: TButton;
    LDNI: TLabel;
    procedure BPrincipioClick(Sender: TObject);
    procedure BAtrasClick(Sender: TObject);
    procedure BAdelanteClick(Sender: TObject);
    procedure BFinalClick(Sender: TObject);
    procedure BMasClick(Sender: TObject);
    procedure BMenosClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BRefrescarClick(Sender: TObject);
    procedure BSumaClick(Sender: TObject);
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BInsertarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BPrincipioClick(Sender: TObject);
begin
        Table1.First;
end;

procedure TForm1.BAtrasClick(Sender: TObject);
begin
        Table1.Prior;
end;

procedure TForm1.BAdelanteClick(Sender: TObject);
begin
        Table1.Next;
end;

procedure TForm1.BFinalClick(Sender: TObject);
begin
        Table1.Last;
end;

procedure TForm1.BMasClick(Sender: TObject);
begin
        Table1.Insert;
end;

procedure TForm1.BMenosClick(Sender: TObject);
begin
        if MessageDlg('¿Desea eliminar el registro?',
               mtConfirmation, mbYesNoCancel, 0) = mrYes then Table1.Delete;
end;

procedure TForm1.BAceptarClick(Sender: TObject);
begin
        Table1.Post;
end;

procedure TForm1.BCancelarClick(Sender: TObject);
begin
        Table1.Cancel;
end;

procedure TForm1.BRefrescarClick(Sender: TObject);
begin
        Table1.Refresh;
end;

procedure TForm1.BSumaClick(Sender: TObject);
var suma: integer;
    actual: TBookmark;
begin
    suma := 0;
    actual := Table1.GetBookmark;
    Table1.First;
    while not Table1.Eof do begin
        suma := suma + Table1Edad.Value;
        Table1.Next;
    end;
    Table1.GotoBookmark(actual);
    Table1.FreeBookmark(actual);
    ShowMessage(inttostr(suma));
end;

procedure TForm1.Table1NewRecord(DataSet: TDataSet);
begin
        Table1Edad.Text := '0';
end;

procedure TForm1.Table1BeforePost(DataSet: TDataSet);
var edad: integer;
begin
        edad := Table1Edad.Value;
        if (edad < 0) or (edad > 100)
                then begin
                        ShowMessage('Edad inválida');
                        Abort;
                     end;
end;

procedure TForm1.DataSource1StateChange(Sender: TObject);
var modificando: boolean;
begin
        modificando := Table1.State in [dsEdit,dsInsert];
        BAceptar.Enabled := modificando;
        BCancelar.Enabled := modificando;
        BPrincipio.Enabled := not modificando;
        BAtras.Enabled := not modificando;
        BAdelante.Enabled := not modificando;
        BFinal.Enabled := not modificando;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
        BPrincipio.Enabled := not Table1.Bof;
        BAtras.Enabled := not Table1.Bof;
        BAdelante.Enabled := not Table1.Eof;
        BFinal.Enabled := not Table1.Eof;
end;

procedure TForm1.BInsertarClick(Sender: TObject);
begin
        Table1.Insert;
        Table1Dni.Text := String(EDNI.Text);
        Table1FechaNacimiento.Text := DateToStr(Date);
        Table1.Post;
        EDNI.Text := '';
end;

end.
