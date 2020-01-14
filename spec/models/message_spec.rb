require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('example@test.com').for(:email) }
    it { should_not allow_value('example').for(:email) }

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).only_integer }
  end
end
