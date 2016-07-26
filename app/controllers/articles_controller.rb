class ArticlesController < ApplicationController
 before_action :authenticate_user!, except: [:show, :index]
 before_action :set_article, only: [:destroy, :show]
 
 def index
   @articles = Article.all
 end

 def show
 	@article.update_visits_count
 end

 def new
 	@article= Article.new 	
 end

 def create
 	@article = current_user.articles.new( title:params[:article][:title],
 	body:params[:article][:body])
 	if @article.save then
 	  redirect_to @article
 	else
 	  render :new
 	end
 end

 def destroy
  	@article.destroy
 	redirect_to articles_path
 end

 def set_article	
 	@article = Article.find(params[:id])
 end

 def update
	
 end

end
