class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get '/furniture' do
    category =Furniture.all
    category.to_json( only: [:id, :name, :price, :image,:description,:shipping]
      # , include: {
      #   company: { only: [:name] }
      # } 
    )
    
  end



  get '/furniture/category' do
    # Message.all.order(created_at: :asc).to_json
    category = Category.all
    category.to_json(only: [:id, :name], include: {
          furnitures: { only: [:name, :price, :image,:description]
          #   , include: {
          #   company: { only: [:name] }
          # }
        }
        })
  end


  get '/furniture/category/:id' do
    # Message.all.order(created_at: :asc).to_json
    category = Category.find(params[:id])
    category.to_json(only: [:id, :name], include: {
          furnitures: { only: [:name, :price, :image,:description]
          #   , include: {
          #   company: { only: [:name] }
          # }
        }
        })
  end

  get '/furniture/company' do
    # Message.all.order(created_at: :asc).to_json
    category = Company.all
    category.to_json(only: [:id, :name], include: {
          furnitures: { only: [:name, :price, :image,:description]
          #   , include: {
          #   company: { only: [:name] }
          # }
        }
        })
  end

  get '/furniture/company/:id' do
    # Message.all.order(created_at: :asc).to_json
    category = Company.find(params[:id])
    category.to_json(only: [:id, :name], include: {
          furnitures: { only: [:name, :price, :image,:description]
          #   , include: {
          #   company: { only: [:name] }
          # }
        }
        })
  end


  get '/furniture/:id' do
    furniture =Furniture.find(params[:id])
    furniture.to_json( only: [:id, :name, :price, :image,:description]
      # , include: {
      #   company: { only: [:name] }
      # } 
    )
  end

  post "/furniture" do
    Furniture.create(
      name: params[:name],
      price:params[:price],
      image: params[:image],
      description: params[:description],
      shipping: params[:shipping],
      category_id: params[:category_id],
      company_id: params[:company_id],
      featured: params[:featured],

    ).to_json
    

    {
      "Message": "Created successfully",
      "Status": "HTTP_200_OK"
    }.to_json()
  end

  patch '/furniture/:id' do
    furniture = Furniture.find(params[:id])
    furniture.update(
      price:params[:price],
      image: params[:image],
      description: params[:description],
      shipping: params[:shipping],
      category_id: params[:category_id],
      company_id: params[:company_id],
      featured: params[:featured],
    )
    furniture.to_json

    {
      "Message": "Created successfully",
      "Status": "HTTP_200_OK"
    }.to_json()
  end

  delete '/furniture/:id' do
    furniture = Furniture.find(params[:id])
    furniture.destroy
    furniture.to_json


    {
      "Message": "Created successfully",
      "Status": "HTTP_200_OK"
    }.to_json()
  end



end
