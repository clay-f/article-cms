module ArticlesHelper
  def self.define_require_data_component(name, *rest)
    define_method("fetch_" + name) do |*rest|
      name = $redis.get("#{name}")
      if name.nil?
        tmp_name = rest
        $redis.set("#{name}", tmp_name)
        $redis.set("#{name}", 3.hour.to_i)
      end
      JSON.load name
    end
  end

  define_require_data_component("categories", Catalog.all.order(:created_at))
  define_require_data_component("article")
end
