# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::User, type: :model do
  let!(:user) { build(:account_user) }

  context 'when validar la presencia de los campos requeridos' do
    it 'validando presencia de correo' do
      expect(user).to validate_presence_of(:email)
    end

    it 'validando presencia de age' do
      expect(user).to validate_presence_of(:age)
    end

    it 'validando presencia de password' do
      expect(user).to validate_presence_of(:password_digest)
    end
  end

  context 'when validar si los campos cumplen con sus esquemas' do
    it 'Debe validar si el correo es único' do
      expect(user).to validate_uniqueness_of(:email)
    end

    it 'Debe validar si el age es mayor a 18' do
      expect(user).to validate_numericality_of(:age).is_greater_than_or_equal_to(18)
    end

    it 'Debe validar si el age es menor a 199' do
      expect(user).to validate_numericality_of(:age).is_less_than_or_equal_to(100)
    end

    it 'Debe validar si el usuario es de type owner o employee' do
      # should validate_inclusion_of(:type).in_array(%w[master employee owner])
    end
  end
end
