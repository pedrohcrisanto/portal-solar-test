class AddCubeWeightToPowerGenerators < ActiveRecord::Migration[5.2]
  def change
    add_column :power_generators, :cube_weight, :float
  end
end
