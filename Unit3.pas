unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Skia, Skia.FMX, FMX.Ani;

type
  TFrame3 = class(TFrame)
    SVG: TSkSvg;
  private
    FlineX: Single;
    FLineY: Single;
    FAngle: Single;
    FOnClickMenu: TNotifyEvent;
    FOnClickBack: TNotifyEvent;
    FDash: Integer;
    procedure setAngle(const Value: Single);
    procedure SetLineX(const Value: Single);
    procedure setLineY(const Value: Single);
    procedure SetDash(const Value: Integer);
  protected
    Procedure Paint; Override;
    Procedure Click; Override;
  public
    Constructor Create(aOwner : TComponent); Override;
    Procedure ToHamburger;
    Procedure ToBack;
    Property Angle : Single  Read FAngle Write setAngle;
    Property LineY : Single  Read FLineY Write setLineY;
    property LineX : Single  Read FlineX Write SetLineX;
    property Dash  : Integer Read FDash  Write SetDash;
    Property OnCLickMenu : TNotifyEvent Read FOnClickMenu Write FOnClickMenu;
    Property OnClickBack : TNotifyEvent Read FOnClickBack Write FOnClickBack;
  end;

implementation

{$R *.fmx}

{ TFrame3 }

constructor TFrame3.Create(aOwner: TComponent);
begin
inherited;
FAngle := 0;
FLineY := 0;
FLineX := 145;
FDash  := 572;
end;

procedure TFrame3.Paint;
begin
inherited;
SVG.Redraw;
end;

procedure TFrame3.setAngle(const Value: Single);
begin
FAngle := Value;
SVG.Svg.DOM.FindNodeById('lu').TrySetAttribute('transform', 'translate(0 ' +FLineY.ToString.Replace(',', '.')+') rotate(-'+FAngle.ToString.Replace(',','.')+' 55 80)');
SVG.Svg.DOM.FindNodeById('ld').TrySetAttribute('transform', 'translate(0 -'+FLineY.ToString.Replace(',', '.')+') rotate( '+FAngle.ToString.Replace(',','.')+' 55 120)');
Repaint;
end;

procedure TFrame3.SetDash(const Value: Integer);
begin
FDash := Value;
SVG.Svg.DOM.FindNodeById('c1').TrySetAttribute('stroke-dasharray', FDash.ToString+', 1000');
Repaint;
end;

procedure TFrame3.SetLineX(const Value: Single);
begin
FlineX := Value;
SVG.Svg.DOM.FindNodeById('lu').TrySetAttribute('x2', FLineX.ToString.Replace(',', '.'));
SVG.Svg.DOM.FindNodeById('ld').TrySetAttribute('x2', FLineX.ToString.Replace(',', '.'));
Repaint
end;

procedure TFrame3.setLineY(const Value: Single);
begin
FLineY := Value;
SetAngle(FAngle);
end;

procedure TFrame3.ToBack;
begin
TAnimator.AnimateFloat(Self, 'Angle', 45);
TAnimator.AnimateFloat(Self, 'LineY', 20);
TAnimator.AnimateFloat(Self, 'LineX', 105);
//TAnimator.AnimateInt(Self, 'Dash', 0);
end;

procedure TFrame3.ToHamburger;
begin
TAnimator.AnimateFloat(Self, 'Angle', 0);
TAnimator.AnimateFloat(Self, 'LineY', 0);
TAnimator.AnimateFloat(Self, 'LineX', 145);
//TAnimator.AnimateInt(Self, 'Dash', 572);
end;

procedure TFrame3.Click;
begin
inherited;
if FLineY = 0 then
   Begin
   ToBack;
   if Assigned(FOnClickMenu) then OnClickMenu(Self);
   End
Else
   begin
   ToHamburger;
   if Assigned(FOnClickBack) then OnClickBack(Self);
   end;
end;



end.
