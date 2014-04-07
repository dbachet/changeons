Ch.Link = DS.Model.extend
  name: DS.attr('string')
  url: DS.attr('string')

  category: DS.belongsTo('category'), async: true
  user: DS.belongsTo('user')