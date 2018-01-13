class CreateFutureEvents < ActiveRecord::Migration[5.1]
  def up
    create_table :future_events do |t|
      t.string 'title', :default => 'Evento', :null => false
      t.string 'date', :default => '00/00/00', :limit => 8
      t.string 'kind', :default => 'TBD', :null => false
      t.timestamps
    end
  end

  def down
    drop_table :future_events
  end
end
