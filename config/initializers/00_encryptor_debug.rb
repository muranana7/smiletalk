# config/initializers/00_encryptor_debug.rb
# DEBUG_ENCRYPTOR=1 がセットされている時だけ動作し、
# ActiveSupport::MessageEncryptor の初期化エラー発生箇所のスタックトレースをログに出します。
if ENV['DEBUG_ENCRYPTOR'] == '1'
  begin
    require 'active_support/message_encryptor'

    module ActiveSupport
      class MessageEncryptor
        alias_method :__orig_initialize, :initialize

        def initialize(*args, **kwargs)
          __orig_initialize(*args, **kwargs)
        rescue => e
          # 起動ログにスタックトレースを出す（発生元のファイル/行を特定）
          Rails.logger.error "[encryptor-debug] #{e.class}: #{e.message}"
          Rails.logger.error e.backtrace.join("\n")
          raise
        end
      end
    end
  rescue => outer
    Rails.logger.error "[encryptor-debug/setup] #{outer.class}: #{outer.message}"
  end
end
``