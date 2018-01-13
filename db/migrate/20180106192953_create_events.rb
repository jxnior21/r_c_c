class CreateEvents < ActiveRecord::Migration[5.1]
  def up
    create_table :events do |t|
      t.string 'title', :default => 'Evento', :null => false
      t.string 'date', :default => '00/00/00', :null => true, :limit => 8
      t.string 'description', :null => false
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
