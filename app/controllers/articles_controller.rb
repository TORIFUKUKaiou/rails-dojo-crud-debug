class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Articles.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.first!
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(artcle_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "記事を公開しました。新しい知識の信号が届いています。" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @article.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(title: article_params[:title])
        format.html { redirect_to articles_path, notice: "記事を更新しました。最新の内容を発信しています。", status: :see_other }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @article.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: "記事を削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :title ])
    end
end
