json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :keyword, :list_name
  json.url keyword_url(keyword, format: :json)
end
