class User
  include Hanami::Entity
  attributes :chat_id, :deliver_at, :first_name, :last_name, :origin

  # untill this one is reolved #https://github.com/hanami/model/issues/275
  def update(attributes = {})
    attributes.each do |attribute, value|
      setter = "#{attribute}="
      public_send(setter, value) if respond_to?(setter)
    end
  end
end
