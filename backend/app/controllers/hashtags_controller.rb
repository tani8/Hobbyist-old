class HashtagsController < ApplicationController

  def create
  end

  def popular
    hashtags = Hashtag.joins(:question_hashtags)
              .select('hashtags.name, count(hashtag_id) as "hashtag_count"')
              .group("hashtags.id")
              .order('hashtag_count desc')
              .limit(10)
    hashtags = hashtags.map { |tag| tag.name }
    render json: hashtags
  end

end
