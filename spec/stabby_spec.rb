describe 'Stabby' do
  it 'should return from the stabby' do
    def foo
      f = -> { return :lambda }
      f.call
      :method
    end

    foo.should eq(:method)
  end

  it 'should whine about too many arguments' do
    f = ->(x) { x }
    lambda { f.call(1, 2) }.should raise_error(ArgumentError)
  end

  it 'should whine about too few arguments' do
    f = ->(x, y) { [x, y] }
    lambda { f.call(1) }.should raise_error(ArgumentError)
  end

  it 'should accept *args' do
    f = ->(*args) { args }
    f.call(1, 2, 3).should eq([1, 2, 3])
  end

  it 'should be a lambda' do
    f = ->(x) { x }
    f.lambda?.should be_true
  end

  it 'should accept default args' do
    f = ->(x = 1) { x }
    f.call.should eq(1)
    f.call(2).should eq(2)
  end
end
