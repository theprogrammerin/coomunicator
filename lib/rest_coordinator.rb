class RestCoordinator

  def initialize(request)
    @params = request[:params] || {}
    @headers = request[:headers] || {}
    @path = request[:path] || {}
    @service = request[:service] || {}
  end

  def fetch 
  end

  private

  def request_uri 
    "#{service_base_path}/#{path}"
  end

  def service_base_path
    if @service == "iam-service"
      "#{default_protocol}localhost:3000/iam-service"
    end
  end

  def default_protocol 
    "http://"
  end

end