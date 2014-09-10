Ch.ColoredLabelComponent = Ember.Component.extend

  attributeBindings: ['style']

  tagName: 'span'

  classNames: ['label']

  style: (->
    "background-color: #{@get('model.color')}"
  ).property('model.color')