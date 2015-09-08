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
    local = LocalCoordinator.new({ method: :post, path: "/test/application", params: { id: 2, name: "Ashutosh"} })
    body, headers = local.fetch(true)
    render json: {
        body: body,
        headers: headers
    }
  end
end
