module Subscribers
  module Books
    class BookCreated
      def call(event)
        creating_attributes = event.data.with_indifferent_access.slice(:uid, :title, :author, :summary)
        ::Book.create!(creating_attributes)
      end
    end
  end
end
