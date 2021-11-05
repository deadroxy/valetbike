class UpdateUser < ActiveRecord::Migration[6.1]
  def change
     rename_column :users, :Email, :email
     rename_column :users, :Password, :password
     rename_column :users, :Username, :username
     rename_column :users, :CreditCardNum, :creditCardNum
     rename_column :users, :ExpDate, :expDate
     rename_column :users, :SecurityCode, :securityCode

  end
end
