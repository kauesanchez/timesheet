class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :hashed_password
      t.string :email
      t.string :salt
      t.integer :role

      t.timestamps
    end
    User.create(:login=>'admin', :password=>'admin', :password_confirmation=>'admin', :email=>'admin@healthymouth.generalquestions.info', :role=>User::ADMIN)
    User.create(:login=>'teste', :password=>'teste', :password_confirmation=>'teste', :email=>'admin@auto.generalquestions.info', :role=>User::ADMIN)
  end

  def self.down
    drop_table :users
  end
end
