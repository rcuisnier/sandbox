@frontend @order
Feature: Order
  In order to buy some products
  As a visitor
  I want to be able to retrieve correct prices in basket, order and invoice

  @200
  Scenario: Adding 3 PHP plushes to basket and verify final review, order and invoice pages prices
    Given I am connected with "johndoe" and "johndoe" on "shop/basket"
    When I go to "shop/catalog"
    And I follow "Plushes"
    And I follow "Blue PHP plush"
    And I fill in "add_basket_quantity" with "3"
    And I press "Add to basket"
    Then I should see "Your basket"
    And I should see "Blue PHP plush"
    And the "sonata_basket_basket_basketElements_0_quantity" field should contain "3"
    And I should see "€35.99"
    And I should see "€107.96"
    And I should see "€89.97"
    And I should see "€17.99"
    And I should see "€107.96"
    Then I go to "shop/basket/step/delivery/address"
    Then I go to "shop/user/address/edit/30"
    Then I fill in "sonata_customer_address_countryCode" with "FR"
    Then I press "Save your address"
    And I should see "Your address has been successfully saved!"
    Then I press "Use selected"
    And I should see "Free delivery"
    Then I press "Update the delivery step"
    Then I press "Use selected"
    Then I press "Update the payment step"
    And I should see "Your basket"
    And I should see "PHP plush"
    And I should see "Delivery charge"
    And I should see "€0.00"
    And I should see "€35.99"
    And I should see "€107.96"
    And I should see "€89.97"
    And I should see "€17.99"
    And I should see "€107.96"
    Then I check "basket_tac"
    And I press "Process to payment"
    And I should see "Confirmation payment valid"
    Then I follow the first link of class "btn btn-primary pull-right"
    And I should see "Your order"
    And I should see "PHP plush"
    And I should see "Delivery"
    And I should see "€0.00"
    And I should see "€35.99"
    And I should see "€107.96"
    And I should see "€89.97"
    And I should see "€17.99"
    And I should see "€107.96"
    Then I follow the first link of class "btn btn-primary pull-right"
    And I should see "Your invoice"
    And I should see "PHP plush"
    And I should see "€35.99"
    And I should see "€89.97"
    And I should see "€17.99"
    And I should see "€107.96"
