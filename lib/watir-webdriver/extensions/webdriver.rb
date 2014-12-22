module Selenium
  module WebDriver
    class TargetLocator
      def window(id)
        if block_given?
          original = begin
            @bridge.getCurrentWindowHandle
          rescue Error::NoSuchWindowError
            nil
          end

          @bridge.switchToWindow id

          begin
            returned = yield
          ensure
            current_handles = @bridge.getWindowHandles
            original = current_handles.first unless current_handles.include? original
            @bridge.switchToWindow original
            returned
          end
        else
          @bridge.switchToWindow id
        end
      end
    end
  end
end
