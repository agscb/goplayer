package goplayer
{
  import flash.display.DisplayObject
  import flash.events.MouseEvent

  public function onclick
    (object : DisplayObject, callback : Function) : void
  { addNullaryEventListener(object, MouseEvent.CLICK, callback) }
}
