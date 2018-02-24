class User < ApplicationRecord
  acts_as_mentionable

  after_mention_created :notify_on_mention
  after_mention_deleted :notify_on_mention
  after_mention_updated :notify_on_mention

  def notify_on_mention(mention)
    # HOLA
  end
end
