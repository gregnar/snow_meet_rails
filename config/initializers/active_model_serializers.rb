ActiveModel::Serializer.setup do |config|
  config.default_key_type = :name
  config.embed = :ids
end

ActiveModel::Serializer.root = false
