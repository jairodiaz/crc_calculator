class CrcCalculatorsController < ApplicationController
  def new
    @crc_calculator = CrcCalculator.new
    @other_fuel_names = CrcCalculator.attr_list
    @other_fuels = Array.new
    @other_fuel_names.each do |name|
      @other_fuels << [name, get_units_for(name)]
    end
    logger.debug "getting instance variables #{@other_fuels}"
  end

  def show_liability
    logger.debug "cliente called show_liability with params #{params.inspect}"
    @cost_per_tonne = 12
    @total_result = session[:total]
  end

  def calculate
    logger.debug "cliente called calculate with params #{params.inspect}"
    @crc_calculator = CrcCalculator.new(params[:crc_calculator])
    if @crc_calculator.valid?

      @results = {}
      @total_result = 0
      params[:crc_calculator].each_pair do |key, value|
        unless value == ""
          input_value = value
          input_object = get_object_id(key)
          formula_input_name = get_formula_input_name(key)
          logger.debug "input value was: #{input_value} for object: #{input_object} for formula input: #{formula_input_name}"
          @crc_calculator.answer_params = {:amount=>input_value,
                                           :formula_input_name => formula_input_name,
                                           :fuel => input_object }
          @crc_calculator.result = get_answer(CrcCalculator.computation_id, @crc_calculator.answer_params)

          begin
            @results[key] = (@crc_calculator.co2 / 1000)
            @total_result += @results[key]
          rescue => e
            logger.debug e.message
            logger.debug @crc_calculator.result
#            logger.debug e.backtrace
          end
            
          # you want to check for errors from the api here!
          # if the errors exist then you need to handle that accordingly

        end
      end
      session[:total] = @total_result
    end
  end

  private
  def get_answer(computation_id, params)
    CrcEstimator.calculated_session.answer_for_computation(computation_id, params)
  end

  def get_object_id(key)
    #Mapping taken from http://browser.carboncalculated.com/object_templates/fuel_crc/generic_objects
    case key
      when "aviation_spirit" then "4cbdbbcdb64f7a41cc000004"
      when "aviation_turbine_fuel" then "4cbdbbcdb64f7a41cc000011"
      when "basic_oxygen_steel_gas" then "4cbdbbcfb64f7a41cc0000a3"
      when "blast_furnace_gas" then "4cbdbbcfb64f7a41cc0000ad"
      when "burning_oil" then "4cbdbbceb64f7a41cc000024"
      when "cement_industry_coal" then "4cbdbbceb64f7a41cc00001a"
      when "coke_oven_gas" then "4cbdbbcfb64f7a41cc0000b6"
      when "coking_coal" then "4cbdbbceb64f7a41cc000036"
      when "colliery_methane" then "4cbdbbd0b64f7a41cc0000bf"
      when "commercial_sector_coal" then "4cbdbbceb64f7a41cc00002d"
      when "diesel" then "4cbdbbd0b64f7a41cc000100"
      when "core_electricity" then "4cbdbbd0b64f7a41cc0000c8"
      when "non_core_electricity" then "4cbdbbd0b64f7a41cc0000c8"
      when "fuel_oil" then "4cbdbbceb64f7a41cc00003f"
      when "gas_oil" then "4cbdbbd0b64f7a41cc000109"
      when "industrial_coal" then "4cbdbbceb64f7a41cc000048"
      when "lignite" then "4cbdbbceb64f7a41cc000051"
      when "liquid_petroleum_gas" then "4cbdbbd0b64f7a41cc0000f7"
      when "naphtha" then "4cbdbbceb64f7a41cc000063"
      when "core_natural_gas" then "4cbdbbd0b64f7a41cc0000d3"
      when "non_core_natural_gas" then "4cbdbbd0b64f7a41cc0000d3"
      when "other_petroleum_gas" then "4cbdbbd0b64f7a41cc0000dc"
      when "peat" then "4cbdbbceb64f7a41cc00005a"
      when "petrol" then "4cbdbbd0b64f7a41cc0000ee"
      when "petroleum_coke" then "4cbdbbceb64f7a41cc00006c"
      when "scrap_tyres" then "4cbdbbceb64f7a41cc000075"
      when "solid_smokeless_fuel" then "4cbdbbceb64f7a41cc00007f"
      when "sour_gas" then "4cbdbbd0b64f7a41cc0000e5"
      when "waste" then "4cbdbbceb64f7a41cc000088"
      when "waste_oils" then "4cbdbbcfb64f7a41cc000091"
      when "waste_solvents" then "4cbdbbcfb64f7a41cc00009a"
    end
  end

  def get_formula_input_name(key)
    logger.debug "searching formula for #{key}"
    kwh_group = ["basic_oxygen_steel_gas", "blast_furnace_gas", "coke_oven_gas", "colliery_methane", "core_electricity",
                 "non_core_electricity", "sour_gas", "core_natural_gas", "non_core_natural_gas","other_petroleum_gas"]
    tonnes_group = ["aviation_spirit", "aviation_turbine_fuel", "cement_industry_coal", "coking_coal",
                    "commercial_sector_coal", "fuel_oil", "industrial_coal", "lignite", "naphtha", "peat",
                    "petroleum_coke", "scrap_tyres", "solid_smokeless_fuel", "waste", "waste_oils", "waste_solvents"]
    litres_group = ["burning_oil", "diesel", "petrol", "liquid_petroleum_gas", "gas_oil", "natural_gas",
                    ]

    if kwh_group.include? key
      'emissions_per_kwh'
    elsif tonnes_group.include? key
      'emissions_per_tonne'
    elsif litres_group.include? key
      'emissions_per_litre'
    else
      raise
    end
  end

  def get_units_for(key)
    case get_formula_input_name(key)
      when 'emissions_per_kwh' then 'kWh'
      when 'emissions_per_tonne' then 'tonnes'
      when 'emissions_per_litre' then 'litres'
    end
  end
end