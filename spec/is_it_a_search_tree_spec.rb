# frozen_string_literal: true

require_relative '../is_it_a_search_tree'

describe SearchTree do
  describe 'Tree.search_tree?' do
    it '[10, 4, 12] - must return true' do
      tree = SearchTree::Tree.new([10, 4, 12])
      expect(tree.is_a_search_tree?).to be true
    end

    it '[10, 5, 7] - must return false' do
      tree = SearchTree::Tree.new([10, 5, 7])
      expect(tree.is_a_search_tree?).to be false
    end

    it '[21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0] - must return true' do
      tree = SearchTree::Tree.new([21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0])
      expect(tree.is_a_search_tree?).to be true
    end

    it '[19, 9, 26, 4, 13, 17, 29] - must return false' do
      tree = SearchTree::Tree.new([19, 9, 26, 4, 13, 17, 29])
      expect(tree.is_a_search_tree?).to be false
    end

    it '[20, 10, 27, 12, 14, 23, 30] - must return false' do
      tree = SearchTree::Tree.new([20, 10, 27, 12, 14, 23, 30])
      expect(tree.is_a_search_tree?).to be false
    end

    it '[20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0] - must return false' do
      tree = SearchTree::Tree.new([20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0])
      expect(tree.is_a_search_tree?).to be false
    end
  end
end
