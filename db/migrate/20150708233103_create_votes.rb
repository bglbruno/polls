class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :answer
      t.references :poll, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :polls
  end
end
