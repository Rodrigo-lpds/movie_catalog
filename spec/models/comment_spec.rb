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
    it 'with not approved comments' do
      comment = create(:comment, status: false, movie_id: @movie.id)
      expect(Comment.not_approved.find_by(id: comment.id)).to be_present
    end

    it 'with approved comments' do
      comment = create(:comment, status: true, movie_id: @movie.id)
      expect(Comment.approved.find_by(id: comment.id)).to be_present
    end
  end

  describe 'Instance Methods' do
    it 'save_to_logs' do
      comment = create(:comment, movie_id: @movie.id)
      comment.update(status: true)

      expect(Log.find_by(comment_id: comment.id)).to be_present
    end
  end
end
