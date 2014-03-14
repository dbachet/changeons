# http://emberjs.com/guides/models/using-the-store/

Ch.ApplicationAdapter = DS.ActiveModelAdapter.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  # adapter: '_ams'
  namespace: 'web_api'

# Ch.ApplicationSerializer = DS.ActiveModelSerializer.extend

#   serializeHasMany: (record, json, relationship) ->
#     key = relationship.key
#     jsonKey = Ember.String.singularize(key) + '_ids'
#     json[jsonKey] = []
#     record.get(key).forEach (item) ->
#       json[jsonKey].push(item.get('id'))
#     json

# Ch.ObjectTransform = DS.Transform.extend

#   deserialize: (serialized) ->
#     if Em.isNone(serialized)
#       {}
#     else if (typeof serialized) == 'string'
#       jQuery.parseJSON(serialized)
#     else
#       serialized

#   serialize: (deserialized) ->
#     if Em.isNone(deserialized)
#       {}
#     else
#       deserialized
