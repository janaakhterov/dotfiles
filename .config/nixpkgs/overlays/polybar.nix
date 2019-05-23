self: super:
{ polybar = super.polybar.override { i3Support = true; pulseSupport = true; mpdSupport = true; }; }
