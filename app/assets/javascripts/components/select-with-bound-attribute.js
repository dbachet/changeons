Ch.SelectWithBoundAttributeComponent = Ember.Component.extend({
  optionValuePath: 'content.id',
  optionLabelPath: 'content.label',
  content: [],

  defineValue: function() {
    attribute = "model.%@".fmt(this.get('attribute'));
    binding = Ember.Binding.from(attribute).to('value');
    binding.connect(this);
  }.on('init')
});