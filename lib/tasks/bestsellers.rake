desc 'Scrapping bestsellers'
task :bestsellers => :environment do
	require 'nokogiri'
	require 'open-uri'

	url = "http://www.falabella.com/falabella-cl"
	doc = Nokogiri::HTML(open(url))
	bss = doc.css("#contenedorTabDosHPM")

	bss.css(".productoDestacadoHM").each do |product|
		p = Product.new
		p.name = product.at_css(".detalle a").text
		p.price = product.at_css(".precio1").text.delete('$.').to_i
		p.url = product.at_css(".detalle a")[:href]
		p.save
	end
end