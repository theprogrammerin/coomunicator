class LocalCoordinator

  def initialize(request)
    @params = request[:params] || {}
    @headers = request[:headers] || {}
    @path = request[:path] || {}
    @service = request[:service] || {}
    @method = request[:method] || :get
  end

  def fetch(include_headers=false)
    request_env
  rescue JSON::ParserError
    nil
  end

  #private

  def application_engine
    if @service.present?
      return "#{@service.gsub("-","_").classify}::Engine".constantize
    end
    Rails.application
  end

  def controller_class
    resolved_route = application_engine.routes.recognize_path(request_uri, method: @method)
    "#{resolved_route[:controller].classify}Controller".constantize
  rescue ActionController::RoutingError
  end

  def controller_action
    resolved_route = application_engine.routes.recognize_path(request_uri, method: @method)
    resolved_route[:action]
  end

  def request_env
    env = {
      "REQUEST_METHOD" => "GET",
      "SERVER_NAME"     => "localhost",
      "SERVER_PORT"     => "80",
      "HTTPS"           => "off",
      "rack.url_scheme" => "http",
      "rack.input"      => StringIO.new( @params.to_json ).read,
      "action_dispatch.request.parameters"      => @params,

      "REQUEST_URI"    => @path,
      "HTTP_HOST"      => "localhost",
      "REMOTE_ADDR"    => "127.0.0.1",
      "CONTENT_TYPE"   => "application/json",
      "HTTP_ACCEPT"    => "application/json"
    }
    status, header, resp = controller_class.action(controller_action).call(env)
    JSON.parse resp.body

  end

  def request_uri
    "/#{@path}"
  end

  def service_base_path
    if @service == "iam-service"
      "/iam-service"
    elsif @service == "user-service"
      "/user-service"
    end
  end

  def default_protocol
    "http://"
  end

  def headers
    default_headers = {
      format: "json"
    }
    default_headers.merge(@headers)
  end

end
