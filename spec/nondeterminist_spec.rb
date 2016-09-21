require 'rspec'
require 'wob'

describe Wob do
  
  it "test the Wrapper" do
    expect(Array.wrapM 10).to eql([10])
    expect(Array.wrapM [10]).to eql([[10]])
  end

  it "test identity" do
    x = [:a, :b, :c]
    expect(x.bindM(&:itself)).to eql(x)
  end

  it "test succ method" do
    x = [1, 2, 3]
    y = [2, 3, 4]
    r = x.bindM {|e| [1+e]}
    expect(r).to eql(y)
  end

  it "test chain" do
    x = [1, 2, 3]
    y = x.
          bindM { |elt| [elt+1] }.
          bindM { |elt| [elt-1] }
    
    expect(x).to eql(y)
  end

  it "test filterM" do
    x = [1,2,3,4]
    r = x.filterM{|e| e%2 == 0}
    expect(r).to eql([2, 4])
  end

  it "test do notation" do
    a = lambda {|x| x + 1}
    b = lambda {|x| x + 2}
    c = lambda {|x| x + 3}
    s = [1,2,3]
    x = s.do [a, b, c]
    y = s.bindM(&a).bindM(&b).bindM(&c)
    expect(x).to eql(y)
  end

  
end
