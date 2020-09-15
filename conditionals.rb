RSpec.describe 'conditionals' do
  it 'e.g. case statements' do
    a = "yes"
    case a
    when 'y' + 'e' + 's'
      b = 1
    when "no"
      b = 2
    else
      b = 3
    end

    expect(b).to eq(1)
  end
end
