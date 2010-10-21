class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :url
      t.string :path
      t.string :environment, :limit => 40
      t.string :class_name, :limit => 40
      t.integer :record_id
      t.string :method, :limit => 40
      t.string :parameters
      t.string :state
      t.integer :priority
      t.references :worker 

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
