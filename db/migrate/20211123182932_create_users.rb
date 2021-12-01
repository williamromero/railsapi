# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :email
      t.integer :age
      t.string :password_digest
      t.string :type

      t.timestamps
    end
  end
end
