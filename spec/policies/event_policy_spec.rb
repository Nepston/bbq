require 'rails_helper'

RSpec.describe EventPolicy do

  let(:current_user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: current_user) }

  context 'user try to change event' do
    permissions :edit? do
      it 'access allowed for owner' do
        expect(EventPolicy).to permit(current_user, event)
      end

      it 'access denied for non-owner' do
        expect(EventPolicy).not_to permit(another_user, event)
      end

      it 'access denied for unauthenticated user' do
        expect(EventPolicy).not_to permit(nil, event)
      end
    end

    permissions :update? do
      it 'access allowed for owner' do
        expect(EventPolicy).to permit(current_user, event)
      end

      it 'access denied for non-owner' do
        expect(EventPolicy).not_to permit(another_user, event)
      end

      it 'access denied for unauthenticated user' do
        expect(EventPolicy).not_to permit(nil, event)
      end
    end

    permissions :destroy? do
      it 'access allowed for owner' do
        expect(EventPolicy).to permit(current_user, event)
      end

      it 'access denied for non-owner' do
        expect(EventPolicy).not_to permit(another_user, event)
      end

      it 'access denied for unauthenticated user' do
        expect(EventPolicy).not_to permit(nil, event)
      end
    end
  end
end