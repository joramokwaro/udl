class StaticPagesController < ApplicationController

  def home
    if signed_in?
        all_sessions = current_user.scrape_sessions

  	    @scrape_sessions = all_sessions.limit(5)
        
        @has_more_sessions = true if all_sessions.size > 5

        @all_pages_count    = 0
        @all_posts_count    = 0
        @all_comments_count = 0

        all_pages = ScrapePage.where(scrape_session_id: all_sessions.select(:id))
        @all_pages_count = all_pages.size

        all_posts = FbPost.where(scrape_page_id: all_pages.select(:id))
        @all_posts_count = all_posts.size

        all_comments = FbComment.where(fb_post_id: all_posts.select(:id))
        @all_comments_count = all_comments.size
    end 
  	@has_users = true if User.count > 0
  end

  def help
  end

  def about
  end
end
