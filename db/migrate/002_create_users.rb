class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :hashed_password
      t.string :email
      t.integer :role
      t.string :salt

      t.timestamps
    end
    User.create(:login=>'admin',:name=>'Kaue Sanchez', :password=>'admin', :password_confirmation=>'admin', :email=>'kaue.sanchez@nudesign.com.br', :role=>User::ADMIN)
    
  end

  def self.down
    drop_table :users
  end
end
