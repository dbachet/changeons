Ch.CategoryLabelView = Ember.View.extend

  tagName: 'span'

  color: ''

  categoryStyle: (->
    "background-color: #{@get('color')}"
  ).property('color')
