RSpec.describe 'eval' do
  it 'evaluates code' do
    result = eval("4 + 4")

    expect(result).to eq(8)
  end

  it 'does know local vars' do
    # At this point, binding is not needed yet. See page 462.
    x = 1
    result = eval("x + 3")

    expect(result).to eq(4)
  end

  it 'tainted method' do
    # e.g. user input gets marked as tainted.
    str = "hello"

    expect(str.tainted?).to be_falsy
  end

  it 'instance_eval' do
    class Person
      def initialize(name)
        @name = name
      end
    end
    p = Person.new("Gandhi")

    result = p.instance_eval { @name }

    expect(result).to eq("Gandhi")
  end

  it 'creating a dsl with instance_eval' do
    class Person
      def initialize(&block)
        instance_eval(&block)
      end

      def forename(forename = nil)
        @forename ||= forename
      end

      def surname(surname = nil)
        @surname ||= surname
      end
    end

    p = Person.new do
      forename "Marc"
      surname "Altmann"
    end

    expect(p.forename).to eq("Marc")
    expect(p.surname).to eq("Altmann")
  end

  it 'class_eval' do
    class Person
      def initialize(name)
        @name = name
      end
    end

    Person.class_eval { def name; @name; end  }

    p = Person.new("Marc")

    expect(p.name).to eq("Marc")
  end
end
