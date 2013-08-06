# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('a.fancybox').fancybox
    padding: 0,
    closeBtn: false

  initCloseFancybox()

window.initCloseFancybox = initCloseFancybox = ->
  $('.close-fancybox').click (e) ->
    e.preventDefault()
    closeFancybox()

window.closeFancybox = closeFancybox = ->
  parent.$.fancybox.close(true)