json.array!(@links) do |link|
  json.extract! link, :id, :title, :description, :site
  json.url link_url(link, format: :json)
end
