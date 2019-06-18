# frozen_string_literal: true

require_relative '../lists'

describe 'Lists' do
  describe 'attributes' do
    context 'when initialized' do
      it 'should have a nil head' do
        list = LinkedList.new
        expect(list.head).to eq(nil)
      end

      it 'should have a nil tail' do
        list = LinkedList.new
        expect(list.head).to eq(nil)
      end
    end
  end

  # use (.) for class methods i.e. self.some_method
  # use (#) for instance methods i.e. instance.some_method
  describe '#add' do
    it 'should add a node to the end of the list' do
      list = LinkedList.new
      list.add(6)
      expect(list.tail.value).to eq(6)
    end
  end
end
