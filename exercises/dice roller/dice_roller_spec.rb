require_relative 'dice_roller'
require 'pry'
describe '#select_results' do
  it 'should drop lowest and highest of results and not change order' do
    expect(select_results([5,1,13,6,8,1,10])).to eq [5,6,8,1,10]
  end
end

describe '#additional_roll' do
  context 'first additional roll is hihger than 7' do
    it 'should return [first_roll, 0]' do
      allow_any_instance_of(Object)
        .to receive(:roll_k)
        .with(30)
        .and_return(8)
      expect(additional_roll).to eq({ first_roll: 8, second_roll: 0 })
    end
  end

  context 'first addtional roll is lower or equal 7' do
    it 'should return [first_roll, second_roll]' do
      allow_any_instance_of(Object)
        .to receive(:roll_k)
        .with(30)
        .and_return(7, 1)
      expect(additional_roll).to eq({ first_roll: 7, second_roll: 1 })
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

  context 'first extra roll is equal to 7 or below is false' do
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

describe '#make_extra_roll' do
  context 'the first extra roll is higher than 7' do
    it 'should roll k20' do
      allow_any_instance_of(Object)
        .to receive(:roll_k)
        .with(20)
        .and_return(7)
      expect(make_extra_roll(first_roll: 8, second_roll: 0))
        .to eq 7
    end
  end

  context 'the first extra roll is equal to 7 or below' do
    context 'the second extra roll is within 24-30 (included)' do
      it 'should return 25' do
        expect(make_extra_roll(first_roll: 7, second_roll: 24))
          .to eq 25
      end
    end

    context 'second extra roll is below 24' do
      it 'should roll k20' do
        allow_any_instance_of(Object)
          .to receive(:roll_k)
          .with(20)
          .and_return(7)
        expect(make_extra_roll(first_roll: 7, second_roll: 23))
          .to eq 7
      end
    end
  end
end
