require "stein/version"

module Stein
  Patches = []

  def Stein.mode *args, &block
    Stein::Patches << proc { mode *args, &block }
  end

  def Stein.extend main, modes_dir
    Dir["#{modes_dir}/*.rb"].each do |mode|
      load mode
    end
    Stein::Patches.each {|patch| main.module_eval &patch}
  end
end
