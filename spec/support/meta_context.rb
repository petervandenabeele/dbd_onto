module Spec
  module Context

    def check_context?(meta_context)
      meta_context.detect {|p| p.predicate == 'context:visibility' && p.object == 'public'} &&
      meta_context.detect {|p| p.predicate == 'context:encryption' && p.object == 'clear'} &&
      meta_context.detect {|p| p.predicate == 'context:license'} &&
      meta_context.detect {|p| p.predicate == 'dc:source'} &&
      meta_context.detect {|p| p.predicate == 'dc:creator' && p.object == 'Peter Vandenabeele (@peter_v)'} &&
      meta_context.detect {|p| p.predicate == 'dcterms:created'}
    end

    def check_schema_context?(meta_context)
      meta_context.detect {|p| p.predicate == 'context:visibility' && p.object == 'public'} &&
      meta_context.detect {|p| p.predicate == 'context:encryption' && p.object == 'clear'} &&
      meta_context.detect {|p| p.predicate == 'context:license'} &&
      meta_context.detect {|p| p.predicate == 'dc:source' && p.object == 'http://schema.org'} &&
      meta_context.detect {|p| p.predicate == 'dc:creator' && p.object == 'Peter Vandenabeele (@peter_v)'} &&
      meta_context.detect {|p| p.predicate == 'dcterms:created'}
    end

    def check_rdf_context?(meta_context)
      meta_context.detect {|p| p.predicate == 'context:visibility' && p.object == 'public'} &&
      meta_context.detect {|p| p.predicate == 'context:encryption' && p.object == 'clear'} &&
      meta_context.detect {|p| p.predicate == 'context:license'} &&
      meta_context.detect {|p| p.predicate == 'dc:source' && p.object == 'http://www.w3.org/TR/rdf-schema/'} &&
      meta_context.detect {|p| p.predicate == 'dc:creator' && p.object == 'Peter Vandenabeele (@peter_v)'} &&
      meta_context.detect {|p| p.predicate == 'dcterms:created'}
    end

  end
end
