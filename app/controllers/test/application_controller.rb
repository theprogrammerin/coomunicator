module Test
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

    def create
      render json: {
        status: true
      }
    end

    def test
       local = LocalCoordinator.new({ method: :get, path: "/iam-service/users/1" })
       body, headers = local.fetch(true)
       render json: {
          body: body,
          headers: headers
       }
    end
  end
end
