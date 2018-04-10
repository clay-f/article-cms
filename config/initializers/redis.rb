uri = URI.parse(ENV["REDISTOGO_URL"]) || 'localhost:6379'
$redis = Redis.new(url: uri)