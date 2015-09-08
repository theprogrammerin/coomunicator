class SuperCoordinator

  def initialize

  end

  def execute(request)

  end

  private 

  def process_local(request)
    LocalCoordinator.new(request).fetch
  end

  def process_rest(request)
    RestCoordinator.new(request).fetch
  end

  def is_local?
  end

  def is_rest?
  end


end