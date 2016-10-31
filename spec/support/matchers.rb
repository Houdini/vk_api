RSpec::Matchers.define :an_api_request do |method, path, options|
  match do |model|
    h_with = {}
    key = method.to_sym == :post || method.to_sym == :put ? :body : :query
    h_with[key] = options
    a_request(method, "https://api.vk.com/method/#{path}").with(h_with)
  end
end
