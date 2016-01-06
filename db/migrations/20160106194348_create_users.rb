Lotus::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :chat_id, Integer
      column :first_name, String
      column :last_name, String
      column :origin, String
      column :deliver_at, String
    end
  end
end
