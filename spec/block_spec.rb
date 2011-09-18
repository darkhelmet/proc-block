describe 'Block' do
  it 'should return from the closure' do
    def foo
      yield
      :method
    end

    def bar
      foo do
        return :block
      end
    end

    bar.should eq(:block)
  end

  it 'should ignore extra arguments' do
    def foo
      yield(1, 2, 3)
    end

    lambda do
      foo { |x| x }.should eq(1)
    end.should_not raise_error(ArgumentError)
  end

  it 'should not care if not enough parameters are passed' do
    def foo
      yield(1)
    end

    lambda do
      foo { |x, y, z| [x, y, z] }
    end.should_not raise_error(ArgumentError)
  end

  it 'should set unpassed parameters to `nil`' do
    def foo
      yield(1)
    end

    foo { |x, y, z| [x, y, z] }.should eq([1, nil, nil])
  end

  it 'should accept *args' do
    def foo
      yield(1, 2, 3)
    end

    foo { |*args| args }.should eq([1, 2, 3])
  end
end
