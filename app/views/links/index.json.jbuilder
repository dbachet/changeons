json.array!(@links) do |link|
  json.extract! link, :name, :url
  json.url link_url(link, format: :json)
end