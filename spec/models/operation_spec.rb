# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'dee', email: 'duane@gmail.com', password: 'testing') }
  let(:group) { Group.create(name: 'Shopping', icon: 'https://i.duane.com/Ar3Lf3Dt.png', user_id: user.id) }
  let(:operation) { Operation.create(name: 'Dress', amount: 12, user_id: user.id) }
  let(:money_group) { MoneyGroup.create(group_id: group.id, operation_id: operation.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(operation).to be_valid }
    end

    it 'is a valid money_group' do
      expect(money_group).to be_valid
    end

    it 'should not be a valid name ' do
      operation.name = nil
      expect(operation).to_not be_valid
    end

    it 'should not be valid amount ' do
      operation.amount = -10
      expect(operation).to_not be_valid
    end

    it 'should be a valid amount ' do
      operation.amount = 10
      expect(operation).to be_valid
    end
  end
end
