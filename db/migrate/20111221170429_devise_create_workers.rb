class DeviseCreateWorkers < ActiveRecord::Migration
  def change
    create_table(:workers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :workers, :email,                :unique => true
    add_index :workers, :reset_password_token, :unique => true
    # add_index :workers, :confirmation_token,   :unique => true
    # add_index :workers, :unlock_token,         :unique => true
    # add_index :workers, :authentication_token, :unique => true
  end

end
