$ ->
  showArguments()

showArguments = ->
  $(window).scroll ->
    currentArgumentsHeight = $('.arguments').height()
    maxHeight = 100
    scrollHeight = $(window).scrollTop()

    if currentArgumentsHeight? and currentArgumentsHeight < maxHeight
      if scrollHeight >= maxHeight
        extendBody(maxHeight)
        $('.arguments').height("#{maxHeight}px")
      else
        extendBody(maxHeight)
        $('.arguments').height("#{scrollHeight}px")

extendBody = (maxHeight)->
  $('body').height($(window).height()+maxHeight) unless $('body').attr('data-extended-height') == 'true'
  $('body').attr('data-extended-height', 'true')