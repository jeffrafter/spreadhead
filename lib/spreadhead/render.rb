require 'redcloth'
require 'bluecloth'

module Spreadhead
  module Render

    def self.included(controller) # :nodoc:
      controller.send(:include, InstanceMethods)
      controller.class_eval do
        helper_method :page
        hide_action   :page
      end
    end

    module InstanceMethods
      # Show the contents of the specified page to be used when rendering.
      #
      # @return The page text as a string
      def page(object)
        return '' unless object

        case object.format
          when 'markdown'
            markdown(object.text)
          when 'textile'
            RedCloth.new(object.text).to_html
          else
            object.text
        end        
      end
    end  
  end
end
