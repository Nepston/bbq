require 'rails_helper'

RSpec.describe EventPolicy do

  let(:current_user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: current_user) }

  describe 'User try to change Event' do
    context 'allow access for owner to' do
      permissions :edit? do
        it { is_expected.to permit(current_user, event) }
      end
    end
  end
end


#
# context 'user try to edit, update or destroy event' do
#   permissions :edit?, :update?, :destroy? do
#     it 'allows access for owner' do
#       expect(EventPolicy).to permit(user, event)
#     end
#
#     it 'denies access for not owner' do
#       expect(EventPolicy).not_to permit(other_user, event)
#     end
#
#     it 'denies access for not authentificated user' do
#       expect(EventPolicy).not_to permit(nil, event)
#     end
#   end
# end