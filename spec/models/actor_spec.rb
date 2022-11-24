require 'rails_helper'

RSpec.describe Actor, type: :model do
  context 'before delet' do  # (almost) plain English
    it 'nome not blank' do   #
      expect { Actor.delet() }.to be false  # test code
    end
  end
end
