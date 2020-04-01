#!/bin/bash

link_spaces(){

  # mkdir -p spaces/ui/ spaces/ui/common

  # ln -s ../../.vscode spaces/ui/.vscode
  # ln -s ../../ui/src/ spaces/ui/src
  # ln -s ../../ui/test/ spaces/ui/test
  # ln -s ../../ui/shadow-cljs.edn spaces/ui/shadow-cljs.edn
  # ln -s ../../../common/src spaces/ui/common/src
  # ln -s ../../../common/test spaces/ui/common/test

  # mkdir -p  spaces/app/  spaces/app/common

  # ln -s ../../.vscode spaces/app/.vscode
  # ln -s ../../app/src/ spaces/app/src
  # ln -s ../../app/test/ spaces/app/test
  # ln -s ../../app/deps.edn spaces/app/deps.edn
  # ln -s ../../../common/src spaces/app/common/src
  # ln -s ../../../common/test spaces/app/common/test

  SPACE=clj
  mkdir -p  spaces/$SPACE/ spaces/$SPACE/starnet/ spaces/$SPACE/resources/public/

  ln -s ../../.vscode spaces/$SPACE/.vscode
  ln -s ../../../system/src/starnet/alpha spaces/$SPACE/starnet/alpha
  ln -s ../../system/test spaces/$SPACE/test
  ln -s ../../../../ui/resources/public/css spaces/$SPACE/resources/public/css
  ln -s ../../app/deps.edn spaces/$SPACE/deps.edn

  SPACE=cljs
  mkdir -p  spaces/$SPACE/ spaces/$SPACE/starnet/ spaces/$SPACE/resources/public/

  ln -s ../../.vscode spaces/$SPACE/.vscode
  ln -s ../../../system/src/starnet/alpha spaces/$SPACE/starnet/alpha
  ln -s ../../system/test spaces/$SPACE/test
  ln -s ../../../../ui/resources/public/css spaces/$SPACE/resources/public/css
  ln -s ../../ui/shadow-cljs.edn spaces/$SPACE/shadow-cljs.edn

}

remove_volumes(){
  docker volume rm starnet.kafka
  docker volume rm starnet.crux
}

origins(){
  git remote add bb https://bitbucket.org/accompanyinggames/starnet
  git remote add gl https://gitlab.com/accompanyinggames/starnet.git
  git remote -v
}

push(){
  git push origin master
  git push bb master
  git push gl master
}

"$@"