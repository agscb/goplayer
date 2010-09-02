package goplayer
{
  import flash.display.DisplayObject
  import flash.events.TimerEvent
  import flash.utils.Timer
  import flash.utils.getTimer

  public class Fader
  {
    private const timer : Timer = new Timer(0)

    private var object : DisplayObject
    private var speed : Duration

    private var _targetAlpha : Number
    private var startAlpha : Number
    private var startTime : uint

    public function Fader(object : DisplayObject, speed : Duration)
    {
      this.object = object
      this.speed = speed

      timer.addEventListener(TimerEvent.TIMER, handleTimer)
    }

    private function handleTimer(event : TimerEvent) : void
    {
      update()

      if (ended)
        timer.stop()
    }

    private function get ended() : Boolean
    { return phase == 1 }

    public function set targetAlpha(value : Number) : void
    {
      if (value != object.alpha)
        fadeTo(value)
    }

    private function fadeTo(value : Number) : void
    {
      _targetAlpha = value
      startAlpha = object.alpha
      startTime = getTimer()
      timer.start()
    }

    private function update() : void
    { object.alpha = startAlpha + deltaAlpha * phase }

    private function get deltaAlpha() : Number
    { return _targetAlpha - startAlpha }

    private function get phase() : Number
    { return clamp(elapsedTime.dividedBy(duration), 0, 1) }

    private function get elapsedTime() : Duration
    { return Duration.milliseconds(getTimer() - startTime) }

    private function get duration() : Duration
    { return speed.scaledBy(Math.abs(_targetAlpha - startAlpha)) }
  }
}