class User < ApplicationRecord
  acts_as_mentionable

  after_mention_created :notify_on_mention

  def notify_on_mention(mention)
    # HOLA
  end
end
