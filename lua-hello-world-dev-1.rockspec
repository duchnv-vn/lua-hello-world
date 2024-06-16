package = "lua-hello-world"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/duchnv-vn/lua-hello-world.git"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["exercism.lua.cars-assemble.cars-assemble"] = "src\\exercism\\lua\\cars-assemble\\cars-assemble.lua",
      ["exercism.lua.cars-assemble.cars-assemble_spec"] = "src\\exercism\\lua\\cars-assemble\\cars-assemble_spec.lua",
      ["exercism.lua.eliuds-eggs.eliuds-eggs"] = "src\\exercism\\lua\\eliuds-eggs\\eliuds-eggs.lua",
      ["exercism.lua.eliuds-eggs.eliuds-eggs_spec"] = "src\\exercism\\lua\\eliuds-eggs\\eliuds-eggs_spec.lua",
      ["exercism.lua.lasagna.lasagna"] = "src\\exercism\\lua\\lasagna\\lasagna.lua",
      ["exercism.lua.lasagna.lasagna_spec"] = "src\\exercism\\lua\\lasagna\\lasagna_spec.lua",
      ["exercism.lua.pacman-rules.pacman-rules"] = "src\\exercism\\lua\\pacman-rules\\pacman-rules.lua",
      ["exercism.lua.pacman-rules.pacman-rules_spec"] = "src\\exercism\\lua\\pacman-rules\\pacman-rules_spec.lua",
      ["lua-programming.part-1.chapter-1.exercises"] = "src\\lua-programming\\part-1\\chapter-1\\exercises.lua",
      ["lua-programming.part-1.chapter-1.main"] = "src\\lua-programming\\part-1\\chapter-1\\main.lua",
      ["lua-programming.part-1.chapter-1.standalone-interpreter"] = "src\\lua-programming\\part-1\\chapter-1\\standalone-interpreter.lua",
      ["lua-programming.part-1.chapter-2.main"] = "src\\lua-programming\\part-1\\chapter-2\\main.lua",
      ["lua-programming.part-1.chapter-3.main"] = "src\\lua-programming\\part-1\\chapter-3\\main.lua"
   }
}
