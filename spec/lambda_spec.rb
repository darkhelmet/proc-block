describe 'Lambda' do
  it 'should return from the lambda' do
    def foo
      f = lambda { return :lambda }
      f.call
      :method
    end

    foo.should eq(:method)
  end

  it 'should whine about too many arguments' do
    f = lambda { |x| x }
    lambda { f.call(1, 2) }.should raise_error(ArgumentError)
  end

  it 'should whine about too few arguments' do
    f = lambda { |x, y| [x, y] }
    lambda { f.call(1) }.should raise_error(ArgumentError)
  end

  it 'should accept *args' do
    f = lambda { |*args| args }
    f.call(1, 2, 3).should eq([1, 2, 3])
  end

  it 'should be a lambda' do
    f = lambda { |x| x }
    f.lambda?.should be_true
  end
end
