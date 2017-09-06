require IEx
defmodule MangoWeb.HomepageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "presence of featured products" do
    navigate_to("http://localhost:4001/")

    assert page_source() =~ "Seasonal products"
  end

  test "presence of seasonal products" do
    ## GIVEN
    # There are two products Apple and Tomato priced at 100 and 50 respectively

    ## WHEN
    # I navigate to homepage
    # IEx.pry
    navigate_to("http://localhost:4001/")

    ## THEN 
    #I expect the page title to be "Seasonal products"
    # IEx.pry
    page_title = find_element(:css, ".page_title") |> visible_text()

    assert page_title == "Seasonal Products"

    # And I expect Apple to be in the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    # And I expect its price to be displayed on the screen
    assert product_price == "100"

    # And I expect that Tomato is not present on the screen.
    refute page_source() =~ "Tomato"


  end
end
