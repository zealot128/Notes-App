class AddAdminUser < ActiveRecord::Migration
  def up
    User.create(:email => "admin@pludoni.de", :password => "admin", :password_confirmation => "admin", :role => "admin")
  end

  def down
    User.find_by_email("admin@pludoni.de").destroy
  end
end
