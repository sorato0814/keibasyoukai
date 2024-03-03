class HorsesController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @horses = Horse.all

        if params[:search] == nil
            @horses= Horse.all
          elsif params[:search] == ''
            @horses= Horse.all
          else
            #部分検索
            @horses = Horse.where("name LIKE ? ",'%' + params[:search] + '%')
          end

          if params[:tag_ids]
            @horses = []
            params[:tag_ids].each do |key, value|
              if value == "1"
                tag_horses = Tag.find_by(name: key).horses
                @horses = @horses.empty? ? tag_horses : @horses & tag_horses
              end
            end
          end

          if params[:tag]
            Tag.create(name: params[:tag])
          end


    end  
      
    def new
    @horse = Horse.new
    end

    def create
      horse = Horse.new(horse_params)
      horse.user_id = current_user.id
    if horse.save!
        redirect_to :action => "index"
    else
        redirect_to :action => "new"
    end
    end

    def edit
      @horse = Horse.find(params[:id])
    end

    def update
      horse = Horse.find(params[:id])
      if horse.update(horse_params)
        redirect_to :action => "show", :id => horse.id
      else
        redirect_to :action => "new"
      end
    end

  
    def show
      @horse = Horse.find(params[:id])
      @comments = @horse.comments
      @comment = Comment.new
    end

    def destroy
      horse = Horse.find(params[:id])
      horse.destroy
      redirect_to action: :index
    end

    private
    def horse_params
    params.require(:horse).permit(:name, :year, :horse_id, :image, :about_horse, :about_race, :sex, tag_ids: [])
    end
end
