Ch.Category = DS.Model.extend
  name: DS.attr 'string'
  color: DS.attr 'string'

  link: DS.belongsTo 'link'