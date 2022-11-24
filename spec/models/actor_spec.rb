require 'rails_helper'

RSpec.describe Actor, type: :model do
  context 'after create' do  
    it 'actor not blank' do   
      actor = Actor.new
      expect (Actor.save).to eq(false)  
    end
  end

  describe 'Validations' do
    it 'with valid actor' do
      actor = build(:actor, name: nil, email: nil, birth_date: nil )
      expect(actor).to_not be_valid
      expect(actor.save).to_not be_truthy
    end
  end

  describe 'Scope' do
    it 'when not deleted actor' do
      actor = create(:actor, movie_id: @movie.id)
      expect(Actor.approved.find_by(id: actor.id)).to be_present
    end
  end

    it 'with deleted actor' do
      actor = create(:actor, movie_id: @movie.id)
      expect(Actor.not_approved.find_by(id: actor.id)).to be_present
    end
  end

  describe 'Instance Methods' do
    it 'save_to_cast' do
      actor = create(:actor, actor_id: @cast)
      actor.update(status: true)

      expect(Cast.find_by(actor_id: cast.id)).to be_present
    end
  end

