Feature: Initialize CarbonCalculated API
   In order to ensure that my installation works
   As an API user
   I want to connect to the API and run a simple test

  Scenario: Connect to API
    When I connect to CarbonCalculated Service
    Then I should have a valid reference

  Scenario: Simple Test
    When I am using the fuel_crc object template
    And  I enter 12764 kWh of electricity
    When I calculate the amount of CO2
    Then I should see "6.905324" tonnes of CO2 