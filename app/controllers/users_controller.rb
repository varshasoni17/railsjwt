class UsersController < ApplicationController
    def index
        users=User.all 
        render json: users, status: 200
      end
    
    
      def show
        user=User.find_by(id: params[:id])
        if user 
          render json: user, status: 200
        else 
          render json: {
            error: user.errors.full_messages
          }
        end
      end
    
    
      def create
       user=User.new(bk_params)
       if user.save 
        render json: user, status: 200
       else
        render json: {
          error:  user.errors.full_messages
        }
      end 
    end
    
    
    
      def update
        user = User.find_by(id: params[:id])
        
        if user 
          user.update(
          email: params[:email], 
          password: params[:password], 
          username: params[:username]
         
           )
          render json: "movie updated succesfully"
        else 
          render json: {
            error: user.errors.full_messages
          }
        end
      end
    
    def destroy
        user=User.find_by(id: params[:id])
        if user 
            user.destroy
          render json: "movie has been deleted"
        end
      end
     
    
      private 
      def bk_params
        params.require(:user).permit([
          :email,
          :password,
          :username
        
         
          
        ])
      end
end
