class AddPaperclipToAws < ActiveRecord::Migration
  def change
    add_attachment :aws, :uploaded_file
  end
end
