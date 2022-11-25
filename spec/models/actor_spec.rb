require 'rails_helper'



  RSpec.describe 'Validations' do
    it 'with valid actor' do
      actor = build(:actor, name: nil, email: nil, birth_date: nil )
      expect(actor).to_not be_valid
      expect(actor.save).to_not be_truthy
    end
  end
 

