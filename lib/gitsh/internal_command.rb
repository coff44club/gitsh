module Gitsh
  module InternalCommand
    def self.new(env, command, args=[])
      if klass = COMMAND_CLASSES[command.to_sym]
        klass.new(env, args)
      end
    end

    class Set
      def initialize(env, args=[])
        @env = env
        @args = args
      end

      def execute
        key, value = args
        env[key] = value
      end

      private

      attr_reader :env, :args
    end

    COMMAND_CLASSES = {
      set: Set
    }.freeze
  end
end
