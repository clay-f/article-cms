uri = URI.parse(ENV["REDIS_PROVIDER"])
$redis = Redis.new(url: uri)