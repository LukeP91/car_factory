require_relative 'dice_roller'
require 'pry'
describe '#select_results' do
  it 'should drop lowest and highest of results and not change order' do
    expect(select_results([5,1,13,6,8,1,10])).to eq [5,6,8,1,10]
  end
end

describe '#additional_roll_result' do
  context 'first additional roll is hihger than 7' do
    it 'should return [first_roll, 0]' do
      allow_any_instance_of(Object).to receive(:roll_k).with(30).and_return(8)
      expect(additional_roll_result).to eq({ first_roll: 8, second_roll: 0 })
    end
  end

  context 'first addtional roll is lower or equal 7' do
    it 'should return [first_roll, second_roll]' do
      allow_any_instance_of(Object).
        to receive(:roll_k).
        with(30).
        and_return(7, 1)
      expect(additional_roll_result).to eq({ first_roll: 7, second_roll: 1 })
    end
  end
end

describe '#discard_results' do
  context 'first extra roll is higher than 7' do
    it 'should drop lowest and highest of results and not change order' do
      expect(discard_results([5,1,13,6,8,1,10], first_roll: 8, second_roll: 0))
        .to eq [5,6,8,1,10]
    end
  end

  context 'first extra roll is equal to 7 or belowe is false' do
    context 'second extra roll is equal to 1' do
      it 'should two lowest of results and not change order' do
        expect(discard_results([5,1,13,6,8,1,10], first_roll: 8, second_roll: 1))
          .to eq [5,13,6,8,10]
      end
    end

    context 'second extra roll is higher than 1' do
      it 'should drop lowest and highest of results and not change order' do
        expect(discard_results([5,1,13,6,8,1,10], first_roll: 8, second_roll: 2))
          .to eq [5,6,8,1,10]
      end
    end
  end
end
