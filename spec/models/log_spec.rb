require 'rails_helper'

RSpec.describe Log, type: :model do
  before(:each) do
    @movie = create(:movie)
    @comment = create(:comment, movie_id: @movie.id)
  end

  describe 'Valid Model' do
    it 'create valid log' do
      log = build(:log, comment_id: @comment.id)
      expect(log).to be_valid
      expect(log.save).to be_truthy
    end
  end

  describe 'Validations' do
    it 'with invalid approved date' do
      log = build(:log, approved_date: nil, comment_id: @comment.id)
      expect(log).to_not be_valid
      expect(log.save).to_not be_truthy
    end
  end
end
