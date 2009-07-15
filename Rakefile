require "rake"
require "fileutils"
require "rubygems"

# special translations that google screws up
# can include poorly converted words (ar -> air, should be years)
$extra_translations = {
  'Prinsessrum' => 'Princess room',
  'Fotovagg' => 'Photo wall',
  '3 air' => '3 years'
}

desc "Translate the se html files into en"
task :translate do
  tranlation_path = 'en-gen'
  FileUtils.rm_rf(tranlation_path)
  Dir['**/*.html'].each do |html|
    name        = File.basename(html).match(/^(.*)\.html/)[1]
    path        = File.dirname(html)
    output_name = translate_underscored_name(name)
    output_path = translate_underscored_path(path)
    output_file = File.join(tranlation_path, output_path, "#{output_name}.html")
    FileUtils.mkdir_p(File.dirname(output_file))
    File.open(output_file, "w") do |file|
      # TODO translate html
      file << File.read(html)
    end
  end
end

def translate_underscored_name(name)
  terms = name.gsub('_', ' ')
  # 1. put terms into Google Translate
  @translator = Google::Translator.new
  translated = @translator.translate(:se, :en, terms)
  # p [terms, translated]
  # 2. manual translation
  $extra_translations.each do |se, en|
    translated.gsub!(se, en)
  end
  translated.gsub(' ', '_')
end

def translate_underscored_path(path)
  path.split('/').inject([]) { |portions, name| portions << translate_underscored_name(name); portions }.join('/')
end



begin
  require "google_translate"
rescue LoadError => e
  puts <<-EOS.gsub(/^  /, '')

  To perform translations you need to run the following command:
  
    sudo gem update --system
    sudo gem sources -a http://gems.github.com
    sudo gem install shvets-google_translate

  EOS
  exit 1
end

