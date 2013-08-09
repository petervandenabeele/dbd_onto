module Spec
  module Context

    def check_context?(context_resource)
      context_resource.detect {|p| p.predicate == 'context:visibility' && p.object == 'public'} &&
      context_resource.detect {|p| p.predicate == 'context:encryption' && p.object == 'clear'} &&
      context_resource.detect {|p| p.predicate == 'context:license'} &&
      context_resource.detect {|p| p.predicate == 'dc:source'} &&
      context_resource.detect {|p| p.predicate == 'dc:creator'} &&
      context_resource.detect {|p| p.predicate == 'dcterms:created'}
    end

  end
end
