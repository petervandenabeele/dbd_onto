module DbdOnto
  module MetaContext

    def resource_with_meta_context
        Dbd::Resource.new(context_subject: meta_context.subject)
    end

    def meta_context
      # memoize to avoid making new_context on each call
      @context_resource ||= new_context_resource
    end

  private

    def new_context_resource
      Dbd::Context.new.tap do |_context|
        context_attributes.each do |context_fact_data|
          _context << context_fact(context_fact_data)
        end
      end
    end

    def context_fact(context_fact_data)
      Dbd::ContextFact.new(
        predicate: context_fact_data.first,
        object: context_fact_data.last)
    end

    def context_attributes
      [
       #[predicate, object]
        ['context:visibility', 'public'],
        ['context:encryption', 'clear'],
        ['context:license', 'Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license.'],
        ['dc:source' , 'https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a151ded75/docs/rationale.md'],
        ['dc:creator' , 'Peter Vandenabeele (@peter_v)'],
        ['dcterms:created', Time.new(2013,8,9,23,45,0,'+02:00').utc]
      ]
    end

  end
end
