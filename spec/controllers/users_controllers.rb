require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  OPTIONS = {
    resource: :users,
    fields: UserResource.fields,
    include: %i(posts)
  }

  subject(:user) { create(:user, :with_posts) }

  it { is_expected.to be_valid }

  describe 'GET #index' do
    context 'when invalid' do
      it_behaves_like 'request with error', action: :index
    end

    context 'when valid' do
      context 'when no query string is set' do
        options = OPTIONS.merge({
          action: :index,
          record: { id: 1 }
        })
        it_behaves_like 'JSON API request', options
      end
    end
  end

  describe 'GET #show' do
    context 'when invalid' do
      options = { action: :show, record: { id: 9999 } }
      it_behaves_like 'request with error', options
    end
  end
end

