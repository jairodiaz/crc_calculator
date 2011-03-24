class CrcCalculator
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend AttributeListClass
  include SimpleCalculator

  attr_accessor :core_electricity,
                :non_core_electricity,
                :core_natural_gas,
                :non_core_natural_gas

  attr_accessor_with_list :aviation_spirit,
                :aviation_turbine_fuel,
                :basic_oxygen_steel_gas,
                :blast_furnace_gas,
                :burning_oil,
                :cement_industry_coal,
                :coke_oven_gas,
                :coking_coal,
                :colliery_methane,
                :commercial_sector_coal,
                :diesel,
                :fuel_oil,
                :gas_oil,
                :industrial_coal,
                :lignite,
                :liquid_petroleum_gas,
                :naphtha,
                :other_petroleum_gas,
                :peat,
                :petrol,
                :petroleum_coke,
                :scrap_tyres,
                :solid_smokeless_fuel,
                :sour_gas,
                :waste,
                :waste_oils,
                :waste_solvents

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.computation_id
    "4cbaf8c11076f10d25000002"
  end

  def persisted?
    false
  end
end