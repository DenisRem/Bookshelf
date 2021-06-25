# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::UsersController, type: :controller do
  let!(:user) { create(:user, :admin) }
  let!(:valid_params) { attributes_for(:user) }
  let!(:invalid_params) { { first_name: ' ', last_name: ' ' } }

  before { sign_in user }

  describe 'GET#show' do
    before do
      get :show, params: { id: user.id }
    end

    context 'when returns success and assigns user' do
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:user)).to eq(user) }
    end
  end

  describe 'GET#edit' do
    before do
      get :edit, params: { id: user.id }
    end

    context 'when returns http success and assign user' do
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:user)).to eq(user) }
    end
  end

  describe 'PUT#update' do
    subject { put :update, params: { id: user.id, user: valid_params } }

    context 'with valid params' do
      let(:params) { valid_params }

      before { subject }

      context 'when assigns the user' do
        it { expect(assigns(:user)).to eq(user) }
        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(account_user_path(user)) }
        it { expect(flash[:success]).to be_present }
      end

      it 'updates user attributes' do
        expect(user.reload.attributes.symbolize_keys).to include(valid_params.slice(:first_name, :last_name, :email))
      end
    end

    context 'with invalid params' do
      subject { put :update, params: { id: user.id, user: invalid_params } }

      let(:params) { invalid_params }

      it 'does not change user' do
        expect { subject }.not_to change { user.reload.attributes }
      end
    end
  end

  describe 'GET#index' do
    before do
      get :index
    end

    context 'when assigns users and renders template' do
      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('index') }
    end
  end

  describe 'DELETE#destroy' do
    subject { delete :destroy, params: { id: user.id } }

    before { subject }

    context 'when destroys the user and redirects to index' do
      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(account_users_path) }
      it { expect(flash[:danger]).to be_present }
    end
  end
end
