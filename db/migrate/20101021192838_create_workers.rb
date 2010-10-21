class CreateWorkers < ActiveRecord::Migration

  def self.up
    create_table :workers do |t|
      t.string :af, :limit => 40
      t.integer :port
      t.string :host, :limit => 40
      t.string :addr, :limit => 40
      t.string :environment, :limit => 40
      t.boolean :active
      t.references :task

      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end

end
