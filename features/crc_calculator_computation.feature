Feature: Operating the CRC Calculator
   In order to compute the number of tonnes CO2
   As an user
   I want to use the CRC Calculator for different values

  Background:
     Given I am using the fuel_crc object template
     Given I am on the crc calculator page

  Scenario: Computation for core electricity
    Given the user enters "12764" kWh of "core electricity"
    When the user calculates the amount of CO2
    Then the user should see "6.905324" tonnes of CO2 from their input of core electricity

  Scenario: Computation for core gas
    Given the user enters "8724" kWh of "core natural gas"
    When the user calculates the amount of CO2
    Then the user should see "1.601726" tonnes of CO2 has been calculated from their input of gas.

  Scenario: Computation for non core electricity
    Given the user enters "12764" kWh of "non core electricity"
    When the user calculates the amount of CO2
    Then the user should see "6.905324" tonnes of CO2 from their input of core electricity

  Scenario: Computation for non core gas
    Given the user enters "8724" kWh of "non core natural gas"
    When the user calculates the amount of CO2
    Then the user should see "1.601726" tonnes of CO2 has been calculated from their input of gas.

  Scenario: Computation for petrol
    Given the user enters "862" litres of "petrol"
    When the user calculates the amount of CO2
    Then the user should see "1.985617" tonnes of CO2 has been calculated from their input of petrol.

  Scenario: Computation for fuel oil
    Given the user enters "1.76" tonnes of "fuel oil"
    When the user calculates the amount of CO2
    Then the user should see "5.66016" tonnes of CO2 has been calculated from their input of fuel oil.

  Scenario: Computation for gas oil
    Given the user enters "637.42" litres of "gas oil"
    When the user calculates the amount of CO2
    Then the user should see "1.760554" tonnes of CO2 has been calculated from their input of gas oil.

  Scenario: Computation for diesel
    Given the user enters "687.5" litres of "diesel"
    When the user calculates the amount of CO2
    Then the user should see "1.814312" tonnes of CO2 has been calculated from their input of diesel.

  Scenario Outline: Computation for fuel
    Given the user enters "<amount>" units of "<fuel>"
    When the user calculates the amount of CO2
    Then the user should see "<result>" tonnes of CO2 has been calculated from their input.
    Examples:
      | amount | fuel                   | result         |
      | 1000   | aviation_spirit        | 3128.000000    |
      | 1000   | aviation_turbine_fuel  | 3150.000000    |
      | 1000   | basic_oxygen_steel_gas | 0.996000       |
      | 1000   | blast_furnace_gas      | 0.996000       |
      | 1000   | burning_oil            | 2.532000       |
      | 1000   | cement_industry_coal   | 2373.000000    |
      | 1000   | coke_oven_gas          | 0.146000       |
      | 1000   | coking_coal            | 2932.000000    |
      | 1000   | colliery_methane       | 0.184000       |
      | 1000   | commercial_sector_coal | 2577.000000    |
      | 1000   | diesel                 | 2.639000       |
      | 1000   | fuel_oil               | 3216.000000    |
      | 1000   | gas_oil                | 2.762000       |
      | 1000   | industrial_coal        | 2314.000000    |
      | 1000   | lignite                | 1203.000000    |
      | 1000   | liquid_petroleum_gas   | 1.495000       |
      | 1000   | naphtha                | 3131.000000    |
      | 1000   | other_petroleum_gas    | 0.205700       |
      | 1000   | peat                   | 1357.000000    |
      | 1000   | petrol                 | 2.303500       |
      | 1000   | petroleum_coke         | 2981.000000    |
      | 1000   | scrap_tyres            | 1669.000000    |
      | 1000   | solid_smokeless_fuel   | 2810.000000    |
      | 1000   | sour_gas               | 0.239700       |
      | 1000   | waste                  | 275.000000     |
      | 1000   | waste_oils             | 3026.000000    |
      | 1000   | waste_solvents         | 1613.000000    |

  Scenario: Total computation for a set of fuel amounts
    Given the users enters the following energy supplies
      | amount | fuel                   | result         |
      | 687.5  | diesel                 | 1.814312       |
      | 1.76   | fuel_oil               | 5.66016        |
      | 637.42 | gas_oil                | 1.760554       |
      | 862    | petrol                 | 1.985617       |
      | 12764  | core electricity       | 6.905324       |
      | 8724   | core natural gas       | 1.601726       |
    When the user calculates the amount of CO2
    Then the user should see "19.727694" tonnes of CO2