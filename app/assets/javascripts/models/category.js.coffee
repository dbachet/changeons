Ch.Category = DS.Model.extend
  name: DS.attr('string')
  color: DS.attr('string')

  links: DS.hasMany('link', async: true)