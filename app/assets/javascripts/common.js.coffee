$(window).scroll ->
  currentHeight = $('.arguments').height()
  maxHeight = 100
  scrollHeight = $(window).scrollTop()

  if currentHeight < maxHeight
    if scrollHeight >= maxHeight
      $('.arguments').height("#{maxHeight}px")
    else
      $('.arguments').height("#{scrollHeight}px")