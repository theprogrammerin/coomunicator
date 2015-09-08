class RestCoordinator

  def initialize(request)
    @params = request[:params] || {}
    @headers = request[:headers] || {}
    @path = request[:path] || {}
    @service = request[:service] || {}
    @method = request[:method] || :get
  end

  def fetch(include_headers=false)
    resp = RestClient::Request.execute({
      method: @method,
      url: request_uri,
      headers: {
        params: @params
      }
      })
    JSON.parse(resp)
  end

  private

  def request_uri
    "#{service_base_path}/#{@path}"
  end

  def service_base_path
    if @service == "user-service"
      "#{default_protocol}localhost:4000/user-service"
    elsif @service == "iam-service"
      "#{default_protocol}localhost:4000/iam-service"
    end
  end

  def default_protocol
    "http://"
  end

end
