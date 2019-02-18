unit PanelBoton;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics,
  ExtCtrls, StdCtrls;

type
  TPanelBoton = class(TPanel)
  private
    { Private declarations }
    FBoton: TButton;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TPanelBoton]);
end;

constructor TPanelBoton.Create(AOwner:TComponent);
begin
        inherited Create(AOwner);
        FBoton := TButton.Create(Self);
        FBoton.Left := Width div 2 - FBoton.Width div 2;
        FBoton.Top := Height div 2 - FBoton.Height div 2;
        FBoton.Parent := Self;
        Self.Caption := '';
end;

destructor TPanelBoton.Destroy;
begin
        FBoton.Destroy;
        inherited Destroy;
end;

end.
