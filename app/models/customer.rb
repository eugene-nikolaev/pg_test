class Customer < ActiveRecord::Base
  class << self
    def generate_db_role(customer)
      fragments = ActiveSupport::Inflector
        .transliterate(customer.name)
        .split(/[^a-zA-Z0-9]|\s/)
        .reject(&:blank?)
      role = fragments.join("_")
      role.downcase
    end
  end

  after_create do |entity|
    db_role = Customer.generate_db_role(entity)
    Customer.transaction do
      entity.update_attribute(:db_role, db_role)
      role = db_role
      ActiveRecord::Base.connection.execute(
        %Q{
          DROP ROLE IF EXISTS #{role};
          CREATE ROLE #{role};
          GRANT tenant TO #{role};
        }
      )

    end
  end

  after_destroy do |entity|
    ActiveRecord::Base.connection.execute("DROP ROLE IF EXISTS #{entity.db_role}")
  end
end
