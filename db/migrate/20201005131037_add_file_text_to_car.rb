class AddFileTextToCar < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :file_text, :string
  end
end
