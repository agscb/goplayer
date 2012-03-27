package goplayer
{
  public interface ISkinBackend
  {
    function get skinWidth() : Number
    function get skinHeight() : Number
    function get skinScale() : Number

    function get enableChrome() : Boolean

    function get showChrome() : Boolean
    function get showTitle() : Boolean
    function get showLargePlayButton() : Boolean
    function get showShareButton() : Boolean
    function get showEmbedButton() : Boolean
    function get showPlayPauseButton() : Boolean
    function get showElapsedTime() : Boolean
    function get showSeekBar() : Boolean
    function get showTotalTime() : Boolean
    function get showVolumeControl() : Boolean
    function get showFullscreenButton() : Boolean

    function get movie() : Object
    function get title() : String
    function get shareURL() : String
    function get embedCode() : String

    function get volume() : Number

    function get running() : Boolean
    function get playing() : Boolean

    function get duration() : Number
    function get playheadRatio() : Number

    function get bufferRatio() : Number
    function get bufferFillRatio() : Number
    function get bufferingUnexpectedly() : Boolean

    function handleSkinPartMissing(name : String) : void

    function handleUserSeek(ratio : Number) : void
    function handleUserPlay() : void
    function handleUserPause() : void
    function handleUserMute() : void
    function handleUserUnmute() : void
    function handleUserSetVolume(volume : Number) : void
    function handleUserToggleFullscreen() : void

    function handleUserCopyShareURL() : void
    function handleUserShareViaTwitter() : void
    function handleUserShareViaFacebook() : void
    function handleUserCopyEmbedCode() : void
  }
}
