RSpec.describe 'self' do
  it 'for default object' do
    def get_self
      self
    end

    expect(get_self.object_id).to eq(self.object_id)
    expect(self.class.name).to eq("RSpec::ExampleGroups::Self")
  end

  it 'for objects' do
    obj = Object.new

    def obj.get_self
      self
    end

    expect(obj.get_self.object_id).to eq(obj.object_id)
  end

  it 'for class instances' do
    class Book
      def get_self
        self
      end
    end

    ruby = Book.new

    expect(ruby.get_self.object_id).to eq(ruby.object_id)
  end
end
