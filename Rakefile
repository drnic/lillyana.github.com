require "rake"
require "fileutils"

# special translations that google screws up
$extra_translations = {
  'Prinsessrum' => 'Princess room',
  'Fotovagg' => 'Photo wall',
  'Min blogg' => 'My blog',
  'rum' => 'place',
  'Projekt' => 'Projects'
}

desc "Translate the se html files into en"
task :translate do
  tranlation_path = 'en-gen'
  Dir['**/*.html'].each do |html|
    name        = File.basename(html).match(/^(.*)\.html/)[1]
    path        = File.dirname(html)
    output_name = translate_underscored_name(name)
    output_path = translate_underscored_path(path)
    output_file = File.join(tranlation_path, output_path, "#{output_name}.html")
    FileUtils.mkdir_p(File.dirname(output_file))
    `touch #{output_file}`
  end
end

def translate_underscored_name(name)
  terms = name.gsub('_', ' ')
  # 1. put terms into Google Translate
  # 2. manual translation
  $extra_translations.each do |se, en|
    terms.gsub!(se, en)
  end
  terms.gsub(' ', '_')
end

def translate_underscored_path(path)
  path.split('/').inject([]) { |portions, name| portions << translate_underscored_name(name); portions }.join('/')
end

