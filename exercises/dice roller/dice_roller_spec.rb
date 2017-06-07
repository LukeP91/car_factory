require_relative 'dice_roller'

describe 'select_results' do
  it 'should drop lowest and highest of results and not change order' do
    expect(select_results([5,1,13,6,8,1,10])).to eq [5,6,8,1,10]
  end
end
