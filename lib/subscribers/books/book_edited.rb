module Subscribers
  module Books
    class BookEdited
      def call(event)
        book = ::Book.find_by(uid: event.data[:uid])
        updating_attributes = event.data.with_indifferent_access.slice(:title, :author, :summary)
        book&.update(updating_attributes)
      end
    end
  end
end
