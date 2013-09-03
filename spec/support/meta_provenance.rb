module Spec
  module Context

    def check_context?(meta_context)
      meta_context.detect {|p| p.predicate == 'context:visibility' && p.object == 'public'} &&
      meta_context.detect {|p| p.predicate == 'context:encryption' && p.object == 'clear'} &&
      meta_context.detect {|p| p.predicate == 'context:license'} &&
      meta_context.detect {|p| p.predicate == 'dc:source'} &&
      meta_context.detect {|p| p.predicate == 'dc:creator'} &&
      meta_context.detect {|p| p.predicate == 'dcterms:created'}
    end

  end
end
