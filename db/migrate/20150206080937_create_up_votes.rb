class CreateUpVotes < ActiveRecord::Migration
  def change
    create_table :up_votes do |t|

      t.timestamps null: false
    end
  end
end
