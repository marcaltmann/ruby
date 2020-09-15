require 'date'
require 'time'

RSpec.describe 'dates' do
  it 'date' do
    date_str = Date.parse("April 24 1705").england.strftime("%B %d %Y")

    expect(date_str).to eq("April 13 1705")
  end
end
