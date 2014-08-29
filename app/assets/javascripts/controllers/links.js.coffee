Ch.LinksController = Ember.ArrayController.extend
  # queryParams: ['category']
  # category: null
  needs: ['categories']

  # filteredLinks: (->
  #   category = @get('category')
  #   links = @get('model')

  #   if Ember.isEmpty('category')
  #     console.log('A')
  #     console.log(category)
  #     # links
  #   else
  #     console.log('B')
  #     console.log(category)
  #     # links.filteredBy('category', category)
  # ).property('category', 'model')