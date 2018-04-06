module ArticlesHelper
  def self.define_require_data_component(name, *args)
    define_method("fetch_" + name) do
      name = $redis.get("#{name}")
      if name.nil?
        $redis.set("#{name}", args[0])
        $redis.set("#{name}", 3.hour.to_i)
        name = args[0]
      end
      JSON.load name
    end
  end

  define_require_data_component("categories", Catalog.all.order(:created_at).to_json)
  define_require_data_component("article")
end
