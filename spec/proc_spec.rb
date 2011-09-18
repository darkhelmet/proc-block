describe 'Proc' do
  it 'should return from the method' do
    def foo
      f = Proc.new { return :proc }
      f.call
      :method
    end

    foo.should eq(:proc)
  end

  it 'should ignore extra arguments' do
    f = Proc.new { |x| x }
    lambda { f.call(1, 2, 3).should eq(1) }.should_not raise_error(ArgumentError)
  end

  it 'should not care if not enough parameters are passed' do
    f = Proc.new { |x, y, z| [x, y, z] }
    lambda { f.call(1) }.should_not raise_error(ArgumentError)
  end

  it 'should set unpassed parameters to `nil`' do
    f = Proc.new { |x, y, z| [x, y, z] }
    f.call(1).should eq([1, nil, nil])
  end

  it 'should accept *args' do
    f = Proc.new { |*args| args }
    f.call(1, 2, 3).should eq([1, 2, 3])
  end

  it 'should not be a lambda' do
    f = Proc.new { |x| x }
    f.lambda?.should be_false
  end
end