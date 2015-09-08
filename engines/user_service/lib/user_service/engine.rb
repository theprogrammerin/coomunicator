module UserService
  class Engine < ::Rails::Engine
    isolate_namespace UserService
  end
end
