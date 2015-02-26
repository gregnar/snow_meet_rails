ActiveModel::Serializer.setup do |config|
  config.default_key_type = :name
  config.embed = :ids
  # config.embed_in_root = false
end
