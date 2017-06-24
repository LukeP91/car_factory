require_relative 'rolls'

describe Rolls do
  let(:rolls) { Rolls.new }

  before :each do
    rolls.instance_variable_set(:@results, [5, 1, 13, 6, 8, 1, 10])
  end

  describe '#discard_results' do
    context 'first extra roll is higher than 7' do
      it 'should drop lowest and highest of results and not change order' do\
        rolls.instance_variable_set(:@additional_roll_result,
                                    { first_roll: 8, second_roll: 0 })
        rolls.discard_results
        expect(rolls.instance_variable_get(:@results)).to eq [5, 6, 8, 1, 10]
      end
    end

    context 'first extra roll is equal to 7 or below' do
      context 'second extra roll is equal to 1' do
        it 'should two lowest of results and not change order' do
          rolls.instance_variable_set(:@additional_roll_result,
                                      { first_roll: 7, second_roll: 1 })
          rolls.discard_results
          expect(rolls.instance_variable_get(:@results)).to eq [5, 13, 6, 8, 10]
        end
      end

      context 'second extra roll is higher than 1' do
        it 'should drop lowest and highest of results and not change order' do
          rolls.instance_variable_set(:@additional_roll_result,
                                      { first_roll: 7, second_roll: 2 })
          rolls.discard_results
          expect(rolls.instance_variable_get(:@results)).to eq [5, 6, 8, 1, 10]
        end
      end
    end
  end
end
