class AddOwnDataPolicy < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute(
      %q{
        ALTER TABLE devices ENABLE ROW LEVEL SECURITY;
        CREATE POLICY manage_own_data ON devices FOR ALL USING (current_user = tenant);
      }
    )
  end
end
