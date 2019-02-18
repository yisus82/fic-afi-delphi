unit jvShape;

interface

uses
  Windows, WinProcs,Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs;


type
  TonUserDraw= procedure ( sender : Tobject) of object;

  TjvShapeType = (jstRectangle, jstSquare, jstRoundRect, jstRoundSquare,
    jstEllipse, jstCircle, jstValve,jstValveUp,jstHouse,
    jstTriangleRight,jstTriangleUp,jstTriangleLeft,jstTriangleDown,
    jstArrowRight,jstArrowUp,jstArrowLeft,jstArrowDown,
    jstDiamond, jstOctagon,jstHexagon,jstHexagonFlat,
    jstUBarUp,jstUBarLeft,jstUBarDown,jstUBarRight,
    jstChairLeft,jstChairRight,
    jstBowlLeft,jstBowlRight,jstBowlDown,jstBowlUp,
    jstIBar,jstHBar,jst4Point,jstWaggle,
    jstCloudLeft,jstCloudRight,jstDoubleOval,jstDoubleOvalV,
    jstTorus,jstFrame,jstFrameNarrow,
    jstLBarUpLeft,jstLBarUpRight,jstLBarLeft,jstLBarRight,
    jst2HoleHoriz,jst2HoleVert,
    jstCubeUpRight,jstCubeUpLeft,jstCubeDownRight,jstCubeDownLeft,
    jstCubeHalf,jstRoofRight,jstRoofLeft,jstRoofFront,jstRoofBack,
    jstPyramid,jstMoret,jstZ,jstN,jstMatta,
    jstPistacheTop,jstPistacheBottom,jstPistacheLeft,jstPistacheRight,
    jst1Hole,jst1HoleBig,jstflower);
  TjvFillDirection = (jgdUp, jgdDown, jgdLeft, jgdRight,
    jgdRectOut,jgdRectIn, jgdHorizCenter, jgdVertCenter,
    jgdCircOut,jgdCircIn,jgdNWSE,jgdNESW,jgdSENW,jgdSWNE,
    jgdUright,jgdULeft,jgdUUp,jgdUDown,
    jgdRCMix,jgdRCModulo,jgdQuatro,jgdDuo,
    jgdLNE,jgdLNW,jgdUpDown,jgdLeftRight);

  TjvShape = class(TGraphicControl)
  private
    FPen: TPen;
    FBrush: TBrush;
    FShape: TjvShapeType;
    FFillDirection: TjvFillDirection;
    FGradientColor: Tcolor;
    FGradient: boolean;
    FCaption: String;
    FCaptionAngle: integer;
    FCaptionY: integer;
    FCaptionX: integer;
    FCaptionCentered: boolean;
    FonUserDraw: TonUserDraw;
    FbyUser: boolean;
    procedure SetBrush(Value: TBrush);
    procedure SetPen(Value: TPen);
    procedure SetShape(Value: TjvShapeType);
    procedure DrawTriangle;
    procedure FillWithGradient;
    procedure SetPenBrushForGradient;
    procedure SetPenBrushForOutline;
    procedure SetFillDirection(const Value: TjvFillDirection);
    procedure SetGradientColor(const Value: Tcolor);
    procedure SetGradient(const Value: boolean);
    procedure DrawArrow;
    procedure DrawUBar;
    procedure DrawChair;
    procedure DrawOctagon;
    procedure DrawEllipse;
    procedure DrawRectangle;
    procedure DrawRoundRect;
    procedure DrawValve;
    procedure DrawHouse;
    procedure DrawDiamond;
    procedure DoRectangle(fr, fg, fb, dr, dg, db: Integer);
    procedure DoHorizCenter(fr, fg, fb, dr, dg, db: Integer);
    procedure DoVertCenter(fr, fg, fb, dr, dg, db: Integer);
    procedure DrawBowl;
    procedure DrawIBar;
    procedure DrawWaggle;
    procedure DrawCloud;
    procedure DrawTorus;
    procedure DoCircle(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradNWSE(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradNESW(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradSENW(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradSWNE(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradURight(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradULeft(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradUUp(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradUDown(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradRCMix(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradRCModulo(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradQuatro(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradDuo(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradLNE(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradLNW(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradUpDown(fr, fg, fb, dr, dg, db: Integer);
    procedure doGradLeftRight(fr, fg, fb, dr, dg, db: Integer);            
    procedure DrawLBar;
    procedure Draw2Hole;
    procedure SetCaption(const Value: String);
    procedure TextRotate(bitmap:tbitmap;x, y, angle: integer; atext: string;
      afont: tfont);
    procedure SetCaptionAngle(const Value: integer);
    procedure DrawText;
    procedure SetCaptionX(const Value: integer);
    procedure SetCaptionY(const Value: integer);
    procedure SetCaptionCentered(const Value: boolean);
    procedure SetonUserDraw(const Value: TonUserDraw);
    procedure DoUserDraw;
    procedure SetbyUser(const Value: boolean);
    procedure DrawHexagon;
    procedure DrawCube;
    procedure DrawRoof;
    procedure DrawPyramid;
    procedure DrawMoret;
    procedure DrawZ;
    procedure DrawMatta;
    procedure DrawPistache;
    procedure Draw1Hole;
    procedure Drawflower;
    procedure DrawFrame;

  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas;
  published
    procedure StyleChanged(Sender: TObject);
    property onUserDraw: TonUserDraw read FonUserDraw write SetonUserDraw;
    property Align;
    property popupmenu;
    property Anchors;
    property Brush: TBrush read FBrush write SetBrush;
    property GradientColor:Tcolor read FGradientColor write SetGradientColor;
    property Gradient:boolean read FGradient write SetGradient default false;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Constraints;
    property ParentShowHint;
    property Pen: TPen read FPen write SetPen;
    property Shape: TjvShapeType read FShape write SetShape default jstRectangle;
    property FillDirection:TjvFillDirection read FFillDirection write SetFillDirection;
    property ShowHint;
    property Font;
    property Caption:String read FCaption write SetCaption;
    property CaptionX:integer read FCaptionX write SetCaptionX default 5;
    property CaptionY:integer read FCaptionY write SetCaptionY default 5;
    property CaptionCentered:boolean read FCaptionCentered write SetCaptionCentered;
    property CaptionAngle:integer read FCaptionAngle write SetCaptionAngle;
    property byUser:boolean read FbyUser write SetbyUser;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

{ TjvShape }

var
  X, Y, W, H, S: Integer;
  w2,w3,w4,w8,w16,h2,h3,h4,h8,h16,xw,yh:integer;



procedure Register;
begin
  RegisterComponents('Jans', [TjvShape]);
end;


constructor TjvShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 65;
  Height := 65;
  FPen := TPen.Create;
  FPen.OnChange := StyleChanged;
  FBrush := TBrush.Create;
  FBrush.OnChange := StyleChanged;
  FCaptionCentered:=true;
  FbyUser:=false;
end;

destructor TjvShape.Destroy;
begin
  FPen.Free;
  FBrush.Free;
  inherited Destroy;
end;

procedure TjvShape.Paint;
var
  poly: array[0..12] of TPoint;
begin
  with Canvas do
  begin
    Pen := FPen;
    Brush := FBrush;
    X := Pen.Width div 2;
    Y := X;
    W := Width - Pen.Width + 1;
    H := Height - Pen.Width + 1;
    if Pen.Width = 0 then
    begin
      Dec(W);
      Dec(H);
    end;
    if W < H then S := W else S := H;
    if FShape in [jstSquare, jstRoundSquare, jstCircle] then
    begin
      Inc(X, (W - S) div 2);
      Inc(Y, (H - S) div 2);
      W := S;
      H := S;
    end;
// calcalute some often used values
    w2:=w div 2;
    w3:=w div 3;
    w4:=w div 4;
    w8:=w div 8;
    w16:=w div 16;
    h2:=h div 2;
    h3:=h div 3;
    h4:=h div 4;
    h8:=h div 8;
    h16:=h div 16;
    xw:=x+w-1;
    yh:=y+h-1;
    case FShape of
      jstRectangle, jstSquare: DrawRectangle;
      jstRoundRect, jstRoundSquare: DrawRoundrect;
      jstCircle, jstEllipse: DrawEllipse;
      jstValve, jstValveUp: DrawValve;
      jstHouse: DrawHouse;
      jstTriangleleft,jstTriangleRight,jstTriangleUp,jstTriangleDown: DrawTriangle;
      jstArrowRight,jstArrowLeft,jstArrowDown,jstArrowUp: DrawArrow;
      jstDiamond: DrawDiamond;
      jstOctagon,jst4Point: DrawOctagon;
      jstHexagon,jstHexagonFlat:DrawHexagon;
      jstUBarUp,jstUBarDown,jstUBarRight,jstUBarLeft: DrawUBar;
      jstChairLeft,jstChairRight: DrawChair;
      jstBowlLeft,jstBowlRight,jstBowlDown,jstBowlUp: DrawBowl;
      jstIBar,jstHBar: DrawIBar;
      jstWaggle: DrawWaggle;
      jstCloudLeft,jstCloudRight,jstDoubleOval,jstDoubleOvalV: DrawCloud;
      jstTorus: DrawTorus;
      jstFrame,jstFrameNarrow: DrawFrame;
      jstLBarUpLeft,jstLBarUpRight,jstLBarLeft,jstLBarRight: DrawLBar;
      jst2HoleHoriz,jst2HoleVert: Draw2Hole;
      jstCubeUpRight,jstCubeUpLeft,jstCubeDownRight,
      jstCubeDownLeft,jstCubeHalf:DrawCube;
      jstRoofRight,jstRoofLeft,jstRoofFront,jstRoofBack:DrawRoof;
      jstPyramid:DrawPyramid;
      jstMoret:DrawMoret;
      jstZ,jstN:DrawZ;
      jstMatta:DrawMatta;
      jstPistacheTop,jstPistacheBottom,jstPistacheLeft,jstPistacheRight:DrawPistache;
      jst1Hole,jst1HoleBig:Draw1Hole;
      jstflower:drawflower;
    end;
   if FbyUser then
    doUserDraw
    else
    DrawText;
  end;
end;

procedure TjvShape.StyleChanged(Sender: TObject);
begin
  Invalidate;

end;

procedure TjvShape.SetBrush(Value: TBrush);
begin
  FBrush.Assign(Value);
end;

procedure TjvShape.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TjvShape.SetShape(Value: TjvShapeType);
begin
  if FShape <> Value then
  begin
    FShape := Value;
    Invalidate;

  end;
end;

procedure TjvShape.DrawTriangle;
var
   rgn :Hrgn;
   poly: array[0..2] of TPoint;
   rpoly: array[0..2] of TPoint;
   i:integer;
begin
    case FShape of
       jstTriangleRight:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(xw,y+h2);
        poly[2]:=point(x,yh);
        end;
       jstTriangleUp:
        begin
        poly[0]:=point(x+w2,y);
        poly[1]:=point(xw,yh);
        poly[2]:=point(x,yh);
        end;
       jstTriangleLeft:
        begin
        poly[0]:=point(xw,y);
        poly[1]:=point(xw,yh);
        poly[2]:=point(x,y+h2);
        end;
       jstTriangleDown:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(xw,y);
        poly[2]:=point(x+w2,yh);
        end;
       end;
    for i := 0 to 2 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,3,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(slice(poly,3));
   end
   else
   canvas.polygon(slice(poly,3));
end;

procedure TjvShape.DrawArrow;
var
   rgn :Hrgn;
   poly: array[0..6] of TPoint;
   rpoly: array[0..6] of TPoint;
   i:integer;
begin
    case FShape of
       jstArrowRight:
        begin
        poly[0]:=point(x,y+(h div 2)-(h div 16));
        poly[1]:=point(x+w-1-(w div 4),y+(h div 2)-(h div 16));
        poly[2]:=point(x+w-1-(w div 4),y);
        poly[3]:=point(x+w-1,y+(h div 2));
        poly[4]:=point(x+w-1-(w div 4),y+h-1);
        poly[5]:=point(x+w-1-(w div 4),y+(h div 2)+(h div 16));
        poly[6]:=point(x,y+(h div 2)+(h div 16));
        end;
       jstArrowLeft:
        begin
        poly[0]:=point(x+w-1,y+(h div 2)-(h div 16));
        poly[1]:=point(x+(w div 4),y+(h div 2)-(h div 16));
        poly[2]:=point(x+(w div 4),y);
        poly[3]:=point(x,y+(h div 2));
        poly[4]:=point(x+(w div 4),y+h-1);
        poly[5]:=point(x+(w div 4),y+(h div 2)+(h div 16));
        poly[6]:=point(x+w-1,y+(h div 2)+(h div 16));
        end;
       jstArrowUp:
        begin
        poly[0]:=point(x+(w div 2)-(w div 16),y+h-1);
        poly[1]:=point(x+(w div 2)-(w div 16),y+(h div 4));
        poly[2]:=point(x,y+(h div 4));
        poly[3]:=point(x+(w div 2),y);
        poly[4]:=point(x+w-1,y+(h div 4));
        poly[5]:=point(x+(w div 2)+(w div 16),y+(h div 4));
        poly[6]:=point(x+(w div 2)+(w div 16),y+h-1);
        end;
       jstArrowDown:
        begin
        poly[0]:=point(x+(w div 2)-(w div 16),y);
        poly[1]:=point(x+(w div 2)-(w div 16),y+h-1-(h div 4));
        poly[2]:=point(x,y+h-1-(h div 4));
        poly[3]:=point(x+(w div 2),y+h-1);
        poly[4]:=point(x+w-1,y+h-1-(h div 4));
        poly[5]:=point(x+(w div 2)+(w div 16),y+h-1-(h div 4));
        poly[6]:=point(x+(w div 2)+(w div 16),y);
        end;
       end;
    for i := 0 to 6 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,7,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawChair;
var
   rgn :Hrgn;
   poly: array[0..9] of TPoint;
   rpoly: array[0..9] of TPoint;
   i:integer;
begin
    case FShape of
       jstChairLeft:
        begin
        poly[0]:=point(xw,y);
        poly[1]:=point(xw-w4,y);
        poly[2]:=point(xw-w4,y+h2);
        poly[3]:=point(x,y+h2);
        poly[4]:=point(x,yh);
        poly[5]:=point(x+w4,yh);
        poly[6]:=point(x+w4,yh-h4);
        poly[7]:=point(xw-w4,yh-h4);
        poly[8]:=point(xw-w4,yh);
        poly[9]:=point(xw,yh);
        end;
       jstChairRight:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x+w4,y);
        poly[2]:=point(x+w4,y+h2);
        poly[3]:=point(xw,y+h2);
        poly[4]:=point(xw,yh);
        poly[5]:=point(xw-w4,yh);
        poly[6]:=point(xw-w4,yh-h4);
        poly[7]:=point(x+w4,yh-h4);
        poly[8]:=point(x+w4,yh);
        poly[9]:=point(x,yh);
        end;
       end;
    for i := 0 to 9 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,10,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawValve;
var
   rgn :Hrgn;
   poly: array[0..3] of TPoint;
   rpoly: array[0..3] of TPoint;
   i:integer;
begin
    case FShape of
      jstValve:
        begin
         poly[0]:=point(x,y);
         poly[1]:=point(xw,yh);
         poly[2]:=point(xw,y);
         poly[3]:=point(x,yh);
        end;
      jstValveUp:
        begin
         poly[0]:=point(x,y);
         poly[1]:=point(xw,y);
         poly[2]:=point(x,yh);
         poly[3]:=point(xw,yh);
        end;
       end;
    for i := 0 to 3 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,4,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;


procedure TjvShape.DrawOctagon;
var
   rgn :Hrgn;
   poly: array[0..7] of TPoint;
   rpoly: array[0..7] of TPoint;
   i:integer;
begin
    case FShape of
       jstOctagon:
        begin
        poly[0]:=point(x+(w div 3),y);
        poly[1]:=point(x+w-1-(w div 3),y);
        poly[2]:=point(x+w-1,y+(h div 3));
        poly[3]:=point(x+w-1,y+h-1-(h div 3));
        poly[4]:=point(x+w-1-(w div 3),y+h-1);
        poly[5]:=point(x+(w div 3),y+h-1);
        poly[6]:=point(x,y+h-1-(h div 3));
        poly[7]:=point(x,y+(h div 3));
        end;
       jst4Point:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x+w2,y+h4);
        poly[2]:=point(xw,y);
        poly[3]:=point(xw-w4,y+h2);
        poly[4]:=point(xw,yh);
        poly[5]:=point(x+w2,yh-h4);
        poly[6]:=point(x,yh);
        poly[7]:=point(x+w4,y+h2);
        end;
       end;
    for i := 0 to 7 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,8,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawCube;
var
   rgn :Hrgn;
   poly: array[0..11] of TPoint;
   rpoly: array[0..5] of TPoint;
   i:integer;
begin
    case FShape of
       jstCubeUpRight:
        begin
        poly[0]:=point(x,yh);
        poly[1]:=point(xw-w3,yh);
        poly[2]:=point(xw,yh-h3);
        poly[3]:=point(xw,y);
        poly[4]:=point(x+w3,y);
        poly[5]:=point(x,y+h3);
        end;
       jstCubeHalf:
        begin
        poly[0]:=point(x,yh);
        poly[1]:=point(xw-w3,yh);
        poly[2]:=point(xw,yh-h3);
        poly[3]:=point(xw,yh-h3-h3);
        poly[4]:=point(x+w3,yh-h3-h3);
        poly[5]:=point(x,yh-h3);
        end;
       jstCubeUpLeft:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh-h3);
        poly[2]:=point(x+w3,yh);
        poly[3]:=point(xw,yh);
        poly[4]:=point(xw,y+h3);
        poly[5]:=point(xw-w3,y);
        end;
       jstCubeDownLeft:
        begin
        poly[0]:=point(x,y+h3);
        poly[1]:=point(x,yh);
        poly[2]:=point(xw-w3,yh);
        poly[3]:=point(xw,yh-h3);
        poly[4]:=point(xw,y);
        poly[5]:=point(x+w3,y);
        end;
       jstCubeDownRight:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh-h3);
        poly[2]:=point(x+w3,yh);
        poly[3]:=point(xw,yh);
        poly[4]:=point(xw,y+h3);
        poly[5]:=point(xw-w3,y);
        end;
       end;
    for i := 0 to 5 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,6,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   end;
    case FShape of
       jstCubeUpRight:
        begin
        poly[0]:=point(xw-w3,y+h3);
        poly[1]:=point(x,y+h3);
        poly[2]:=point(x,yh);
        poly[3]:=point(xw-w3,yh);
        poly[4]:=point(xw-w3,y+h3);
        poly[5]:=point(xw,y);
        poly[6]:=point(xw,yh-h3);
        poly[7]:=point(xw-w3,yh);
        poly[8]:=point(xw-w3,y+h3);
        poly[9]:=point(x,y+h3);
        poly[10]:=point(x+w3,y);
        poly[11]:=point(xw,y);
        end;
       jstCubeHalf:
        begin
        poly[0]:=point(xw-w3,yh-h3);
        poly[1]:=point(x,yh-h3);
        poly[2]:=point(x,yh);
        poly[3]:=point(xw-w3,yh);
        poly[4]:=point(xw-w3,yh-h3);
        poly[5]:=point(xw,yh-h3-h3);
        poly[6]:=point(xw,yh-h3);
        poly[7]:=point(xw-w3,yh);
        poly[8]:=point(xw-w3,yh-h3);
        poly[9]:=point(x,yh-h3);
        poly[10]:=point(x+w3,yh-h3-h3);
        poly[11]:=point(xw,yh-h3-h3);
        end;
       jstCubeUpLeft:
        begin
        poly[0]:=point(x+w3,y+h3);
        poly[1]:=point(xw,y+h3);
        poly[2]:=point(xw,yh);
        poly[3]:=point(x+w3,yh);
        poly[4]:=point(x+w3,y+h3);
        poly[5]:=point(x,y);
        poly[6]:=point(x,yh-h3);
        poly[7]:=point(x+w3,yh);
        poly[8]:=point(x+w3,y+h3);
        poly[9]:=point(xw,y+h3);
        poly[10]:=point(xw-w3,y);
        poly[11]:=point(x,y);
        end;
       jstCubeDownLeft:
        begin
        poly[0]:=point(x+w3,yh-h3);
        poly[1]:=point(xw,yh-h3);
        poly[2]:=point(xw,y);
        poly[3]:=point(x+w3,y);
        poly[4]:=point(x+w3,yh-h3);
        poly[5]:=point(x+w3,y);
        poly[6]:=point(x,y+h3);
        poly[7]:=point(x,yh);
        poly[8]:=point(x+w3,yh-h3);
        poly[9]:=point(xw,yh-h3);
        poly[10]:=point(xw-w3,yh);
        poly[11]:=point(x,yh);
        end;
       jstCubeDownRight:
        begin
        poly[0]:=point(xw-w3,yh-h3);
        poly[1]:=point(x,yh-h3);
        poly[2]:=point(x,y);
        poly[3]:=point(xw-w3,y);
        poly[4]:=point(xw-w3,yh-h3);
        poly[5]:=point(xw-w3,y);
        poly[6]:=point(xw,y+h3);
        poly[7]:=point(xw,yh);
        poly[8]:=point(xw-w3,yh-h3);
        poly[9]:=point(x,yh-h3);
        poly[10]:=point(x+w3,yh);
        poly[11]:=point(xw,yh);
        end;
       end;
   canvas.polygon(poly);
end;

procedure TjvShape.DrawRoof;
var
   rgn :Hrgn;
   poly: array[0..6] of TPoint;
   rpoly: array[0..4] of TPoint;
   i:integer;
begin
    case FShape of
       jstRoofFront:
        begin
        poly[0]:=point(x,yh);
        poly[1]:=point(xw-w3,yh);
        poly[2]:=point(xw,yh-h3);
        poly[3]:=point(xw,y);
        poly[4]:=point(x+w3,y);
        end;
       jstRoofBack:
        begin
        poly[0]:=point(x,yh);
        poly[1]:=point(xw-w3,yh);
        poly[2]:=point(xw,yh-h3);
        poly[3]:=point(xw-w3,y);
        poly[4]:=point(x,y);
        end;
       jstRoofLeft:
        begin
        poly[0]:=point(x,y+h3);
        poly[1]:=point(x,yh);
        poly[2]:=point(xw-w3,yh);
        poly[3]:=point(xw,yh-h3);
        poly[4]:=point(x+w3,y);
        end;
       jstRoofRight:
        begin
        poly[0]:=point(x,yh);
        poly[1]:=point(xw-w3,yh);
        poly[2]:=point(xw,yh-h3);
        poly[3]:=point(xw,y);
        poly[4]:=point(xw-w3,y+h3);
        end;
       end;
    for i := 0 to 4 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,5,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   end;
    case FShape of
       jstRoofFront:
        begin
        poly[0]:=point(xw-w3,yh);
        poly[1]:=point(xw,y);
        poly[2]:=point(x+w3,y);
        poly[3]:=point(x,yh);
        poly[4]:=point(xw-w3,yh);
        poly[5]:=point(xw,yh-h3);
        poly[6]:=point(xw,y);
        end;
       jstRoofBack:
        begin
        poly[0]:=point(xw-w3,yh);
        poly[1]:=point(xw-w3,y);
        poly[2]:=point(x,y);
        poly[3]:=point(x,yh);
        poly[4]:=point(xw-w3,yh);
        poly[5]:=point(xw,yh-h3);
        poly[6]:=point(xw-w3,y);
        end;
       jstRoofLeft:
        begin
        poly[0]:=point(x,y+h3);
        poly[1]:=point(x,yh);
        poly[2]:=point(xw-w3,yh);
        poly[3]:=point(x,y+h3);
        poly[4]:=point(x+w3,y);
        poly[5]:=point(xw,yh-h3);
        poly[6]:=point(xw-w3,yh);
        end;
       jstRoofRight:
        begin
        poly[0]:=point(xw-w3,yh);
        poly[1]:=point(xw-w3,y+h3);
        poly[2]:=point(x,yh);
        poly[3]:=point(xw-w3,yh);
        poly[4]:=point(xw,yh-h3);
        poly[5]:=point(xw,y);
        poly[6]:=point(xw-w3,y+h3);
        end;
       end;
   canvas.polygon(poly);
end;

procedure TjvShape.DrawPyramid;
var
   rgn :Hrgn;
   poly: array[0..5] of TPoint;
   rpoly: array[0..3] of TPoint;
   i:integer;
begin
    case FShape of
       jstPyramid:
        begin
        poly[0]:=point(x,yh);
        poly[1]:=point(xw-w3,yh);
        poly[2]:=point(xw,yh-h3);
        poly[3]:=point(x+w2,y);
        end;
       end;
    for i := 0 to 3 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,4,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   end;
    case FShape of
       jstPyramid:
        begin
        poly[0]:=point(xw-w3,yh);
        poly[1]:=point(x+w2,y);
        poly[2]:=point(x,yh);
        poly[3]:=point(xw-w3,yh);
        poly[4]:=point(xw,yh-h3);
        poly[5]:=point(x+w2,y);
        end;
       end;
   canvas.polygon(poly);
end;

procedure TjvShape.DrawMoret;
var
   rgn :Hrgn;
   poly: array[0..19] of TPoint;
   rpoly: array[0..19] of TPoint;
   i:integer;
begin
    case FShape of
       jstMoret:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,y+h4);
        poly[2]:=point(x+w8,y+h4);
        poly[3]:=point(x+w8,yh-h4);
        poly[4]:=point(x,yh-h4);
        poly[5]:=point(x,yh);
        poly[6]:=point(x+w4,yh);
        poly[7]:=point(x+w4,yh-h8);
        poly[8]:=point(xw-w4,yh-h8);
        poly[9]:=point(xw-w4,yh);
        poly[10]:=point(xw,yh);
        poly[11]:=point(xw,yh-h4);
        poly[12]:=point(xw-w8,yh-h4);
        poly[13]:=point(xw-w8,y+h4);
        poly[14]:=point(xw,y+h4);
        poly[15]:=point(xw,y);
        poly[16]:=point(xw-w4,y);
        poly[17]:=point(xw-w4,y+h8);
        poly[18]:=point(x+w4,y+h8);
        poly[19]:=point(x+w4,y);
        end;
       end;
    for i := 0 to 19 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,20,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   end;
   canvas.polygon(poly);
end;

procedure TjvShape.DrawZ;
var
   rgn :Hrgn;
   poly: array[0..9] of TPoint;
   rpoly: array[0..9] of TPoint;
   i:integer;
begin
    case FShape of
       jstZ:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,y+h4);
        poly[2]:=point(xw-w3,y+h4);
        poly[3]:=point(x,yh-h4);
        poly[4]:=point(x,yh);
        poly[5]:=point(xw,yh);
        poly[6]:=point(xw,yh-h4);
        poly[7]:=point(x+w3,yh-h4);
        poly[8]:=point(xw,y+h4);
        poly[9]:=point(xw,y);
        end;
       jstN:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh);
        poly[2]:=point(x+w4,yh);
        poly[3]:=point(x+w4,y+h3);
        poly[4]:=point(xw-w4,yh);
        poly[5]:=point(xw,yh);
        poly[6]:=point(xw,y);
        poly[7]:=point(xw-w4,y);
        poly[8]:=point(xw-w4,yh-h3);
        poly[9]:=point(x+w4,y);
        end;

       end;
    for i := 0 to 9 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,10,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   end;
   canvas.polygon(poly);
end;

procedure TjvShape.DrawMatta;
var
   rgn :Hrgn;
   poly: array[0..15] of TPoint;
   rpoly: array[0..15] of TPoint;
   i:integer;
begin
    case FShape of
       jstMatta:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,y+h4);
        poly[2]:=point(x+w2,y+h2);
        poly[3]:=point(x,yh-h4);
        poly[4]:=point(x,yh);
        poly[5]:=point(x+w4,yh);
        poly[6]:=point(x+w2,y+h2);
        poly[7]:=point(xw-w4,yh);
        poly[8]:=point(xw,yh);
        poly[9]:=point(xw,yh-h4);
        poly[10]:=point(x+w2,y+h2);
        poly[11]:=point(xw,y+h4);
        poly[12]:=point(xw,y);
        poly[13]:=point(xw-w4,y);
        poly[14]:=point(x+w2,y+h2);
        poly[15]:=point(x+w4,y);
        end;
       end;
    for i := 0 to 15 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,16,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   end;
   canvas.polygon(poly);
end;

procedure TjvShape.DrawHexagon;
var
   rgn :Hrgn;
   poly: array[0..5] of TPoint;
   rpoly: array[0..5] of TPoint;
   i:integer;
begin
    case FShape of
       jstHexagon:
        begin
        poly[0]:=point(x+w2,y);
        poly[1]:=point(xw,y+h4);
        poly[2]:=point(xw,yh-h4);
        poly[3]:=point(x+w2,yh);
        poly[4]:=point(x,yh-h4);
        poly[5]:=point(x,y+h4);
        end;
       jstHexagonFlat:
        begin
        poly[0]:=point(x+w4,y);
        poly[1]:=point(xw-w4,y);
        poly[2]:=point(xw,y+h2);
        poly[3]:=point(xw-w4,yh);
        poly[4]:=point(x+w4,yh);
        poly[5]:=point(x,y+h2);
        end;
       end;
    for i := 0 to 5 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,6,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;


procedure TjvShape.DrawWaggle;
var
   rgn :Hrgn;
   poly: array[0..15] of TPoint;
   rpoly: array[0..15] of TPoint;
   i:integer;
begin
    case FShape of
       jstWaggle:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x+w4,y+h8);
        poly[2]:=point(x+w2,y);
        poly[3]:=point(xw-w4,y+h8);
        poly[4]:=point(xw,y);
        poly[5]:=point(xw-w8,y+h4);
        poly[6]:=point(xw,y+h2);
        poly[7]:=point(xw-w8,yh-h4);
        poly[8]:=point(xw,yh);
        poly[9]:=point(xw-w4,yh-h8);
        poly[10]:=point(x+w2,yh);
        poly[11]:=point(x+w4,yh-h8);
        poly[12]:=point(x,yh);
        poly[13]:=point(x+w8,yh-h4);
        poly[14]:=point(x,y+h2);
        poly[15]:=point(x+w8,y+h4);
        end;
       end;
    for i := 0 to 15 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,16,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawHouse;
var
   rgn :Hrgn;
   poly: array[0..4] of TPoint;
   rpoly: array[0..4] of TPoint;
   i:integer;
begin
    case FShape of
       jstHouse:
        begin
         poly[0]:=point(x+w2,y);
         poly[1]:=point(xw,y+h2);
         poly[2]:=point(xw,yh);
         poly[3]:=point(x,yh);
         poly[4]:=point(x,y+h2);
        end;
       end;
    for i := 0 to 4 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,5,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawDiamond;
var
   rgn :Hrgn;
   poly: array[0..3] of TPoint;
   rpoly: array[0..3] of TPoint;
   i:integer;
begin
    case FShape of
       jstDiamond:
        begin
        poly[0]:=point(x+(w div 2),y);
        poly[1]:=point(x+w-1,y+(h div 2));
        poly[2]:=point(x+(w div 2),y+h-1);
        poly[3]:=point(x,y+(h div 2));
        end;
       end;
    for i := 0 to 3 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,4,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;


procedure TjvShape.DrawEllipse;
var
   rgn :Hrgn;
begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      SelectClipRgn(canvas.handle,rgn);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn);
     SetPenBrushForOutLine;
     canvas.Ellipse(X, Y, X + W, Y + H);
   end
   else
     canvas.Ellipse(X, Y, X + W, Y + H);
end;

procedure TjvShape.DrawBowl;
var
   rgn0,rgn1,rgn2 :Hrgn;
begin
   case FShape of
//       jstBowlLeft: Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
//       jstBowlRight: Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
//       jstBowlDown: Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
//       jstBowlUp: Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);

   jstBowlLeft:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn2 := CreateRectRgn(left+X,top+Y,left+X+w2,top+Y+H);
      combineRgn(rgn0,rgn1,rgn2,RGN_AND);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
   end
   else
     canvas.Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
   end;
   jstBowlRight:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn2 := CreateRectRgn(left+X+w2,top+Y,left+X+W,top+Y+H);
      combineRgn(rgn0,rgn1,rgn2,RGN_AND);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
   end
   else
     canvas.Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
   end;
   jstBowlUp:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn2 := CreateRectRgn(left+X,top+Y,left+X+W,top+Y+H2);
      combineRgn(rgn0,rgn1,rgn2,RGN_AND);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     Canvas.Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);
   end
   else
     Canvas.Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);
   end;
   jstBowlDown:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn2 := CreateRectRgn(left+X,top+Y+h2,left+X+W,top+Y+H);
      combineRgn(rgn0,rgn1,rgn2,RGN_AND);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
   end
   else
     canvas.Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
   end;

  end;
end;

procedure TjvShape.DrawCloud;
var
   rgn0,rgn1,rgn2 :Hrgn;
begin
   case FShape of
//       jstBowlLeft: Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
//       jstBowlRight: Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
//       jstBowlDown: Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
//       jstBowlUp: Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);

   jstCloudLeft:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+Xw-W4,top+Yh-h4);
      rgn2 := CreateEllipticRgn(left+X+w4,top+Y+h4,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw-w4,yh-h4);
     canvas.ellipse(x+w4,y+h4,xw,yh);
   end
   else begin
     canvas.ellipse(x,y,xw-w4,yh-h4);
     canvas.ellipse(x+w4,y+h4,xw,yh);
     end;
   end;
   jstDoubleOval:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+w2,top+Yh);
      rgn2 := CreateEllipticRgn(left+X+w2,top+Y,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,x+w2,yh);
     canvas.ellipse(x+w2,y,xw,yh);
   end
   else begin
     canvas.ellipse(x,y,x+w2,yh);
     canvas.ellipse(x+w2,y,xw,yh);
     end;
   end;
   jstDoubleOvalV:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+Xw,top+Y+h2);
      rgn2 := CreateEllipticRgn(left+X,top+Y+h2,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,y+h2);
     canvas.ellipse(x,y+h2,xw,yh);
   end
   else begin
     canvas.ellipse(x,y,xw,y+h2);
     canvas.ellipse(x,y+h2,xw,yh);
     end;
   end;
   jstCloudRight:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X+w4,top+Y,left+Xw,top+Yh-h4);
      rgn2 := CreateEllipticRgn(left+X,top+Y+h4,left+XW-w4,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x+w4,y,xw,yh-h4);
     canvas.ellipse(x,y+h4,xw-w4,yh);
   end
   else begin
     canvas.ellipse(x+w4,y,xw,yh-h4);
     canvas.ellipse(x,y+h4,xw-w4,yh);
     end;
   end;
   end;
end;

procedure TjvShape.DrawPistache;
var
   rgn0,rgn1,rgn2 :Hrgn;
begin
   case FShape of
   jstPistacheTop:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X,top+Y+h2,left+Xw,top+Yh);
      rgn2 := CreateEllipticRgn(left+X,top+Y,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x,y+h2,xw,yh);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x,y+h2,xw,yh);
     end;
   end;
   jstPistacheBottom:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X,top+Y,left+Xw,top+Y+h2);
      rgn2 := CreateEllipticRgn(left+X,top+Y,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x,y,xw,y+h2);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x,y,xw,y+h2);
     end;
   end;
   jstPistacheLeft:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X+w2,top+Y,left+Xw,top+Yh);
      rgn2 := CreateEllipticRgn(left+X,top+Y,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x+w2,y,xw,yh);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x+w2,y,xw,yh);
     end;
   end;
   jstPistacheRight:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X,top+Y,left+X+w2,top+Yh);
      rgn2 := CreateEllipticRgn(left+X,top+Y,left+XW,top+YH);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x,y,x+w2,yh);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.rectangle(x,y,x+w2,yh);
     end;
   end;
   end;
end;

procedure TjvShape.Draw1Hole;
var
   rgn0,rgn1,rgn2 :Hrgn;
begin
   case FShape of
   jst1Hole:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X,top+Y,left+Xw,top+Yh);
      rgn2 := CreateEllipticRgn(left+X+w4,top+Y+h4,left+XW-w4,top+YH-h4);
      combineRgn(rgn0,rgn1,rgn2,RGN_XOR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.rectangle(x,y,xw,yh);
     canvas.ellipse(x+w4,y+h4,xw-w4,yh-h4);
   end
   else begin
     canvas.rectangle(x,y,xw,yh);
     canvas.ellipse(x+w4,y+h4,xw-w4,yh-h4);
     end;
   end;
   jst1HoleBig:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X,top+Y,left+Xw,top+Yh);
      rgn2 := CreateEllipticRgn(left+X+w8,top+Y+h8,left+XW-w8,top+YH-h8);
      combineRgn(rgn0,rgn1,rgn2,RGN_XOR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.rectangle(x,y,xw,yh);
     canvas.ellipse(x+w8,y+h8,xw-w8,yh-h8);
   end
   else begin
     canvas.rectangle(x,y,xw,yh);
     canvas.ellipse(x+w8,y+h8,xw-w8,yh-h8);
     end;
   end;
   end;
end;


procedure TjvShape.Draw2Hole;
var
   rgn0,rgn1,rgn2,rgn3,rgn4 :Hrgn;
begin
   case FShape of
//       jstBowlLeft: Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
//       jstBowlRight: Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
//       jstBowlDown: Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
//       jstBowlUp: Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);

   jst2HoleHoriz:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+Xw,top+YH);
      rgn2 := CreateEllipticRgn(left+X+w8,top+Y+h4,left+X+w2-w8,top+YH-h4);
      combineRgn(rgn0,rgn1,rgn2,RGN_XOR);
      rgn4 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn3 := CreateEllipticRgn(left+X+w2+w8,top+Y+h4,left+Xw-w8,top+YH-h4);
      combineRgn(rgn4,rgn0,rgn3,RGN_XOR);
      SelectClipRgn(canvas.handle,rgn4);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn4);
      DeleteObject(rgn3);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.ellipse(x+w8,y+h4,x+w2-w8,yh-h4);
     canvas.ellipse(x+w2+w8,y+h4,xw-w8,yh-h4);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.ellipse(x+w8,y+h4,x+w2-w8,yh-h4);
     canvas.ellipse(x+w2+w8,y+h4,xw-w8,yh-h4);
     end;
   end;
   jst2HoleVert:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+X+Xw,top+YH);
      rgn2 := CreateEllipticRgn(left+X+w4,top+Y+h8,left+Xw-w4,top+Y+h2-h8);
      combineRgn(rgn0,rgn1,rgn2,RGN_XOR);
      rgn4 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn3 := CreateEllipticRgn(left+X+w4,top+Y+h2+h8,left+Xw-w4,top+YH-h8);
      combineRgn(rgn4,rgn0,rgn3,RGN_XOR);
      SelectClipRgn(canvas.handle,rgn4);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn4);
      DeleteObject(rgn3);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.ellipse(x+w4,y+h8,xw-w4,y+h2-h8);
     canvas.ellipse(x+w4,y+h2+h8,xw-w4,yh-h8);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.ellipse(x+w4,y+h8,xw-w4,y+h2-h8);
     canvas.ellipse(x+w4,y+h2+h8,xw-w4,yh-h8);
     end;
   end;
   end;
end;

procedure TjvShape.Drawflower;
var
   rgn0,rgn1,rgn2,rgn3,rgn4 :Hrgn;
begin
   case FShape of
   jstflower:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y+h3,left+X+w2,top+YH-h3);
      rgn2 := CreateEllipticRgn(left+X+w3,top+Y,left+X+xw-w3,top+Y+h2);
      rgn3 := CreateEllipticRgn(left+X+w2,top+Y+h3,left+Xw,top+YH-h3);
      rgn4 := CreateEllipticRgn(left+X+w3,top+Y+h2,left+Xw-w3,top+Y+H);
      combineRgn(rgn0,rgn1,rgn2,RGN_OR);
      combineRgn(rgn0,rgn0,rgn3,RGN_OR);
      combineRgn(rgn0,rgn0,rgn4,RGN_OR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn4);
      DeleteObject(rgn3);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y+h3,x+w2,yh-h3);
     canvas.ellipse(x+w3,y,xw-w3,y+h2);
     canvas.ellipse(x+w2,y+h3,xw,yh-h3);
     canvas.ellipse(x+w3,y+h2,xw-w3,yh);
   end
   else begin
     canvas.ellipse(x,y+h3,x+w2,yh-h3);
     canvas.ellipse(x+w3,y,xw-w3,y+h2);
     canvas.ellipse(x+w2,y+h3,xw,yh-h3);
     canvas.ellipse(x+w3,y+h2,xw-w3,yh);
     end;
   end;
  end;
end;


procedure TjvShape.DrawTorus;
var
   rgn0,rgn1,rgn2 :Hrgn;
begin
   case FShape of
//       jstBowlLeft: Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
//       jstBowlRight: Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
//       jstBowlDown: Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
//       jstBowlUp: Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);

   jstTorus:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateEllipticRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateEllipticRgn(left+X,top+Y,left+Xw,top+Yh);
      rgn2 := CreateEllipticRgn(left+X+w4,top+Y+h4,left+XW-w4,top+YH-h4);
      combineRgn(rgn0,rgn1,rgn2,RGN_XOR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.ellipse(x,y,xw,yh);
     canvas.ellipse(x+w4,y+h4,xw-w4,yh-h4);
   end
   else begin
     canvas.ellipse(x,y,xw,yh);
     canvas.ellipse(x+w4,y+h4,xw-w4,yh-h4);
     end;
   end;
   end;
end;

procedure TjvShape.DrawFrame;
var
   rgn0,rgn1,rgn2 :Hrgn;
   dw,dh:integer;
begin
   case Fshape of
    jstFrame: begin dw:=w4;dh:=h4;end;
    jstFrameNarrow: begin dw:=w8;dh:=h8;end;
    end;
   case FShape of
//       jstBowlLeft: Pie(x,y,x+w,y+h,x+w2,y,x+w2,y+h);
//       jstBowlRight: Pie(x,y,x+w,y+h,x+w2,y+h,x+w2,y);
//       jstBowlDown: Pie(x,y,x+w,y+h,x,y+h2,x+w,y+h2);
//       jstBowlUp: Pie(x,y,x+w,y+h,x+w,y+h2,x,y+h2);

   jstFrame,jstFrameNarrow:
   begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn0 := CreateRectRgn(left+X,top+Y,left+X+W,top+Y+H);
      rgn1 := CreateRectRgn(left+X,top+Y,left+Xw,top+Yh);
      rgn2 := CreateRectRgn(left+X+dw,top+Y+dh,left+XW-dw,top+YH-dh);
      combineRgn(rgn0,rgn1,rgn2,RGN_XOR);
      SelectClipRgn(canvas.handle,rgn0);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn2);
      DeleteObject(rgn1);
      DeleteObject(rgn0);
     SetPenBrushForOutLine;
     canvas.rectangle(x,y,xw,yh);
     canvas.rectangle(x+dw,y+dh,xw-dw,yh-dh);
   end
   else begin
     canvas.rectangle(x,y,xw,yh);
     canvas.rectangle(x+dw,y+dh,xw-dw,yh-dh);
     end;
   end;
   end;
end;

procedure TjvShape.DrawRectangle;
var
   rgn :Hrgn;
begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn := CreateRectRgn(left+X,top+Y,left+X+W,top+Y+H);
      SelectClipRgn(canvas.handle,rgn);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn);
     SetPenBrushForOutLine;
     canvas.Rectangle(X, Y, X + W, Y + H);
   end
   else
     canvas.Rectangle(X, Y, X + W, Y + H);
end;

procedure TjvShape.DrawRoundRect;
var
   rgn :Hrgn;
begin
   if FGradient then begin
      SetPenBrushForGradient;
      rgn := CreateRoundRectRgn(left+X,top+Y,left+X+W,top+Y+H,S div 4, S div 4);
      SelectClipRgn(canvas.handle,rgn);
      FillWithGradient;
      SelectClipRgn(canvas.handle,0);
      DeleteObject(rgn);
     SetPenBrushForOutLine;
     canvas.RoundRect(X, Y, X + W, Y + H, S div 4, S div 4);
   end
   else
     canvas.RoundRect(X, Y, X + W, Y + H, S div 4, S div 4);
end;


procedure TjvShape.DrawUBar;
var
   rgn :Hrgn;
   poly: array[0..7] of TPoint;
   rpoly: array[0..7] of TPoint;
   i:integer;
begin
    case FShape of
       jstUBarUp:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh);
        poly[2]:=point(xw,yh);
        poly[3]:=point(xw,y);
        poly[4]:=point(xw-w4,y);
        poly[5]:=point(xw-w4,yh-h4);
        poly[6]:=point(x+w4,yh-h4);
        poly[7]:=point(x+w4,y);
        end;
       jstUBarLeft:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(xw,y);
        poly[2]:=point(xw,yh);
        poly[3]:=point(x,yh);
        poly[4]:=point(x,yh-h4);
        poly[5]:=point(xw-w4,yh-h4);
        poly[6]:=point(xw-w4,y+h4);
        poly[7]:=point(x,y+h4);
        end;
       jstUBarDown:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh);
        poly[2]:=point(x+w4,yh);
        poly[3]:=point(x+w4,y+h4);
        poly[4]:=point(xw-w4,y+h4);
        poly[5]:=point(xw-w4,yh);
        poly[6]:=point(xw,yh);
        poly[7]:=point(xw,y);
        end;
       jstUBarRight:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh);
        poly[2]:=point(xw,yh);
        poly[3]:=point(xw,yh-h4);
        poly[4]:=point(x+w4,yh-h4);
        poly[5]:=point(x+w4,y+h4);
        poly[6]:=point(xw,y+h4);
        poly[7]:=point(xw,y);
        end;
       end;
    for i := 0 to 7 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,8,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawIBar;
var
   rgn :Hrgn;
   poly: array[0..11] of TPoint;
   rpoly: array[0..11] of TPoint;
   i:integer;
begin
    case FShape of
       jstIBar:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(xw,y);
        poly[2]:=point(xw,y+h4);
        poly[3]:=point(xw-w4,y+h4);
        poly[4]:=point(xw-w4,yh-h4);
        poly[5]:=point(xw,yh-h4);
        poly[6]:=point(xw,yh);
        poly[7]:=point(x,yh);
        poly[8]:=point(x,yh-h4);
        poly[9]:=point(x+w4,yh-h4);
        poly[10]:=point(x+w4,y+h4);
        poly[11]:=point(x,y+h4);
        end;
       jstHBar:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x+w4,y);
        poly[2]:=point(x+w4,y+h4);
        poly[3]:=point(xw-h4,y+h4);
        poly[4]:=point(xw-h4,y);
        poly[5]:=point(xw,y);
        poly[6]:=point(xw,yh);
        poly[7]:=point(xw-w4,yh);
        poly[8]:=point(xw-w4,yh-h4);
        poly[9]:=point(x+w4,yh-h4);
        poly[10]:=point(x+w4,yh);
        poly[11]:=point(x,yh);
        end;
       end;
    for i := 0 to 11 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,12,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;

procedure TjvShape.DrawLBar;
var
   rgn :Hrgn;
   poly: array[0..5] of TPoint;
   rpoly: array[0..5] of TPoint;
   i:integer;
begin
    case FShape of
       jstLBarLeft:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(x,yh);
        poly[2]:=point(xw,yh);
        poly[3]:=point(xw,yh-h4);
        poly[4]:=point(x+w4,yh-h4);
        poly[5]:=point(x+w4,y);
        end;
       jstLBarRight:
        begin
        poly[0]:=point(xw,y);
        poly[1]:=point(xw,yh);
        poly[2]:=point(x,yh);
        poly[3]:=point(x,yh-h4);
        poly[4]:=point(xw-h4,yh-h4);
        poly[5]:=point(xw-h4,y);
        end;
       jstLBarUpLeft:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(xw,y);
        poly[2]:=point(xw,y+h4);
        poly[3]:=point(x+w4,y+h4);
        poly[4]:=point(x+w4,yh);
        poly[5]:=point(x,yh);
        end;
       jstLBarUpRight:
        begin
        poly[0]:=point(x,y);
        poly[1]:=point(xw,y);
        poly[2]:=point(xw,yh);
        poly[3]:=point(xw-h4,yh);
        poly[4]:=point(xw-h4,y+h4);
        poly[5]:=point(x,y+h4);
        end;
       end;
    for i := 0 to 5 do
    begin
       rpoly[i].x := left+poly[i].x;
       rpoly[i].y := top+poly[i].y;
    end;
   if FGradient then begin
   SetPenBrushForGradient;
   rgn :=  Winprocs.CreatePolygonRgn(rpoly,6,WINDING);
   SelectClipRgn(canvas.handle,rgn);
   FillWithGradient;
   SelectClipRgn(canvas.handle,0);
   DeleteObject(rgn);
   SetPenBrushForOutLine;
   canvas.polygon(poly);
   end
   else
   canvas.polygon(poly);
end;



procedure TjvShape.FillWithGradient;
var
  TargetRect : TRect;
  i         : Integer;
  clrFrom,clrTo : TColor;
  RGBFromR,RGBFromG,RGBFromB : Byte;
  RGBDiffR,RGBDiffG,RGBDiffB : integer;

begin
   clrFrom := FGradientColor;
   clrTo := FGradientColor;

   Case FFillDirection of
   jgdUp: clrFrom := FBrush.Color;
   jgdDown: clrTo := FBrush.Color;
   jgdLeft: clrFrom := FBrush.Color;
   jgdRight: clrTo := FBrush.Color;
   jgdRectOut: clrTo:=FBrush.color;
   jgdRectIn:clrFrom:=FBrush.color;
   jgdCircOut: clrTo:=FBrush.color;
   jgdCircIn:clrFrom:=FBrush.color;
   jgdHorizCenter:clrFrom:=FBrush.color;
   jgdVertCenter:clrFrom:=FBrush.color;
   jgdNWSE,jgdNESW,jgdSENW,jgdSWNE:clrFrom:=FBrush.color;
   jgdUright,jgdULeft,jgdUUp,jgdUDown:clrFrom:=FBrush.color;
   jgdDuo,jgdQuatro,jgdRCMix,jgdRCModulo:clrFrom:=FBrush.color;
   jgdLNE,jgdLNW,jgdUpDown,jgdLeftRight:clrFrom:=FBrush.color;
   end;

   RGBFromR := GetRValue (ColorToRGB (ClrFrom));
   RGBFromG := GetGValue (ColorToRGB (ClrFrom));
   RGBFromB := GetBValue (ColorToRGB (ClrFrom));
   RGBDiffR := GetRValue (ColorToRGB (ClrTo)) - RGBFromR;
   RGBDiffG := GetGValue (ColorToRGB (ClrTo)) - RGBFromG;
   RGBDiffB := GetBValue (ColorToRGB (ClrTo)) - RGBFromB;

   Canvas.Pen.Style := psSolid;
   Canvas.Pen.Mode := pmCopy;
   case FFillDirection of
    jgdLeft,jgdRight:
     begin
     for i := 0 to 255 do
     begin
         TargetRect := Rect(MulDiv (i,Width,256),0,
                            MulDiv (i+1,Width,256),Height);
         Canvas.Brush.Color := RGB (RGBFromR + MulDiv(i,RGBDiffR, 255),
                                    RGBFromG + MulDiv(i,RGBDiffG, 255),
                                    RGBFromB + MulDiv(i,RGBDiffB, 255));
         Canvas.FillRect (TargetRect);
     end;
    end; {if left or right}
    jgdUp,jgdDown:
    begin
     for i := 0 to $ff do
     begin
         TargetRect := Rect(0,MulDiv (i,Height,256),
                            Width,MulDiv (i+1,Height,256));
         Canvas.Brush.Color := RGB (RGBFromR + MulDiv(i,RGBDiffR,255),
                                    RGBFromG + MulDiv(i,RGBDiffG,255),
                                    RGBFromB + MulDiv(i,RGBDiffB,255));
         Canvas.FillRect (TargetRect);
     end;
   end;
   jgdRectOut,jgdRectIn: DoRectangle(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdCircOut,jgdCircIn: DoCircle(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdHorizCenter: DoHorizCenter(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdVertCenter: DoVertCenter(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdNWSE: doGradNWSE(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdNESW: doGradNESW(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdSENW: doGradSENW(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdSWNE: doGradSWNE(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdURight: doGradURight(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdLNE: doGradLNE(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdLNW: doGradLNW(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdULeft: doGradULeft(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdUUp: doGradUUp(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdUDown: doGradUDown(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdRCMix: doGradRCMix(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdRCModulo: doGradRCModulo(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdQuatro: doGradQuatro(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdDuo:doGradDuo(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdUpDown:doGradUpDown(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);
   jgdLeftRight:doGradLeftRight(
     RGBFromR,RGBFromG,RGBFromB,RGBDiffR,RGBDiffG,RGBDiffB);

  end;
end;

procedure TjvShape.DoRectangle(fr, fg, fb, dr, dg, db : Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw, Ph : Real;
  x1,y1,x2,y2 : Real;
begin
  Canvas.Pen.Style := psClear;
  Canvas.Pen.Mode := pmCopy;
  x1 := 0;
  x2 := Width+2;
  y1 := 0;
  y2 := Height+2;
  Pw := (Width / 2) / 255;
  Ph := (Height / 2) / 255;
  for I := 0 to 255 do begin         //Make rectangles of color
    x1 := x1 + Pw;
    x2 := X2 - Pw;
    y1 := y1 + Ph;
    y2 := y2 - Ph;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    Canvas.FillRect(Rect(Trunc(x1),Trunc(y1),Trunc(x2),Trunc(y2)));
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.DoCircle(fr, fg, fb, dr, dg, db : Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw, Ph : Real;
  x1,y1,x2,y2 : Real;
begin
  Canvas.Pen.Style := psClear;
  Canvas.Pen.Mode := pmCopy;
  x1 := 0;
  x2 := Width+2;
  y1 := 0;
  y2 := Height+2;
  Pw := (Width / 2) / 255;
  Ph := (Height / 2) / 255;
  for I := 0 to 255 do begin         //Make cicles of color
    x1 := x1 + Pw;
    x2 := X2 - Pw;
    y1 := y1 + Ph;
    y2 := y2 - Ph;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    Canvas.Ellipse(Trunc(x1),Trunc(y1),Trunc(x2),Trunc(y2));
  end;
  Canvas.Pen.Style := psSolid;
end;


procedure TjvShape.DoVertCenter(fr, fg, fb, dr, dg, db : Integer);
var
  ColorRect: TRect;
  I: Integer;
  R, G, B : Byte;
  Haf : Integer;
begin
  Haf := Height Div 2;
  ColorRect.Left := 0;
  ColorRect.Right := Width;
  for I := 0 to Haf do begin
    ColorRect.Top := MulDiv (I, Haf, Haf);
    ColorRect.Bottom := MulDiv (I + 1, Haf, Haf);
    R := fr + MulDiv(I, dr, Haf);
    G := fg + MulDiv(I, dg, Haf);
    B := fb + MulDiv(I, db, Haf);
    Canvas.Brush.Color := RGB(R, G, B);
    Canvas.FillRect(ColorRect);
    ColorRect.Top := Height - (MulDiv (I, Haf, Haf));
    ColorRect.Bottom := Height - (MulDiv (I + 1, Haf, Haf));
    Canvas.FillRect(ColorRect);
  end;
end;

procedure TjvShape.DoHorizCenter(fr, fg, fb, dr, dg, db : Integer);
var
  ColorRect: TRect;
  I: Integer;
  R, G, B : Byte;
  Haf : Integer;
begin
  Haf := Width Div 2;
  ColorRect.Top := 0;
  ColorRect.Bottom := Height;
  for I := 0 to Haf do begin
    ColorRect.Left := MulDiv (I, Haf, Haf);
    ColorRect.Right := MulDiv (I + 1, Haf, Haf);
    R := fr + MulDiv(I, dr, Haf);
    G := fg + MulDiv(I, dg, Haf);
    B := fb + MulDiv(I, db, Haf);
    Canvas.Brush.Color := RGB(R, G, B);
    Canvas.FillRect(ColorRect);
    ColorRect.Left := Width - (MulDiv (I, Haf, Haf));
    ColorRect.Right := Width - (MulDiv (I + 1, Haf, Haf));
    Canvas.FillRect(ColorRect);
  end;
end;



procedure TjvShape.SetPenBrushForGradient;
begin
     canvas.Brush.style := bsSolid;
end;

procedure TjvShape.SetPenBrushForOutline;
begin
    canvas.Brush.style := bsClear;
    canvas.pen.color := FPen.color;
    canvas.pen.width := FPen.Width ;
    canvas.pen.style := FPen.Style ;
end;


procedure TjvShape.SetFillDirection(const Value: TjvFillDirection);
begin
  if Value <> FFillDirection then
  begin
    FFillDirection := Value;
    Refresh;
  end;
end;

procedure TjvShape.SetGradientColor(const Value: Tcolor);
begin
  if Value <> FGradientColor then
  begin
    FGradientColor := Value;
    Refresh;
  end;

end;

procedure TjvShape.SetGradient(const Value: boolean);
begin
  if Value <> FGradient then
  begin
    FGradient := Value;
    Refresh;
  end;
end;

procedure TjvShape.SetCaption(const Value: String);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Invalidate;
  end;
end;

procedure TjvShape.TextRotate(bitmap:tbitmap;x, y, angle: integer; atext: string;
  afont: tfont);
var dc:hdc;
    fnt:LogFont;
    plf:PLogFont;
    hfnt,hfntPrev:hfont;
    i:integer;
    fname,s:string;
begin
s:=atext;
fnt.lfEscapement :=angle*10;
fnt.lfOrientation :=angle*10;
if fsbold in afont.Style  then
  fnt.lfWeight :=FW_Bold
  else
  fnt.lfWeight :=FW_NORMAL;
if fsitalic in afont.style then
  fnt.lfItalic :=1
  else
  fnt.lfItalic :=0;
if fsunderline in afont.style then
  fnt.lfUnderline :=1
  else
  fnt.lfUnderline :=0;
fnt.lfStrikeOut :=0;
fnt.lfHeight :=abs(afont.Height);
fname:=afont.Name ;
for i:=1 to length(fname) do
  fnt.lffacename[i-1]:=fname[i];
fnt.lfFaceName [length(fname)]:=#0;
hfnt := CreateFontIndirect(fnt);
dc:=bitmap.canvas.handle;
SetBkMode(dc, TRANSPARENT);
SetTextColor(dc,afont.color);
hfntPrev := SelectObject(dc, hfnt);
//textout(dc,x,y,@atext[1],length(atext));
textout(dc,x,y,@s[1],length(s));
SelectObject(dc, hfntPrev);
DeleteObject(hfnt);
end;


procedure TjvShape.SetCaptionAngle(const Value: integer);
begin
  if FCaptionAngle <> Value then
  begin
    FCaptionAngle := Value;
    Invalidate;

  end;
end;

procedure TjvShape.DrawText;
var
    bm:Tbitmap;
    fx,fy,fw,fh:integer;
begin
    bm:=tbitmap.create;
    bm.width:=width;
    bm.height:=height;
    bm.canvas.font.assign(font);
    fw:=bm.canvas.TextWidth (FCaption);
    fh:=bm.canvas.TextHeight (FCaption);
    if fw>xw then
      fx:=5
      else
      fx:=(width-fw) div 2;
    if fh>yh then
      fy:=5
      else
      fy:=(height-fh) div 2;
    if FCaptionCentered then
    textrotate(bm,fx,fy,FCaptionAngle,FCaption,font)
    else
    textrotate(bm,FCaptionX,FCaptionY,FCaptionAngle,FCaption,font);
   bm.transparent:=true;
   bm.TransparentMode :=tmfixed;
   bm.TransparentColor :=clwhite;
   canvas.Draw (0,0,bm);
   bm.free;
end;

procedure TjvShape.SetCaptionX(const Value: integer);
begin
  if FCaptionX <> Value then
  begin
    FCaptionX := Value;
    Invalidate;
  end;

end;

procedure TjvShape.SetCaptionY(const Value: integer);
begin
  if FCaptionY <> Value then
  begin
    FCaptionY := Value;
    Invalidate;
  end;

end;

procedure TjvShape.SetCaptionCentered(const Value: boolean);
begin
  if FCaptionCentered <> Value then
  begin
    FCaptionCentered := Value;
    Invalidate;
  end;
end;

procedure TjvShape.SetonUserDraw(const Value: TonUserDraw);
begin
  FonUserDraw := Value;
end;

procedure TjvShape.DoUserDraw;
begin
  if assigned (FonUserDraw) then
    FonUserDraw(self);

end;


procedure TjvShape.SetbyUser(const Value: boolean);
begin
  if FbyUser <> Value then
  begin
    FbyUser := Value;
    Invalidate;
  end;

end;

procedure TjvShape.doGradNWSE(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw: Real;
  x0,y0,x1,y1,x2,y2,x3,y3 : Real;
  points:array[0..3] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Pw := (Width+height) / 255;
  for I := 0 to 254 do begin         //Make trapeziums of color
    x0 := i*Pw;
    if (x0<width) then y0:=0 else
      begin
      y0:=x0-width;
      x0:=width-1;
      end;
    x1:=(i+1)*pw;
    if (x1<width) then begin
      y1:=0;
      end
      else begin
      y1:=x1-width;
      x1:=width-1;
      end;
    y2:=i*pw;
    if (y2<height) then x2:=0 else
      begin
      x2:=y2-height;
      y2:=height-1;
      end;
    y3:=(i+1)*pw;
    if (y3<height) then x3:=0 else
      begin
      x3:=y3-height;
      y3:=height-1;
      end;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(x0),Trunc(y0));
    points[1]:=point(Trunc(x1),Trunc(y1));
    points[3]:=point(Trunc(x2),Trunc(y2));
    points[2]:=point(Trunc(x3),Trunc(y3));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradNESW(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw: Real;
  x0,y0,x1,y1,x2,y2,x3,y3 : Real;
  points:array[0..3] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Pw := (Width+height) / 255;
  for I := 0 to 254 do begin         //Make trapeziums of color
    y0 := i*Pw;
    if (y0<height) then x0:=width-1 else
      begin
      x0:=width-1-(y0-height);
      y0:=height-1;
      end;
    y1:=(i+1)*pw;
    if (y1<height) then x1:=width-1 else
      begin
      x1:=width-1-(y1-height);
      x1:=width-1;
      end;
    x2:=width-1-(i*pw);
    if (x2>0) then y2:=0 else
      begin
      y2:=-x2;
      x2:=0;
      end;
    x3:=width-1-((i+1)*pw);
    if (x3>0) then y3:=0 else
      begin
      y3:=-x3;
      x3:=0;
      end;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(x0),Trunc(y0));
    points[1]:=point(Trunc(x1),Trunc(y1));
    points[3]:=point(Trunc(x2),Trunc(y2));
    points[2]:=point(Trunc(x3),Trunc(y3));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradSENW(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw: Real;
  x0,y0,x1,y1,x2,y2,x3,y3 : Real;
  points:array[0..3] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Pw := (Width+height) / 255;
  for I := 0 to 254 do begin         //Make trapeziums of color
    y0 := height-1-(i*Pw);
    if (y0>0) then x0:=width-1 else
      begin
      x0:=width-1+y0;
      y0:=0;
      end;
    y1:=height-1-((i+1)*pw);
    if (y1>0) then x1:=width-1 else
      begin
      x1:=width-1+y1;
      y1:=0;
      end;
    x2:=width-1-(i*pw);
    if (x2>0) then y2:=height-1 else
      begin
      y2:=height-1+x2;
      x2:=0;
      end;
    x3:=width-1-((i+1)*pw);
    if (x3>0) then y3:=height-1 else
      begin
      y3:=height-1+x3;
      x3:=0;
      end;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(x0),Trunc(y0));
    points[1]:=point(Trunc(x1),Trunc(y1));
    points[3]:=point(Trunc(x2),Trunc(y2));
    points[2]:=point(Trunc(x3),Trunc(y3));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradSWNE(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw: Real;
  x0,y0,x1,y1,x2,y2,x3,y3 : Real;
  points:array[0..3] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Pw := (Width+height) / 255;
  for I := 0 to 254 do begin         //Make trapeziums of color
    y0 := height-1-(i*Pw);
    if (y0>0) then x0:=0 else
      begin
      x0:=-y0;
      y0:=0;
      end;
    y1:=height-1-((i+1)*pw);
    if (y1>0) then x1:=0 else
      begin
      x1:=-y1;
      y1:=0;
      end;
    x2:=(i*pw);
    if (x2<width) then y2:=height-1 else
      begin
      y2:=height-1-(x2-width);
      x2:=width-1;
      end;
    x3:=(i+1)*pw;
    if (x3<width) then y3:=height-1 else
      begin
      y3:=height-1-(x3-width);
      x3:=width-1;
      end;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(x0),Trunc(y0));
    points[1]:=point(Trunc(x1),Trunc(y1));
    points[3]:=point(Trunc(x2),Trunc(y2));
    points[2]:=point(Trunc(x3),Trunc(y3));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradURight(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  points:array[0..7] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := (height/2) / 255;
  pw:=width/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(width-1),Trunc(i*ph));
    points[1]:=point(Trunc(i*pw),Trunc(i*ph));
    points[2]:=point(Trunc(i*pw),Trunc(height-1-i*ph));
    points[3]:=point(Trunc(width-1),Trunc(height-1-i*ph));
    points[4]:=point(Trunc(width-1),Trunc(height-1-i*ph-ph));
    points[5]:=point(Trunc(i*pw+pw),Trunc(height-1-i*ph-ph));
    points[6]:=point(Trunc(i*pw+pw),Trunc(i*ph+ph));
    points[7]:=point(Trunc(width-1),Trunc(i*ph+ph));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradULeft(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  points:array[0..7] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := (height/2) / 255;
  pw:=width/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(0),Trunc(i*ph));
    points[1]:=point(Trunc(width-1-i*pw),Trunc(i*ph));
    points[2]:=point(Trunc(width-1-i*pw),Trunc(height-1-i*ph));
    points[3]:=point(Trunc(0),Trunc(height-1-i*ph));
    points[4]:=point(Trunc(0),Trunc(height-1-i*ph-ph));
    points[5]:=point(Trunc(width-1-i*pw-pw),Trunc(height-1-i*ph-ph));
    points[6]:=point(Trunc(width-1-i*pw-pw),Trunc(i*ph+ph));
    points[7]:=point(Trunc(0),Trunc(i*ph+ph));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradUDown(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  points:array[0..7] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := height / 255;
  pw:=width/2/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(i*pw),Trunc(height-1));
    points[1]:=point(Trunc(i*pw),Trunc(i*ph));
    points[2]:=point(Trunc(width-1-i*pw),Trunc(i*ph));
    points[3]:=point(Trunc(width-1-i*pw),Trunc(height-1));
    points[4]:=point(Trunc(width-1-i*pw-pw),Trunc(height-1));
    points[5]:=point(Trunc(width-1-i*pw-pw),Trunc(i*ph+ph));
    points[6]:=point(Trunc(i*pw+pw),Trunc(i*ph+ph));
    points[7]:=point(Trunc(i*pw+pw),Trunc(height-1));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradUUp(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  points:array[0..7] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := height / 255;
  pw:=width/2/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(i*pw),Trunc(0));
    points[1]:=point(Trunc(i*pw),Trunc(height-1-i*ph));
    points[2]:=point(Trunc(width-1-i*pw),Trunc(height-1-i*ph));
    points[3]:=point(Trunc(width-1-i*pw),Trunc(0));
    points[4]:=point(Trunc(width-1-i*pw-pw),Trunc(0));
    points[5]:=point(Trunc(width-1-i*pw-pw),Trunc(height-1-i*ph-ph));
    points[6]:=point(Trunc(i*pw+pw),Trunc(height-1-i*ph-ph));
    points[7]:=point(Trunc(i*pw+pw),Trunc(0));
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradRCMix(fr, fg, fb, dr, dg, db: Integer);
var
  I,x3,y3: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := (height/2) / 255;
  pw:=(width/2)/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
     x3:=trunc(width-2*i*pw) div 4;
     y3:=trunc(height-2*i*ph) div 4;
    if i=0 then begin x3:=0;y3:=0 end;
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    if i<63 then
    Canvas.roundrect(trunc(i*pw),trunc(i*ph),
     trunc(width-i*pw),trunc(height-1-i*ph),
     x3,y3)
    else
    Canvas.ellipse(trunc(i*pw),trunc(i*ph),
     trunc(width-i*pw),trunc(height-1-i*ph));
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradRCModulo(fr, fg, fb, dr, dg, db: Integer);
var
  I,x3,y3: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  IsRect:boolean;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := (height/2) / 255;
  pw:=(width/2)/255;
  IsRect:=false;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
     x3:=trunc(width-2*i*pw) div 4;
     y3:=trunc(height-2*i*ph) div 4;
    if i=0 then begin x3:=0;y3:=0 end;
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    if (i mod 10)=0 then IsRect:= not IsRect;
    if IsRect then
    Canvas.roundrect(trunc(i*pw),trunc(i*ph),
     trunc(width-i*pw),trunc(height-1-i*ph),
     x3,y3)
    else
    Canvas.ellipse(trunc(i*pw),trunc(i*ph),
     trunc(width-i*pw),trunc(height-1-i*ph));
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradQuatro(fr, fg, fb, dr, dg, db: Integer);
var
  I,w2,h2: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := (height/4) / 255;
  pw:=(width/4)/255;
  w2:=width div 2;
  h2:=height div 2;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    Canvas.rectangle(trunc(i*pw),trunc(i*ph),
     trunc(w2+1-i*pw),trunc(h2+1-i*ph));
    Canvas.rectangle(trunc(w2-1+i*pw),trunc(i*ph),
     trunc(width-1-i*pw),trunc(h2+1-i*ph));
    Canvas.rectangle(trunc(i*pw),trunc(h2-1+i*ph),
     trunc(w2+1-i*pw),trunc(height-1-i*ph));
    Canvas.rectangle(trunc(w2-1+i*pw),trunc(h2-1+i*ph),
     trunc(width-1-i*pw),trunc(height-1-i*ph));
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradDuo(fr, fg, fb, dr, dg, db: Integer);
var
  I,w2: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := (height/2) / 255;
  pw:=(width/4)/255;
  w2:=width div 2;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    Canvas.rectangle(trunc(i*pw),trunc(i*ph),
     trunc(w2+1-i*pw),trunc(height-1-i*ph));
    Canvas.rectangle(trunc(w2-1+i*pw),trunc(i*ph),
     trunc(width-1-i*pw),trunc(height-1-i*ph));
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradLNE(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  points:array[0..5] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := height / 255;
  pw:=width/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(i*pw),0);
    points[1]:=point(Trunc(i*pw),Trunc(height-1-i*ph));
    points[2]:=point(Trunc(width-1),Trunc(height-1-i*ph));
    points[3]:=point(Trunc(width-1),Trunc(height-1-i*ph-ph));
    points[4]:=point(Trunc(i*pw+pw),Trunc(height-1-i*ph-ph));
    points[5]:=point(Trunc(i*pw+pw),0);
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradLNW(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  Pw,ph: Real;
  points:array[0..5] of TPoint;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := height / 255;
  pw:=width/255;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    points[0]:=point(Trunc(width-1-i*pw),0);
    points[1]:=point(Trunc(width-1-i*pw),Trunc(height-1-i*ph));
    points[2]:=point(0,Trunc(height-1-i*ph));
    points[3]:=point(0,Trunc(height-1-i*ph-ph));
    points[4]:=point(Trunc(width-1-i*pw-pw),Trunc(height-1-i*ph-ph));
    points[5]:=point(Trunc(width-1-i*pw-pw),0);
    Canvas.polygon(points);
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradUpDown(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  ph: Real;
  w2:integer;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Ph := height / 255;
  w2:=width div 2;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    Canvas.Fillrect(rect(0,trunc(i*ph),w2,trunc(i*ph+ph)));
    Canvas.Fillrect(rect(w2,trunc(height-1-i*ph-ph),width-1,trunc(height-1-i*ph)));
  end;
  Canvas.Pen.Style := psSolid;
end;

procedure TjvShape.doGradLeftRight(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B : Byte;
  pw: Real;
  h2:integer;
begin
  Canvas.Pen.Style := psclear;
  Canvas.Pen.Mode := pmCopy;
  Pw := width / 255;
  h2:=height div 2;
  for I := 0 to 255 do begin         //Make trapeziums of color
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    Canvas.Fillrect(rect(trunc(i*pw),0,trunc(i*pw+pw),h2));
    Canvas.Fillrect(rect(trunc(width-1-i*pw-pw),h2,trunc(width-1-i*pw),height-1));
  end;
  Canvas.Pen.Style := psSolid;
end;

end.

