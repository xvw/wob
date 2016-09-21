# General namespace
module Wob

  # This module provide a shortcut to
  # self.class.wrap
  module Return

    # A shortcut to wrap a value
    def wrap(value)
      self.class.wrap(value)
    end
    
  end

  # This module implements bindM using
  # liftM and joinM
  module Bind

    include Return

    # Takes the content of a monad and passes it
    # to a function which returns a monad
    def bindM(&block)
      liftM(&block).joinM
    end

  end

  # This module implements liftM and joinM
  # using bindM
  module Join

    include Return

    # joinM removes one layer of nesting of a monadic value:
    # x.joinM where x is a monad of a monad of x changes m (m x) to m x
    def joinM
      bind(&:itself)
    end

    
    # lets a non-monadic function f operate on the contents of monad m
    def liftM(&block)
      bind do | elt |
        wrap block.call(elt)
      end
    end
    
  end
  
  

end
