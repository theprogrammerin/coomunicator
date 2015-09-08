class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def status
    render json: {
      status: :ok,
      params: params
    }
  end

  def test
    # debugger
    body = SuperCoordinator.new(
      { method: :get,
        path: "/status",
        params: params,
        service: params[:service]
      }).execute
    render json: {
        body: body,
    }
  end
end
