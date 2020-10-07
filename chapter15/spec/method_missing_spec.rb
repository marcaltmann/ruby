RSpec.describe 'method_missing and company' do
  it 'method_missing' do
    class Register
      def method_missing(method, *args)
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
end
