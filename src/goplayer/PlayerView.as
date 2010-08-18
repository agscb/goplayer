package goplayer
{
  import flash.display.Bitmap
  import flash.display.Loader
  import flash.display.Sprite
  import flash.events.Event
  import flash.events.TimerEvent
  import flash.geom.Point
  import flash.geom.Rectangle
  import flash.media.Video
  import flash.net.NetStream
  import flash.net.URLRequest
  import flash.utils.Timer

  public class PlayerView extends Sprite
  {
    private const timer : Timer = new Timer(30)
    private const screenshot : Loader = new Loader
    private const videoContainer : Sprite = new Sprite

    private var player : Player
    private var video : Video

    private var statusbar : PlayerStatusbar

    private var _dimensions : Dimensions = Dimensions.ZERO

    public function PlayerView
      (player : Player, video : Video)
    {
      this.player = player
      this.video = video

      statusbar = new PlayerStatusbar(player)

      videoContainer.addChild(screenshot)
      videoContainer.addChild(video)
      videoContainer.addChild(statusbar)

      addChild(videoContainer)

      mouseEnabled = false
      mouseChildren = false

      loadScreenshot()

      timer.addEventListener(TimerEvent.TIMER, handleTimerEvent)
      timer.start()

      update()
    }

    private function loadScreenshot() : void
    {
      screenshot.load(new URLRequest(player.movie.imageURL.toString()))
      screenshot.contentLoaderInfo.addEventListener(Event.COMPLETE,
        function (event : Event) : void
        { Bitmap(screenshot.content).smoothing = true })
    }

    private function handleTimerEvent(event : TimerEvent) : void
    { update() }

    public function set dimensions(value : Dimensions) : void
    { _dimensions = value }

    public function update() : void
    {
      videoContainer.x = videoPosition.x
      videoContainer.y = videoPosition.y

      video.width = videoDimensions.width
      video.height = videoDimensions.height

      screenshot.width = videoDimensions.width
      screenshot.height = videoDimensions.height

      video.visible = videoVisible
      video.smoothing = true

      statusbar.update()

      statusbar.x = video.x + video.width - statusbar.width
      statusbar.y = video.y + video.height - statusbar.height

      if (stage)
        stage.fullScreenSourceRect = fullScreenSourceRect
    }

    private function get videoPosition() : Position
    { return _dimensions.minus(videoDimensions).halved.asPosition }

    private function get videoDimensions() : Dimensions
    { return _dimensions.getInnerDimensions(player.aspectRatio) }

    private function get videoVisible() : Boolean
    { return player.playheadPosition.seconds > 0.1 }

    private function get fullScreenSourceRect() : Rectangle
    {
      const localPoint : Point = new Point(video.x, video.y)
      const globalPoint : Point = localToGlobal(localPoint)

      return new Rectangle
        (globalPoint.x, globalPoint.y, video.width, video.height)
    }
  }
}
