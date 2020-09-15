RSpec.describe 'classes' do
  it 'have a class' do
    class Person
    end

    expect(Person.class).to eq(Class)
  end

  it 'can have singleton methods' do
    class Story
      attr_accessor :length
    end

    def Story.compare(story1, story2)
      story1.length == story2.length
    end

    s1 = Story.new
    s1.length = 50

    s2 = Story.new
    s2.length = 50

    expect(Story.compare(s1, s2)).to be_truthy
  end

  it 'evaluate code' do
    $class_count = 0

    class Book
      $class_count += 1
    end

    expect($class_count).to eq(1)
  end
end
