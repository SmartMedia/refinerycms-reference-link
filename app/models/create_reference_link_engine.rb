class CreateReferenceLinkEngine < ActiveRecord::Migration

  def self.up
    create_table :reference_link_engine do |t|
      
      t.timestamps
    end

    add_index :reference_link_engine, :id

  end

  def self.down
    drop_table :reference_link_engine
  end

end
