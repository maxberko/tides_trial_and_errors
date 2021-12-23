class AddDetailsToTideExtreme < ActiveRecord::Migration[6.1]
  def change
    add_column :tide_extremes, :category, :string
    add_column :tide_extremes, :time, :date
    add_column :tide_extremes, :height, :float
  end
end
