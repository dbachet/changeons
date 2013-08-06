<% if @link.errors.any? %>
  $('.fancybox-content .container').html("<%= escape_javascript(render partial: 'links/form', locals: { link: @link }) %>")
  parent.$.fancybox.update()
  initCloseFancybox()
<% else %>
  list = parent.$('section#links').find('ul')
  list.prepend("<li><%= escape_javascript(render partial: 'links/link', locals: { link: @link }) %></li>")
  parent.$('body').find('#content').append("<%= escape_javascript(render partial: 'shared/comment_count') %>")
  list.find('li:first-child').hide()
  list.find('li:first-child').delay(800).fadeIn( 400)
  closeFancybox()
<% end %>