class ApplicationController < ActionController::Base
  def index
    response.set_header("Transfer-Encoding", "chunked")
    response.set_header("X-Accel-Buffering", "no")
    response.set_header("Cache-Control", "no-cache")
    response.set_header("Last-Modified", Time.zone.now.ctime.to_s)
    response.delete_header("Content-Length")

    puts "before"
    self.response_body = Enumerator.new do |y|
      5.times do |i|
        puts "yield row #{i}"
        y << i.to_s
      end
    end
    puts "after"

    response.status = 200
  end
end
