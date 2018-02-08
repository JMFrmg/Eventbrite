class CreateEventsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :events_users, id: false do |t|
      t.references :event, index: true
      t.references :user, index: true   
    end
  end
end
