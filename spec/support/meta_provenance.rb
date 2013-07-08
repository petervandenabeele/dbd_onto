module Spec
  module Provenance

    def check_provenance?(provenance_resource)
      provenance_resource.detect {|p| p.predicate == 'prov:context' && p.object == 'public'} &&
      provenance_resource.detect {|p| p.predicate == 'prov:encryption' && p.object == 'clear'} &&
      provenance_resource.detect {|p| p.predicate == 'prov:source'} &&
      provenance_resource.detect {|p| p.predicate == 'dcterms:creator'} &&
      provenance_resource.detect {|p| p.predicate == 'dcterms:created'} &&
      provenance_resource.detect {|p| p.predicate == 'prov:license'}
    end

  end
end
