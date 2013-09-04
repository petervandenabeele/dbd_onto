module DbdOnto
  module MetaContext

    def resource_with_meta_context(options = {})
        Dbd::Resource.new(context_subject: meta_context.subject, subject: options[:subject])
    end

    def meta_context
      fixed_meta_context
    end

  private

    def fixed_meta_context
      graph = Dbd::Graph.new.from_CSV(fixed_meta_context_csv)
      subject = graph.subjects.single
      Dbd::Context.new(subject: subject) << graph
    end

    def fixed_meta_context_csv
<<EOS
"2013-09-03 20:54:42.473735776 UTC","d680b54c-5aad-44a7-9e9e-c8d7a7084275","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:visibility","public"
"2013-09-03 20:54:42.473775562 UTC","be5b97ec-d026-4a73-b8fb-a13995966ec0","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:encryption","clear"
"2013-09-03 20:54:42.473796239 UTC","1251e568-f7e6-44bf-b5b0-54c15cefe5d9","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:license","Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license."
"2013-09-03 20:54:42.473812175 UTC","c73715de-4cb3-4022-93c6-fb9ec95851be","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","dc:source","https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a151ded75/docs/rationale.md"
"2013-09-03 20:54:42.473828787 UTC","3aaa9125-6278-4a70-9a40-7f2baf32ad99","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","dc:creator","Peter Vandenabeele (@peter_v)"
"2013-09-03 20:54:42.473845509 UTC","9324e4bc-5922-463b-8fc6-521ca5585c22","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","dcterms:created","2013-08-09 21:45:00 UTC"
EOS
    end
  end
end
