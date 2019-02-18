unit EditAzul;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls,
  Graphics;

type
  TEditAzul = class(TEdit)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;

  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TEditAzul]);
end;

constructor TEditAzul.Create(AOwner:TComponent);
begin
        inherited Create(AOwner);
        color := clAqua;
end;

end.
