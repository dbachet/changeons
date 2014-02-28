#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require_self

#= require ./ember/store
#= require_tree ./ember/models
#= require_tree ./ember/controllers
#= require_tree ./ember/views
#= require_tree ./ember/helpers
#= require_tree ./ember/components
#= require_tree ./ember/templates
#= require_tree ./ember/routes
#= require ./ember/router
#= require_self

window.Ch = Ember.Application.create()
