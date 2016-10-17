console.log "Homepage Activated!"

# Height of container
if $(window).width() > 480
  $('.section').css({'height':($(window).height())+'px'})

# Setup Bootstrap Scrollspy.js
$('body').scrollspy({ target: '.nav-container', offset: 70})

# Some smooth scrolling
$('a[href*=#]:not([href=#])').click ->
  if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
    target = $(@hash)
    target = (if target.length then target else $('[name=' + @hash.slice(1) + ']'))
    if target.length
      $('html, body').animate
        scrollTop: target.offset().top
      , 1000
      false

# Load svgs to the DOM
url = window.location.href
$('.happy-cartoon').load(url + '/media/happy-cartoon.svg')
$('.concerned-cartoon').load(url + '/media/concerned-cartoon.svg')

# Find out the pixels scrolled. This is for development only
$(document).scroll ->
  console.log $(document).scrollTop()
  if $(this).scrollTop() >= $('#portfolio').position().top
    $('.happy-cartoon').removeClass 'visible'
    $('.concerned-cartoon').addClass 'visible'
  else
    $('.happy-cartoon').addClass 'visible'
    $('.concerned-cartoon').removeClass 'visible'
  if $(this).scrollTop() >= $('#updates').position().top
    $('.cartoon').addClass 'hide'
  else
    $('.cartoon').removeClass 'hide'
  return
