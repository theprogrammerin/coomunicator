module UserService
  class ApplicationController < ActionController::Base

    def status
      render json: {
        status: :ok,
        params: params,
        service: "user-service"
      }
    end

  end
end
