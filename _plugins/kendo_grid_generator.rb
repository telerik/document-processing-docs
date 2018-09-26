module Reading
  class KendoGridGeneraotr < Jekyll::Generator
		def generate(site)	
			@site = site
			site.pages.each do |p|			
				createKendoGridSection(p, p.content)
			end
		end
	
		def createKendoGridSection(page, content)
			kendoGridKey = /``kendogrid/
			wpfIndex = content.index(kendoGridKey)
			
			htmlWPF = "<script type='text/x-kendo-template' id='template'>
					<div id='innerDiv'><div class='detailsDIV'></div><div class='readmeDiv' style='display:inline-block;'></div></div>
				</script><script type='text/x-kendo-template' id='toolBarTemplate'><div class='toolbar'><label class='category-label' for='category'>Search Examples by Keywords:</label><input type='text' id='searchBox' onInput='onUserInput()'/></div></script><div><div class='kendoDiv' id='kendoDiv' style='float:left;'></div>
				<h4 id='heading'></h4><pre><code id='codeBlock'></code></pre></div>"
			
			if (wpfIndex)
				content[wpfIndex..wpfIndex + 11] = htmlWPF
			end	
			
		end
		
		def encode_liquid(content)
		  content = content.gsub("{{", "{{ '{{' }}")
		end
	end
end