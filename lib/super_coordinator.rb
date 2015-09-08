class SuperCoordinator

  def initialize(request)
    @service = request[:service]
    if is_local?
      @coordinator = LocalCoordinator.new(request)
    else
      @coordinator = RestCoordinator.new(request)
    end
    self
  end

  def execute()
    @coordinator.fetch()
  end

  private

  def is_local?
    Rails.application.config.local_services.include? @service
  end

  def is_rest?
    !Rails.application.config.local_services.include?(@service)
  end


end
