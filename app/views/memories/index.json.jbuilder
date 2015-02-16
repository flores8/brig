json.array!(@memories) do |memory|
  json.extract! memory, :id, :post, :name
  json.url memory_url(memory, format: :json)
end
