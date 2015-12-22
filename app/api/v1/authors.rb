module V1
  class Authors < Grape::API
    resource :authors do
      desc "Return all authors"
      get "", root: :authors do
        authors = Author.all
      end

      desc "Return a author"
      params do
        requires :id, type: String, desc: "ID of the
          author"
      end
      get ":id", root: "author" do
        Author.find(params[:id])
      end

      desc "create a new author"

      params do
        requires :name, type: String
        requires :surname, type:String
        requires :age, type:Integer
      end

      post do
        Author.create!({
          name:params[:name],
          surname:params[:surname],
          age:params[:age]
        })
      end

      get ":id/posts" do
        author = Author.find(params[:id])
        author.posts
      end
    end
  end
end
