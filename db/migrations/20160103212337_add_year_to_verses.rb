Lotus::Model.migration do
  change do
    alter_table :verses do
      add_column :year, Integer
    end
  end
end
