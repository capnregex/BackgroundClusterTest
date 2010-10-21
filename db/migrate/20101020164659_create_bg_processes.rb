class CreateBgProcesses < ActiveRecord::Migration
  def self.up
    create_table :bg_processes do |t|
      t.string :host
      t.integer :port
      t.integer :pid
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :bg_processes
  end
end
