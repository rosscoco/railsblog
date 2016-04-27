class ArticlesController < ApplicationController
	include ArticlesHelper

	before_action :find_article, only:[:edit,:show,:destroy,:update]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		
		@article = Article.new( article_params )

		if @article.save
			flash.notice = "Article #{@article.title} created!"
			redirect_to article_path( @article )
		else
			flash.notice = "Article Create Error!"
			render 'new'
		end
	end

	def edit
		
	end

	def update
		@article.update( article_params )

		flash.notice = "Article #{@article.title} updated!"

		redirect_to article_path( @article )
	end

	def show
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def destroy
		
		flash.notice = "Article #{@article.title} deleted!"
		@article.destroy
		redirect_to articles_path

	end


	private 
		def find_article
			@article = Article.find( params[:id] )
		end
end
