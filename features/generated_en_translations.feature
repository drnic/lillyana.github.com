Feature: Generated English translations
  In order to have English clients
  As a site manager
  I want to convert Swedish pages into separate English pages
  
  Scenario: Convert entire site
    When I run task "rake translate"
    Then folder "en-gen/My_Blog/Poster/2009/5" is created
    Then file "en-gen/My_Blog/Poster/2009/5/23_Photo_wall.html" is created
    Then file "en-gen/My_Blog/Poster/2009/5/8_EKO_place.html" is created
    Then file "en-gen/My_Blog/Poster/2009/6/3_3_years.html" is created
  
  
  
