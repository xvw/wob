# General namespace
module Wob

  # This module provide a shortcut to
  # self.class.wrap
  module Return

    # A shortcut to wrap a value
    def wrapM(value)
      self.class.wrapM(value)
    end

    # Chain bindM
    #
    # Example :
    #    elt.do [procA, procB, procC]
    #    = elt.bindM(&procA).bindM(&procB).bindM(&procC)
    #
    def do(list)
      list.reduce(self) do |acc, fun|
        acc.bindM(&fun)
      end
    end
    
  end

  # This module implements bindM using
  # liftM and joinM
  module BindM

    include Return

    # Takes the content of a monad and passes it
    # to a function which returns a monad
    def bindM(&block)
      liftM(&block).joinM
    end

  end

  # This module implements liftM and joinM
  # using bindM
  module JoinM

    include Return

    # joinM removes one layer of nesting of a monadic value:
    # x.joinM where x is a monad of a monad of x changes m (m x) to m x
    def joinM
      bindM(&:itself)
    end

    
    # lets a non-monadic function f operate on the contents of monad m
    def liftM(&block)
      bindM do | elt |
        wrapM block.call(elt)
      end
    end
    
  end

  # This module implement filterM
  module FilterM

    # A shortcut for neutralM
    def neutralM
      self.class.neutralM
    end

    # Returns a bindable function for filtering
    # the receiver must implemented a neutralM and wrapM
    def filterM(&block)
      bindM do | elt |
        if block.call(elt)
        then wrapM(elt)
        else neutralM
        end
      end
    end
    
  end

end


