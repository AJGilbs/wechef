class AddPriceToChefs < ActiveRecord::Migration[5.1]
  def change
    add_monetize :chefs, :price, currency: { present: false }
  end
end
