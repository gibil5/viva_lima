

# jr@oblique:  30/08/14


class AddRememberTokenToUsers < ActiveRecord::Migration

  def change
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end

end
