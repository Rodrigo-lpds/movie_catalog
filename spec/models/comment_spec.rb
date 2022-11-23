require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @movie = create(:movie)
  end

  describe 'Valid Model' do
    it 'create valid comment' do
      comment = build(:comment, movie_id: @movie.id)
      expect(comment).to be_valid
      expect(comment.save).to be_truthy
    end
  end

  describe 'Validations' do
    it 'with invalid text' do
      comment = build(:comment, text: nil, movie_id: @movie.id)
      expect(comment).to_not be_valid
      expect(comment.save).to_not be_truthy
    end
  end

  describe 'Scope' do
  end
end
