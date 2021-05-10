# spec/calculator_spec.rb
# rubocop:disable Lint/UselessAssignment
require_relative '../lib/enumerable_module'
array = [1, 2, 3, 4, 5]
describe Enumerable do
  describe '#my_each' do
    it 'maps a block to a given object' do
      expect(array.my_each { |item| item += 1 })
        .to eql(array.each { |item| item += 1 })
    end
  end

  describe '#my_each_with_index' do
    it 'maps a block to a given object along with each element index' do
      expect(array.my_each_with_index { |item, index| item += index })
        .to eql(array.each_with_index { |item, index| item += index })
    end
  end

  describe '#my_select' do
    it 'maps a block to a given object to select elements satisfying the block logic' do
      expect(array.my_select { |item| item > 1 })
        .to eql(array.select { |item| item > 1 })
    end
  end

  describe '#my_all' do
    it 'maps a block to a given object to check if elements satisfy the block logic' do
      expect(array.my_all? { |item| item > 0 })
        .to eql(array.all? { |item| item > 0 })
    end
  end

  describe '#my_any' do
    it 'maps a block to a given object to check if any element satisfies the block logic' do
      expect(array.my_any? { |item| item > 0 })
        .to eql(array.any? { |item| item > 0 })
    end
  end
  describe '#my_none' do
    it 'maps a block to a given object to check if elements don\'t satisfy the block logic' do
      expect(array.my_none? { |item| item % 2 == 0 })
        .to eql(array.none? { |item| item % 2 == 0 })
    end
  end

end
# rubocop:enable Lint/UselessAssignment
