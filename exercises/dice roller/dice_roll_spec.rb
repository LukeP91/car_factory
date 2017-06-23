require_relative 'dice_roll'

describe DiceRoll do
  describe '#additional_roll' do

    let(:roll) { DiceRoll.new(30)}

    context 'first additional roll is hihger than 7' do
      it 'should return [first_roll, 0]' do
        allow(roll).to receive(:roll).and_return(8)
        expect(roll.additional_roll).to eq({ first_roll: 8, second_roll: 0 })
      end
    end

    context 'first addtional roll is lower or equal 7' do
      it 'should return [first_roll, second_roll]' do
        allow(roll).to receive(:roll).and_return(7, 1)
        expect(roll.additional_roll).to eq({ first_roll: 7, second_roll: 1 })
      end
    end
  end

  describe '#make_extra_roll' do

    let(:roll) { DiceRoll.new(20)}

    context 'the first extra roll is higher than 7' do
      it 'should roll k20' do
        allow(roll).to receive(:roll).and_return(7)
        expect(roll.make_extra_roll(first_roll: 8, second_roll: 0))
          .to eq 7
      end
    end

    context 'the first extra roll is equal to 7 or below' do
      context 'the second extra roll is within 24-30 (included)' do
        it 'should return 25' do
          expect(roll.make_extra_roll(first_roll: 7, second_roll: 24))
            .to eq 25
        end
      end

      context 'second extra roll is below 24' do
        it 'should roll k20' do
          allow(roll).to receive(:roll).and_return(7)
          expect(roll.make_extra_roll(first_roll: 7, second_roll: 23))
            .to eq 7
        end
      end
    end
  end
end
