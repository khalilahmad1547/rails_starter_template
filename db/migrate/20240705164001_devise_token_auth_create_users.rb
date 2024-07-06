class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.1]
  def change
    ## Required
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :provider, :string, null: false, default: 'email'

    ## Recoverable
    add_column :users, :allow_password_change, :boolean, default: true

    ## User Info
    add_column :users, :image, :string, null: false, default: ''

    ## Tokens
    add_column :users, :tokens, :json

    add_index :users, %i[uid provider], unique: true
  end
end
