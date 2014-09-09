Ch.Link = DS.Model.extend
  name: DS.attr('string')
  url: DS.attr('string')

  category: DS.belongsTo('category')
  user: DS.belongsTo('user')