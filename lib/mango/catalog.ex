defmodule Mango.Catalog do
  alias Mango.Catalog.Product

  def list_products do
    [
      %Product{name: "Tomato", price: 50, is_seasonal: false},
      %Product{name: "Apple", price: 100, is_seasonal: true}
    ]
  end

  def list_seasonal_products do
    list_products()
    |> Enum.filter(fn(product) -> 
      product.is_seasonal == true 
    end)
  end
end
