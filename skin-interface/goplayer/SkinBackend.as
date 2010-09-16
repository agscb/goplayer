package goplayer
{
  public interface SkinBackend
  {
    function get skinWidth() : Number
    function get skinHeight() : Number
    function get skinScale() : Number

    function get title() : String
    function get running() : Boolean
    function get showChrome() : Boolean
    function get showTitleBar() : Boolean
    function get streamLengthSeconds() : Number
    function get playheadRatio() : Number
    function get bufferRatio() : Number
    function get bufferFillRatio() : Number
    function get playing() : Boolean
    function get buffering() : Boolean
    function get bufferingUnexpectedly() : Boolean
    function get volume() : Number

    function handleSkinPartMissing(name : String) : void

    function handleUserSeek(ratio : Number) : void
    function handleUserPlay() : void
    function handleUserPause() : void
    function handleUserMute() : void
    function handleUserUnmute() : void
    function handleUserSetVolume(volume : Number) : void
    function handleUserToggleFullscreen() : void
  }
}
