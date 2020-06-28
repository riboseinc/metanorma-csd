require_relative "base_convert"
require_relative "init"
require "isodoc"

module IsoDoc
  module CC
    # A {Converter} implementation that generates CSD output, and a document
    # schema encapsulation of the document for validation
    class WordConvert < IsoDoc::WordConvert
      def initialize(options)
        @libdir = File.dirname(__FILE__)
        super
      end

      def default_fonts(options)
        {
          bodyfont: (options[:script] == "Hans" ? '"SimSun",serif' : '"Source Sans Pro","Arial",sans-serif'),
          headerfont: (options[:script] == "Hans" ? '"SimHei",sans-serif' : '"Source Sans Pro","Arial",sans-serif'),
          monospacefont: '"Source Code Pro","Courier New",monospace'
        }
      end

      def default_file_locations(options)
        {
          wordstylesheet: html_doc_path("wordstyle.scss"),
          standardstylesheet: html_doc_path("cc.scss"),
          header: html_doc_path("header.html"),
          wordcoverpage: html_doc_path("word_cc_titlepage.html"),
          wordintropage: html_doc_path("word_cc_intro.html"),
          ulstyle: "l3",
          olstyle: "l2",
        }
      end

      include BaseConvert
      include Init
    end
  end
end

