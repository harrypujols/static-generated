console.log "Hello from the console!"

# Init syntax highlighting
$('pre code').each (i, block) ->
    hljs.highlightBlock block
    return

# Send IE people elsewhere
url = window.location.href
isMSIE = 0
if isMSIE
  window.location.href = url + '/ie'

# YouTube videos resize
videos = $('iframe[src^=\'//www.youtube.com\']')
fluidEl = $('.container')

videos.addClass('youtube');

videos.each ->
  $(this).data('aspectRatio', @height / @width).removeAttr('height').removeAttr 'width'
  return

$(window).resize(->
  newWidth = fluidEl.width()

  videos.each ->
    $el = $(this)
    $el.width(newWidth).height newWidth * $el.data('aspectRatio')
    return

  return
).resize()          
