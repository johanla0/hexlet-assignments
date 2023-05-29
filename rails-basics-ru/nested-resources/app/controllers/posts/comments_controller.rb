# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def edit
      @comment = PostComment.find(params[:id])
      @post = @comment.post
    end

    def create
      post = Post.find(post_comment_params[:post_id])

      @comment = PostComment.new(post_comment_params)
      @comment.post = post

      if @comment.save
        redirect_to post_path(post), notice: 'Post comment was successfully created.'
      else
        redirect_to post_path(post), alert: 'Error.'
      end
    end

    def update
      @comment = PostComment.find(params[:id])
      post = @comment.post

      if @comment.update(post_comment_params)
        redirect_to post_path(post), notice: 'Post comment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment = PostComment.find(params[:id])
      post = @comment.post

      @comment.destroy

      redirect_to post_path(post), notice: 'Post comment was successfully destroyed.'
    end

    private

    def post_comment_params
      params.require(:post_comment).permit(:body, :post_id)
    end
  end
end
