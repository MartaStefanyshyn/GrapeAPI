class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  format :json
  mount Employee::Data
  mount API::V1::Graduates
  mount API::V1::Authors
  mount API::V1::Posts
end
