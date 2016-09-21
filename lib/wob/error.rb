# Monadic Error
class Error

  # Implement wrapM function
  def self.wrapM(x)
    Succeed.new(x)
  end
        
  include Wob::JoinM

  # Additionnal function:

  # raise an error
  def self.raise(x)
    Failure.new(x)
  end

  
end

# Success case
class Succeed < Error
  
  def initialize(value)
    @value = value
  end

  # Bind Implementation
  def bindM(&block)
    block.call(@value)
  end

    # try with
  def try_with(&block)
    @value
  end
  
end

# Failure case
class Failure < Error
  
  def initialize(exception)
    @value = exception
  end

  # Bind implementation
  def bindM(&block)
    @value
  end

    # try with
  def try_with(&block)
    block.call(@value)
  end
  
end



