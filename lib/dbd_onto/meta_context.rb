module DbdOnto
  module MetaContext

    def meta_context
      fixed_context(fixed_meta_context_csv)
    end

    def schema_context
      fixed_context(fixed_schema_context_csv)
    end

  private

    def fixed_context(csv_string)
      graph = Dbd::Graph.new.from_CSV(csv_string)
      subject = graph.context_subjects.single
      Dbd::Context.new(subject: subject) << graph
    end

    def fixed_meta_context_csv
<<EOS
"2013-09-03 20:54:42.473735776 UTC","d680b54c-5aad-44a7-9e9e-c8d7a7084275","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:visibility","s","public"
"2013-09-03 20:54:42.473775562 UTC","be5b97ec-d026-4a73-b8fb-a13995966ec0","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:encryption","s","clear"
"2013-09-03 20:54:42.473796239 UTC","1251e568-f7e6-44bf-b5b0-54c15cefe5d9","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:license","s","Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license."
"2013-09-03 20:54:42.473812175 UTC","c73715de-4cb3-4022-93c6-fb9ec95851be","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","dc:source","s","https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a151ded75/docs/rationale.md"
"2013-09-03 20:54:42.473828787 UTC","3aaa9125-6278-4a70-9a40-7f2baf32ad99","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","dc:creator","s","Peter Vandenabeele (@peter_v)"
"2013-09-03 20:54:42.473845509 UTC","9324e4bc-5922-463b-8fc6-521ca5585c22","","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","dcterms:created","s","2013-08-09 21:45:00 UTC"
EOS
    end

    def fixed_schema_context_csv
<<EOS
"2013-10-14 21:43:42.473735776 UTC","d780b54c-5aad-44a7-9e9e-c8d7a7084276","","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:visibility","s","public"
"2013-10-14 21:43:42.473775562 UTC","bf5b97ec-d026-4a73-b8fb-a13995966ec1","","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:encryption","s","clear"
"2013-10-14 21:43:42.473796239 UTC","1351e568-f7e6-44bf-b5b0-54c15cefe5e0","","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","context:license","s","Copyright the sponsors of Schema.org: Google, Inc., Yahoo, Inc., and Microsoft Corporation. Licensed under Creative Commons Attribution-ShareAlike License (version 3.0) (see http://schema.org/docs/terms.html)"
"2013-10-14 21:43:42.473812175 UTC","c83715de-4cb3-4022-93c6-fb9ec95851bf","","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","dc:source","s","http://schema.org"
"2013-10-14 21:43:42.473828787 UTC","3baa9125-6278-4a70-9a40-7f2baf32ae00","","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","dc:creator","s","Peter Vandenabeele (@peter_v)"
"2013-10-14 21:43:42.473845509 UTC","9424e4bc-5922-463b-8fc6-521ca5585c23","","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","dcterms:created","s","2013-10-15 21:56:00 UTC"
EOS
    end
  end
end
