<% if @link.errors.any? %>
  $('.fancybox-content .container').html("<%= escape_javascript(render partial: 'links/form', locals: { link: @link }) %>")
  parent.$.fancybox.update()
  initCloseFancybox()
<% else %>
  parent.$("#flashes").html("<%= escape_javascript(render partial: 'flash_messages', locals: {flash: flash}) %>")
  list = parent.$('section#links').find('ul')
  list.prepend("<li><%= escape_javascript(render partial: 'links/link', locals: { link: @link }) %></li>")
  parent.$('body').find('#content').append("<%= escape_javascript(render partial: 'shared/comment_count') %>")
  list.find('li:first-child').hide()
  list.find('li:first-child').delay(800).slideDown(400)
  closeFancybox()
<% end %>