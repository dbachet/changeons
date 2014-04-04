Ch.LinksCategoryView = Ember.View.extend

  tagName: 'li'

  color: ''

  categoryStyle: (->
    "background-color: #{@get('color')}"
  ).property('color')
