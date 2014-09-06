class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email, :null => false, :default => ""
      t.string :token
      t.string :uid
      t.timestamps
    end
  end
end
