module Socialization::Mentionable
  extend ActiveSupport::Concern

  module ClassMethods
    def after_mention_created(method)
      @after_create_hook = method
    end

    def after_mention_updated(method)
      @after_update_hook = method
    end

    def after_mention_deleted(method)
      @after_delete_hook = method
    end
  end

  included do
    has_many :mentions, as: :mentioned

    def mentionable?
      true
    end

    def create_mention!(mentioner, mentioned_in)
      return false unless mentions.where(mentioner: mentioner, mentioned_in: mentioned_in).count.zero?
      mention = Mention.create(mentioner: mentioner, mentioned: self, mentioned_in: mentioned_in)
      call_after_action_hooks(mention, :create)
    end

    def delete_mention!(mentioner, mentioned_in)
      mentions.where(mentioner: mentioner, mentioned_in: mentioned_in).destroy_all
      call_after_action_hooks(mention, :delete)
    end

    def update_mention!(mentioner, mentioned_in, new_mentioned)
      mention = mentions.where(mentioner: mentioner, mentioned_in: mentioned_in).first
      return false unless mention.present?
      mention.update_attributes(mentioned: new_mentioned)
      call_after_action_hooks(mention, :update)
    end
  end
end
