require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items"
      added_item = req.params["items"]
      binding.pry
        if @@item.include?(added_item)
            resp.write "#{item.price}"
        else
            resp.write "Item not found"
            resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
