module Jekyll
  class PlatformsTag < Liquid::Tag
	
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
		page = context.environments.first["page"]
		folderNames = page["dir"].split('/')
		
		suiteNames = context.registers[:site].config["platforms"].clone
		pageSuiteNames = page["platforms"]
		nonSlFolders = context.registers[:site].config["non-sl-folders"]
		result = String.new
		
		if (folderNames & ["libraries"]).any?
			unless pageSuiteNames.nil?
				splittedNames = pageSuiteNames.split(',')
				suiteNames = suiteNames.select {|suite| splittedNames.any? {|name| suite.downcase.include?(name)}}
			end
			
			if pageSuiteNames.nil? && (folderNames & nonSlFolders).any?
				suiteNames.reject!{|suite| suite.downcase.include?("silverlight")}
			end
		
			suiteNames.each_with_index do |suite, index|				
				if index != 0
					result += "<span class='separator'> | </span>"
				end
				result += "<span class='platform'>#{suite}</span>"
			end
			
			"<div class='platforms'>#{@text} #{result}</div>"
		end
    end
  end
end

