require File.join(SC::LIBPATH, 'sproutcore', 'helpers')
require File.join(SC::LIBPATH, 'sproutcore', 'deprecated')

module SC

  # Builds an HTML files.  This will setup an HtmlContext and then invokes
  # the render engines for each source before finally rendering the layout.
  class Builder::Html < Builder
    
    include SC::Helpers::TagHelper
    include SC::Helpers::TextHelper
    include SC::Helpers::CaptureHelper
    include SC::Helpers::StaticHelper
    include SC::Helpers::DomIdHelper
    include SC::ViewHelpers
    
    # the entry we are building
    attr_reader :entry
    
    # bundle is an alias for target included for backwards compatibility
    attr_reader :target, :bundle
    
    # the full set of entries we plan to build
    attr_reader :entries
    
    # the final filename
    attr_reader :filename
    
    # the current builder language
    attr_reader :language
    
    # library is an alias for project for backwards compatibility
    attr_reader :project, :library
    
    # the current render
    attr_reader :renderer
    
    def initialize(entry)
      super(entry)
      @target = @bundle = entry.manifest.target
      @filename = entry.filename
      @language = @entry.manifest.language
      @project = @library = @target.project
      @renderer = nil
      
      # find all entries -- use source_Entries + required if needed
      @entries = entry.source_entries.dup
      if entry.include_required_targets?
        sources = @target
      end
    end
    
    def build(dst_path)
      ### TODO
      lines = readlines(entry.source_path).map { |l| rewrite_inline_code(l) }
      writelines dst_path, lines
    end
    
  end
  
end