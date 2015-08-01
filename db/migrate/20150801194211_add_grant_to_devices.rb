class AddGrantToDevices < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute(
      "GRANT ALL ON devices TO public"
    )
    ActiveRecord::Base.connection.execute(
      "GRANT ALL ON schema_migrations TO public"
    )
   ActiveRecord::Base.connection.execute(
      "GRANT ALL ON users TO public"
    )
   ActiveRecord::Base.connection.execute(
      "GRANT ALL ON customers TO public"
    )

  end
end
