# frozen_string_literal: true

module ApplyRole
  extend ActiveSupport::Concern

  def self.assign_role(model)
    case model.class.name
    when 'Account::Owner'
      model.update(type: 'owner')
    when 'Account::Employee'
      model.update(type: 'employee')
    when 'Account::User'
      model.update(type: 'user')
    end
  end
end
