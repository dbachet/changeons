class CreateMailingListRecipients < ActiveRecord::Migration
  def change
    create_table :mailing_list_recipients do |t|
      t.string :email

      t.timestamps
    end
  end
end
