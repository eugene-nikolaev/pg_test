class CreateTenantMembership < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute(
      %q{
        DROP ROLE IF EXISTS tenant;
        CREATE ROLE tenant;
        ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON tables TO tenant;
        ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON sequences TO tenant;
      }
    )
  end
end
