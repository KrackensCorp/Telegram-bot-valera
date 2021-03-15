class Main
  module Listener
    # Module for checks
    module Security
      def message_is_new(start_time, message)
        message_time = if defined? message.date
                         message.date
                       else
                         message.message.date
                       end
        message_time.to_i > start_time
      end

      def message_too_far
        message_date = if defined? Listener.message.date
                         Listener.message.date
                       else
                         Listener.message.message.date
                       end
        message_delay = Time.now.to_i - message_date.to_i
        # if message delay less then 24h then processing message, else ignore
        message_delay > (1440 * 60)
      end
      module_function :message_is_new, :message_too_far
    end
  end
end
