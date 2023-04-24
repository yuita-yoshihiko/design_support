class NotificationReads < ActiveRecord::Migration[7.0]
  def change
    create_table :notification_reads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
