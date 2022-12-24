require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'nii', email: 'niidarku66@gmail.com', password: 'password')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'nii'
    expect(subject).to be_valid
  end
end
