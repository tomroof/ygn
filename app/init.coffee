require 'scripts/utils'



isMenuOpened = false
isMenuOpening = false
toggleMenu = ->
  if isMenuOpening then return
  isMenuOpening = true
  if isMenuOpened
    $('.toggle_menu').removeClass 'open'
    $('.menu').removeClass 'showed'
    $('body').removeClass 'noscroll'
    runNext 400, =>
      $('.menu').removeClass 'opened'
      isMenuOpening = false
      isMenuOpened = false


  else
    $('.toggle_menu').addClass 'open'
    $('.menu').addClass 'opened'
    $('body').addClass 'noscroll'

    runNext 100, =>
      $('.menu').addClass 'showed'
      isMenuOpening = false
      isMenuOpened = true



ready ->
  $('body').fadeIn('fast')

  $('a').click (event) ->
    if $(this).attr("href") != "#"
      window.goto = $(this).attr("href")

      $('body').fadeOut 'fast', ->
        document.location.href = window.goto

      event.preventDefault()


  if window.location.hostname.indexOf('github') > -1
    $('head').prepend('<base href="http://flywithmemsl.github.io/ygn/" />')

  if window.location.hostname.indexOf('citytocoast') > -1
    $('head').prepend('<base href="http://citytocoast.com/ygn/" />')

  runNext 100, ->
    $('.main_slide .logo, .main_slide .subtitle, .main_slide .brand_video').addClass('appeared')


  $('.toggle_menu').click toggleMenu

  if $('body').hasClass('index')
    window.screens = new (require('scripts/screens'))
    screens.init()

  if $('body').hasClass('supporter')
    window.supporter = new (require('scripts/supporter'))

  if $('body').hasClass('events-modal')
    $('body').addClass('events-modalScroll')
    $('html').addClass('events-modalScroll')
    window.eventsModal = new (require('scripts/eventsModal'))

  if $('body').hasClass('challenge')
    window.challenge = new (require('scripts/challenge'))
    challenge.init()



  if $('body').hasClass('directors')
    window.directors = new (require('scripts/directors'))
    directors.init()



  if $('body').hasClass('transition')

    window.transition = new (require('scripts/transition'))
    transition.init()




  if $('body').hasClass('contact') || $('body').hasClass('directors') || $('body').hasClass('blog') || $('body').hasClass('sponsors') || $('body').hasClass('host')
    $('.donate_link').addClass('reversed')
    $('.toggle_menu').addClass('reversed')


  if $('body').hasClass('press') || $('body').hasClass('blog')
    $('.badge').addClass('reversed')


  if $('body').hasClass('blog')
    $('.button-all').click ->
      $('.navigation-title').toggleClass('navigation-titleActive')
      $('.navigation-list').slideToggle('fast')



  $('.star_events .event').click ->
    if !$(this).hasClass('opened')
      $(this).addClass('opened')
      $(this).find('.toggleIcon').html('-')
      $(this).next().slideDown()
    else
      $(this).removeClass('opened')
      $(this).find('.toggleIcon').html('+')
      $(this).next().slideUp()
