<% if @link.errors.any? %>
  $('.fancybox-content .container').html("<%= escape_javascript(render partial: 'links/form', locals: { link: @link }) %>")
  parent.$.fancybox.update()
  initCloseFancybox()
<% else %>
  link = parent.$('section#links').find('ul').find('li#link-<%= @link.id %>')
  link.html("<%= escape_javascript(render partial: 'links/link', locals: { link: @link }) %>").slideUp()
  parent.$('body').find('#content').append("<%= escape_javascript(render partial: 'shared/comment_count') %>")
  link.delay(800).slideDown(400)
  closeFancybox()
<% end %>