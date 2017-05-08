class Task < ActiveRecord::Migration[5.1]
  def change
    create_table(:tasks) do |t|
      t.column(:description, :varchar)
      t.column(:done, :boolean)

      t.timestamps()
    end
  end
end
