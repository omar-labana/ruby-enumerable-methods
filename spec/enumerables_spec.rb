# spec/calculator_spec.rb
# rubocop:disable Lint/UselessAssignment
require_relative '../lib/enumerable_module'
array = [1, 2, 3, 4, 5]
describe Enumerable do
  describe '#my_each' do
    it 'maps an object to given block' do
      expect(array.my_each { |item| item += 1 })
        .to eql(array.each { |item| item += 1 })
    end
  end
end
# rubocop:enable Lint/UselessAssignment
