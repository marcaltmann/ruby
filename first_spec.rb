RSpec.describe 'types' do
  it 'e.g. numbers' do
    expect(5).to eq(5);
    expect(5.class.name).to eq('Integer');
    expect(5.is_a?(Numeric)).to be_truthy;
    expect(5.is_a?(Integer)).to be_truthy;

    expect((5.5).is_a?(Float)).to(be_truthy);

    p(be_truthy.class.name)
  end

  it 'e.g. other' do
    expect('hallo'.is_a?(String)).to be_truthy;
    expect(true.is_a?(TrueClass)).to be_truthy;  
  end
end
