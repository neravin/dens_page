json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :image_url, :site
  json.url project_url(project, format: :json)
end
