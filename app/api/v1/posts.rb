module V1
  class Posts < Grape::API

    resource :posts do
      desc "Return all posts"
      get "", root: :posts do
        Post.all
      end

      desc "Return a post"
      params do
        requires :id, type: String, desc: "ID of the
          post"
      end
      get ":id", root: "post" do
        Post.where(id: permitted_params[:id]).first!
      end

      desc "create a new employee"

      params do
        requires :title, type: String
        requires :body, type:String
        requires :author_id, type:Integer
      end

      post do
        Post.create!({
          title:params[:title],
          body:params[:body],
          author_id:params[:author_id]
        })
      end
    end
  end
end
