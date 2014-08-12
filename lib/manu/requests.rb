module Manu
  module Requests

    class ArticleCreator
      def create(params)
        article = Article.new(params)
        article.save!
        return article
      end
    end

    class Assignment

      def request_translation(user, article)
        if (user && article)
          assign(article, user)
        else
          "Invalid parameters"
        end
      end

      private
      def assign(article, user)
        article = Article.find(article)
        if !article.already_requested?(user)
          article.requesters << User.find(user)
          "Request done satisfactory"
        else
          "The request already exists."
        end

      end
    end
  end
end

