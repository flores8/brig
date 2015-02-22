json.array!(@private_memories) do |private_memory|
  json.extract! private_memory, :id, :body, :name
  json.url private_memory_url(private_memory, format: :json)
end
