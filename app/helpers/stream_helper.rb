module StreamHelper
  def read_stream(stream_name)
    Rails
      .configuration
      .event_store
      .read
      .backward
      .stream(stream_name)
      .to_a
  end

  def load_entity_aggregate(uid)
    Domain::Book.new(uid).load("Domain::Entity$#{uid}")
  end
end
