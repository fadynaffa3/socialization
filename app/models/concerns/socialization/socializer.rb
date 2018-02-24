module Socialization
  module Socializer
    extend ActiveSupport::Concern

    def call_after_action_hooks(object, action)
      action = self.class.instance_variable_get("@after_#{action}_hook")
      send(action, object) if action.present?
    end

    included do
      include Socialization::Mention

      def self.acts_as_mentionable(_opts = {})
        include Socialization::Mentionable
      end
    end
  end
end
