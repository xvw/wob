# Extension for Array
class Array

  # Implement wrap function
  def self.wrapM(x)
    [x]
  end

  # Implement neutral element
  def self.neutralM
    []
  end

  # Implement liftM
  def liftM(&block)
    map(&block)
  end

  # Implement joinM
  def joinM
    flatten(1)
  end

  # Include bindM and filterM
  include Wob::BindM
  include Wob::FilterM

end
