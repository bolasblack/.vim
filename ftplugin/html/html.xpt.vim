XPTemplate priority=lang

XPT html5
<!DOCTYPE html>
<html>
  <head>
    `:charset:^
    `:title:^
  </head>
  `:body:^
</html>

XPT charset "<meta charset=...
<meta charset="`encoding^html_enc()^" />

XPT 0table "<table border=...
<table border="0" cellpadding="0" cellspacing="0" width="`100%^">
  `:extr:^
</table>

XPT extr
<tr>
  <td>`cursor^</td>
</tr>

" html 5
" http://dev.w3.org/html5/html4-differences/Overview.html#character-encoding

XPT section alias=_tag
XPT article alias=_tag
XPT aside alias=_tag
XPT hgroup alias=_tag
XPT header alias=_tag
XPT footer alias=_tag
XPT nav alias=_tag

XPT figure alias=_tag
XPT figcaption alias=_tag

XPT video alias=_tag
XPT audio alias=_tag
XPT source alias=_tag

XPT embed alias=_tag

XPT mark alias=_tag
XPT progress alias=_tag
XPT meter alias=_tag
XPT time alias=_tag


XPT canvas alias=_tag
XPT comand alias=_tag
XPT details alias=_tag
XPT datalist alias=_tag

XPT keygen alias=_tag
XPT output alias=_tag

