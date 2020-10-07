RSpec.describe 'method_missing and company' do
  it 'method_missing' do
    class Register
      def method_missing(method, *args, &block)
        "#{method} called with #{args.size} arguments."
      end
    end

    reg = Register.new

    expect(reg.forename).to eq("forename called with 0 arguments.")
    expect(reg.middlenames("Theodor", "Alexander")).to eq("middlenames called with 2 arguments.")
  end

  it 'respond_to?' do
    class Person
      attr_accessor :forename, :surname
    end

    p = Person.new

    expect(p.respond_to?(:forename)).to be_truthy
    expect(p.respond_to?(:middlename)).to be_falsy
  end

  it 'simple delegation example' do
    class Person
      def initialize
        @names = []
      end

      def method_missing(method, *args, &block)
        @names.public_send(method, *args, &block)
      end

      def respond_to_missing?(method, include_private = false)
        true
      end

      def names
        @names
      end
    end

    p = Person.new

    p << "Roger"
    p << "O."
    p << "Thornton"

    expect(p.names).to eq(["Roger", "O.", "Thornton"])
    expect(p.respond_to?(:<<)).to be_truthy
  end
end
