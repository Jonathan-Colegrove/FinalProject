# Code to parse the words.htm file into json data we can use here
#
# Oga.parse_html(File.read("words.htm")).css(".mw-content-ltr li").map { |li| [li.css("a").map(&:text), li.inner_text.split("-").last.strip].flatten }.to_json; nil

json = JSON.parse(File.read(Rails.root.join("db/seeds/words.json")))
json.each do |traditional, simplified, pinyin, definition|
  Term.find_or_create_by(english: definition).
       update_attributes(chinese_simplified: simplified,
                         chinese_traditional: traditional,
                         pinyin: pinyin)
end
