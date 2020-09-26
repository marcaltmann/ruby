require_relative '../rainbow'

RSpec.describe 'Rainbow' do
  let(:rainbow) { Rainbow.new }

  it 'has each method' do
    result = []
    rainbow.each { |color| result << color }
    expect(result).to eq(['red', 'blue', 'yellow'])
  end

  it 'is mappable' do
    result = rainbow.map { |color| color }
    expect(result).to eq(['red', 'blue', 'yellow'])
  end
end
