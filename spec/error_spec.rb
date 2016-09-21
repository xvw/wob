require 'rspec'
require 'wob'

describe Wob do
  
  it "test simple case" do
    
    failable = lambda do |x, y|
      if y == 0 then Failure.new(RuntimeError.new)
      else Succeed.new(x / y)
      end
    end

    x = failable.call(10, 0).
          try_with{|e| Succeed.wrapM(8)}.
          bindM {|e| Succeed.wrapM(e+1)}
    
    y = failable.call(10, 2).
          try_with{|e| Succeed.wrapM(8)}. ## avoided case
          bindM {|e| Succeed.wrapM(e+4)}

    expect(x.value).to eql(y.value)
 
  end

  
end
