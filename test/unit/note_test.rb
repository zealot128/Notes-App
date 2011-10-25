require "test_helper.rb"
require "shoulda"

class NoteTest < ActiveSupport::TestCase

  context "validation and creation" do
    setup do
      @note = Note.new(:title => "Plesk blabla", :tag_list => "blasd", :description => "bla")
      @user = User.create(:email => "info@stefanwienert.net", :password => "5555555555", :password_confirmation => "5555555555")
      @note.user_id = @user.id
    end
    should "valid note saving" do
      assert @note.valid?, @note.errors.full_messages.join(", ")
    end

    should "not & to &amp;s once" do
      @note.description = "hallo & hallo"
      assert @note.save
      assert_equal @note.html, "<p>hallo &amp; hallo</p>"
    end

    should "not escape amp twice when used inside syntax" do
      @note.description = "<code lang=\"ruby\">Hallo & Hallo</code>"
      @note.save
      assert @note.html.include? "&amp;"
      p @note.html
    end
  end
end
