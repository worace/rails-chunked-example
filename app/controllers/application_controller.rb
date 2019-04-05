class ApplicationController < ActionController::Base
  def index
    # Uncomment this line to break things:
    # response.set_header("Transfer-Encoding", "chunked")
    response.set_header("X-Accel-Buffering", "no")
    response.set_header("Cache-Control", "no-cache")
    response.set_header("Last-Modified", Time.zone.now.ctime.to_s)
    response.delete_header("Content-Length")

    self.response_body = Enumerator.new do |y|
      100.times do |i|
        y << i.to_s + "\n"
        sleep(0.01)
      end
    end

    response.status = 200
  end
end
