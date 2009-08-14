class SpreadheadFeaturesGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.directory File.join("features", "step_definitions")

      ["features/step_definitions/spreadhead_steps.rb",
       "features/step_definitions/factory_girl_steps.rb",
       "features/pages.feature"].each do |file|
        m.file file, file
       end
    end
  end

end
