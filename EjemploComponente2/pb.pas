unit pb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,stdctrls;

type
  tpb = class(tpanel)
  private
     FBoton: TButton;
    { Private declarations }
    function getclick:tnotifyevent;
    procedure setclick(value:tnotifyevent);
  protected
    { Protected declarations }
  public
    constructor create(Aowner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  published
    property OnBotonClick:TNotifyEvent read getclick write setclick;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [tpb]);
end;

constructor tpb.create(aowner:tcomponent);
begin
  inherited create(aowner);
  fboton:=tbutton.create(nil);
  fboton.parent:=self;
  caption:='';
end;
destructor tpb.destroy;
begin
  fboton.destroy;
  inherited destroy;
end;


function tpb.getclick:tnotifyevent;
begin
        result:=fboton.OnClick;
end;
procedure tpb.setclick(value:tnotifyevent);
begin
        fboton.OnClick:=value;
end;
end.
