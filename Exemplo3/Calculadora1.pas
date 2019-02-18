unit Calculadora1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCalculadora = class(TForm)
    Numero1: TEdit;
    Numero2: TEdit;
    Sumar: TButton;
    Suma: TLabel;
    procedure Numero1Exit(Sender: TObject);
    procedure Numero2Exit(Sender: TObject);
    procedure SumarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Calculadora: TCalculadora;

implementation

{$R *.dfm}

procedure TCalculadora.Numero1Exit(Sender: TObject);
begin
       Try
        StrToInt(Numero1.Text);
       Except
        on EConvertError do begin
                                ShowMessage('Número no válido');
                                Numero1.Text := '';
                            end;
       End;
end;

procedure TCalculadora.Numero2Exit(Sender: TObject);
begin
        Try
         StrToInt(Numero2.Text);
        Except
         on EConvertError do begin
                                ShowMessage('Número no válido');
                                Numero2.Text := '';
                            end;
        End;
end;

procedure TCalculadora.SumarClick(Sender: TObject);
begin
        Try
         Suma.Caption := '';
         Suma.Caption := IntToStr(StrToInt(Numero1.Text)
         + StrToInt(Numero2.Text));
         Numero1.Text := '';
         Numero2.Text := '';
        Except
         on EConvertError do begin
                                ShowMessage('Número(s) no válido(s)');
                                Suma.Caption := '';
                             end;
        End;
end;

end.
