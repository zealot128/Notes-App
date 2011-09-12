class AddAdminUser < ActiveRecord::Migration
  def up
    User.create(:email => "admin@pludoni.de", :password => "admin123", :password_confirmation => "admin123", :role => "admin")
  end

  def down
    User.find_by_email("admin@pludoni.de").destroy
  end
end
