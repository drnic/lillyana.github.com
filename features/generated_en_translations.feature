Feature: Generated English translations
  In order to have English clients
  As a site manager
  I want to convert Swedish pages into separate English pages
  
  Scenario: Convert entire site
    Given folder "en-gen" is removed
    When I run task "rake translate"
    Then folder "en-gen" is created
  
  
  
