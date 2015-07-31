class DeviseCreateOperators < ActiveRecord::Migration
  def change
    create_table(:operators) do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name

      t.timestamps
    end

    add_index :operators, :email,                unique: true
  end
end
