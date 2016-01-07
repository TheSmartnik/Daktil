Lotus::Model.migration do
  change do
    create_table :scheduled_verses do
      primary_key :id
      foreign_key :verse_id, :verses, uniq: true

      column :delivery_date, Date
    end
  end
end
