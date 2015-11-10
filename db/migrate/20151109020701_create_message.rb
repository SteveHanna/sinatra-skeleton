class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.references :user
    end
  end
end
