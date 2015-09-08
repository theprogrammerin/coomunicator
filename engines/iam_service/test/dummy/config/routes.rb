Rails.application.routes.draw do

  mount IamService::Engine => "/iam_service"
end
