uri =  
 if ENV['REDISTOGO_URL'].nil?
   "redis://127.0.0.1:6379"
 else
   URI.parse(ENV['REDISTOGO_URL'])
 end
$redis = Redis.new(url: uri)
$redis.flushall