$w = $(window)

visible = ($el) ->
  viewTop = $w.scrollTop()
  viewBottom = viewTop + $w.height()
  height = $el.height()
  top = $el.offset().top
  bottom = top + height

  (viewTop <= top + height / 2) and (viewBottom >= bottom)

`export default visible`