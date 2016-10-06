class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def reading
    @terms = Term.all
    @article = %{<p>Taiwan (historically known as Formosa, from Portuguese: Ilha Formosa, "Beautiful Island", Portuguese pronunciation: [ˌiʎɐ fuɾˈmɔzɐ]) is an island in East Asia; located some 180 kilometres (112 miles) off the southeastern coast of mainland China across the Taiwan Strait. It has an area of 35,883 km2 (13,855 sq mi) and spans the Tropic of Cancer. The East China Sea lies to the north, the Philippine Sea to the east, the Luzon Strait directly to the south and the South China Sea to the southwest. Taiwan proper makes up 99% of the territory of the Free Area controlled by the Republic of China since the ROC lost its mainland China territory in the Chinese Civil War and fled to the island in 1949; this area itself is commonly referred to as simply "Taiwan".</p>

    <p>Taiwan is a tilted fault block, characterized by the contrast between the eastern two-thirds, consisting mostly of five rugged mountain ranges parallel to the east coast, and the flat to gently rolling plains of the western third, where most of Taiwan's population reside. There are several peaks over 3,500 m, the highest being Yu Shan at 3,952 metres (12,966 ft), making Taiwan the world's fourth-highest island. The tectonic boundary that formed these ranges is still active, and the island experiences many earthquakes, a few of them highly destructive. There are also many active submarine volcanoes in the Taiwan Straits.</p>


    <p>The climate ranges from tropical in the south to subtropical in the north, and is governed by the East Asian Monsoon. The island is struck by an average of four typhoons in each year. The eastern mountains are heavily forested and home to a diverse range of wildlife, while land use in the western and northern lowlands is intensive.</p>}

    @terms.each do |term|
      @article.gsub!(term.english) { "<span class='chinese'>#{term.chinese_traditional}</span>" }
    end
  end

  def grammar
  end

  def phrases
  end

  def resources
  end
end
