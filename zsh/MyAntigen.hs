{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module MyAntigen where

import Antigen (AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
              -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy)

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "Tarrasch/zsh-command-not-found"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-autoenv"
  , bundle "Tarrasch/zsh-i-know"
  , bundle "Tarrasch/zsh-mcd"
  , bundle "arzzen/calc.plugin.zsh"
  -- , bundle "mafredri/zsh-async"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-completions"
  -- TODO: clear out unnecessary ones:
  , (bundle "robbyrussell/oh-my-zsh")
    { sourcingLocations = [
                          -- "plugins/colorize"
                          "plugins/extract"
                          -- , "plugins/git"
                          -- , "plugins/git-extras"
                          -- , "plugins/gitfast"
                          -- , "plugins/history"
                          -- , "plugins/lein"
                          -- , "plugins/node"
                          -- , "plugins/npm"
                          -- , "plugins/pip"
                          -- , "plugins/python"
                          -- , "plugins/sbt"
                          -- , "plugins/ssh-agent"
                          -- , "plugins/tmux"
                          -- , "plugins/vi-mode"
                          -- , "plugins/virtualenvwrapper"
                          -- , "plugins/wd"
                          ] }
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
