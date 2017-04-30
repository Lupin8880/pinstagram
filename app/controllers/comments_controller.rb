class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @picture = @comment.picture
    respond_to do |format|
      if @comment.save
      format.html { redirect_to picture_path(@picture), notice: 'コメントを投稿しました。' }
      # JS形式でレスポンスを返します。
      format.js { render :index }
    else
      format.html { render :new }
    end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @picture = Picture.find(params[:picture_id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to pictures_path, notice: "ピクチャーを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to pictures_path, notice: "ピクチャーを削除しました！"
  end

  private
    def comment_params
      params.require(:comment).permit(:picture_id, :content)
    end
end
