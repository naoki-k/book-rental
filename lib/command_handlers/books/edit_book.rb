module CommandHandlers
  module Books
    class EditBook
      def call(command)
        stream = "Domain::Book#{command.uid}"
        entity_data = {
          uid: command.uid,
          title: command.title,
          author: command.author,
          summary: command.summary,
          status: command.status,
          nickname: command.nickname
        }.compact

        repository = AggregateRoot::Repository.new
        order = repository.load(Domain::Book.new(command.uid), stream)
        order.edit(entity_data)
        repository.store(order, stream)
      end
    end
  end
end
