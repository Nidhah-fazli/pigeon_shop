RSpec.feature 'Basket Listing', type: :feature, xhr: true do
  scenario 'When clicking Add to Basket' do
    product = Product.create(name: "Cage", code: "CODE", price: 12.0)

    visit '/'

    click_button 'Add to Basket'

    within('#basket') do
      expect(page).to have_content("Quantity: X #{product.items.last.quantity}")
    end
  end

  scenario 'When adding same item to basket' do
    product = Product.create(name: "Cage", code: "CODE", price: 12.0)

    visit '/'

    click_button 'Add to Basket'

    item_count = product.items.last.quantity
    
    visit '/'

    click_button 'Add to Basket'

    within('#basket') do
      expect(page).to have_content("Quantity: X #{item_count + 1}")
    end
  end
  
end
