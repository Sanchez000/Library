module CustomErrors

class ArgumentInstanceError < StandardError
  def initialize(msg)
    super("Argument must be instance of #{msg}")
  end
end

end
