class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :app_date
      t.time :start_time
      t.time :end_time
      t.references :doctor, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
