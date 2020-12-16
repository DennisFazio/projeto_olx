# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), "../pages/*_page.rb")].sort.each { |file| require file }

module PageObjects
  def home
    @home ||= Home.new
  end

  def search_result
    @search_result ||= SearchResult.new
  end
end
