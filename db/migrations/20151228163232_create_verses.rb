Hanami::Model.migration do
  change do
    create_table :verses do
      primary_key :id
      column :title, String
      column :text, 'text'
    end
  end
end
