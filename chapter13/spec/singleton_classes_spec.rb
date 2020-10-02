RSpec.describe 'singleton classes' do
  it 'syntax' do
    obj = Object.new

    class << obj
      def shout_out
        "Hello world!"
      end
    end

    expect(obj.shout_out).to eq("Hello world!")
  end

  it 'used for class methods' do
    # Class methods are defined on the class object's singleton class.
    class Person
      class << self
        def possible_names
          ['Schmidt', 'Jones', 'Li']
        end
      end
    end

    expect(Person.possible_names[0]).to eq('Schmidt')
  end

  it 'ancestor exercise p. 424' do
    module P
    end

    class Object
      prepend P
    end

    module M
    end

    class C
    end

    obj = C.new

    class << obj
      prepend P
      include M
    end

    actual = obj.singleton_class.ancestors
    expected = [P, obj.singleton_class, M, C, P, Object, Kernel, BasicObject]
    expect(actual).to eq(expected)
  end

  it 'singleton_class method' do
    obj = Object.new

    expect(obj.singleton_class.class.name).to eq('Class')
  end
end
