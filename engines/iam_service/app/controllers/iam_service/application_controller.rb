module IamService
  class ApplicationController < ActionController::Base

    def status
      render json: {
        status: :ok,
        params: params,
        service: "iam-service"
      }
    end

  end
end
