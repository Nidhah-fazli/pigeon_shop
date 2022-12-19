RSpec.feature 'Product Listing', type: :feature, xhr: true do
  scenario 'When creating new product' do

    visit '/products/new'

    fill_in 'Name', with: "Cage"
    fill_in 'Code', with: "CODE"
    fill_in 'Price', with: '12.0'

    click_button 'Create Product'

    expect(page).to have_content("Cage")
    expect(page).to have_content("CODE")
    expect(page).to have_content("12.0")
  end
end