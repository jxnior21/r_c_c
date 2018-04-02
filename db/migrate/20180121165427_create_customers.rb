class CreateCustomers < ActiveRecord::Migration[5.1]
  def up
    create_table :customers do |t|
      t.string 'first_name', :null => false
      t.string 'last_name', :null => false
      t.string 'telephone', :null => false
      t.string 'email'
      t.string 'address1', :null => false
      t.string 'city', :null => false
      t.string 'state', :null => false
      t.string 'zip', :null => false
      t.string 'church'
      t.string 'gender'
      t.string 'first_name2', :null => false
      t.string 'last_name2', :null => false
      t.string 'relationship', :null => false
      t.string 'telephone2', :null => false
      t.belongs_to 'event', :null => false
      t.timestamps
    end
  end

  def down
    drop_table :customers
  end
end
