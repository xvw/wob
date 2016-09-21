require 'rspec'
require 'wob'

describe Wob do
  
  it "Nondeterminist: test the Wrapper" do
    expect(Array.wrapM 10).to eql([10])
    expect(Array.wrapM [10]).to eql([[10]])
  end

  it "Nondeterminist: test identity" do
    x = [:a, :b, :c]
    expect(x.bindM(&:itself)).to eql(x)
  end

  it "Nondeterminist: test succ method" do
    x = [1, 2, 3]
    y = [2, 3, 4]
    r = x.bindM {|e| [1+e]}
    expect(r).to eql(y)
  end

  it "Nondeterminist: test chain" do
    x = [1, 2, 3]
    y = x.
          bindM { |elt| [elt+1] }.
          bindM { |elt| [elt-1] }
    
    expect(x).to eql(y)
  end

  it "Nondeterminist: test filterM" do
    x = [1,2,3,4]
    r = x.filterM{|e| e%2 == 0}
    expect(r).to eql([2, 4])
  end

  
end
