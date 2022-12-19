RSpec.describe ItemsController do
  describe '#create' do
    context 'If basket is initiated' do
      let(:basket) { Basket.create }
      let(:product) { Product.create(name: "Cage", code: "CODE", price: 12.0)}
      it 'creates an Item for the selected product' do
        session = { basket_id: basket.id }
        params = { product_id: product.id}
        expect{post :create, params: params}.to change(Item, :count).by(1)
      end
    end

    context 'If basket is not initiated' do
      let(:product) { Product.create(name: "Cage", code: "CODE", price: 12.0)}
      session = { basket_id: nil }
      Basket.destroy_all
      it 'creates a basket and associated Item for the selected product' do
        params = { product_id: product.id}
        expect{post :create, params: params}.to change(Basket, :count).by(1)
                                            .and change(Item, :count).by(1)
      end
    end
  end
end
  