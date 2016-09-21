require 'rspec'
require 'wob'

describe Wob do
  
  it "test simple case" do
    
    failable = lambda do |x, y|
      if y == 0 then Wob::Failure.new(RuntimeError.new)
      else Wob::Succeed.new(x / y)
      end
    end

    x = failable.call(10, 0).
          try_with{|e| Wob::Succeed.wrapM(8)}.
          bindM {|e| Wob::Succeed.wrapM(e+1)}
    
    y = failable.call(10, 2).
          try_with{|e| Wob::Succeed.wrapM(8)}. ## avoided case
          bindM {|e| Wob::Succeed.wrapM(e+4)}

    expect(x.value).to eql(y.value)
 
  end

  
end
