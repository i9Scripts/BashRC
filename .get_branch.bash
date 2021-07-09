function  be_get_branch {
  dir local = " $ PWD "
  vcs local
  nick local
  enquanto [[ " $ dir "  ! =  " / " ]] ;  Faz
    para  vcs  em git hg svn bzr ;  Faz
      if [[ -d  " $ dir /. $ vcs " ]] &&  hash  " $ vcs "  & > / dev / null ;  então
        caso  " $ vcs "  em
          git) __git_ps1 " $ {1 : - ( % s)} " ;  return ;;
          hg) nick = $ ( hg branch 2> / dev / null ) ;;
          svn) nick = $ ( svn info 2> / dev / null \
                | grep -e ' ^ Raiz do Repositório: ' \
                | sed -e ' s #. * / ## ' ) ;;
          bzr)
            local conf = " $ {dir} /.bzr/branch/branch.conf "  # filial normal
            [[ -f  " $ conf " ]] && nick = $ ( grep -E ' ^ nickname = '  " $ conf "  | cut -d '  ' -f 3 )
            conf = " $ {dir} /.bzr/branch/location "  # colo / lightweight branch
            [[ -z  " $ nick " ]] && [[ -f  " $ conf " ]] && nick = " $ ( basename " $ ( <  $ conf ) " ) "
            [[ -z  " $ nick " ]] && nick = " $ ( basename " $ ( readlink -f " $ dir " ) " ) " ;;
        esac
        [[ -n  " $ nick " ]] &&  printf  " $ {1 : - ( % s)} "  " $ nick "
        retorno 0
      fi
    feito
    dir = " $ ( dirname " $ dir " ) "
  feito
}

# # Adicionar branch ao PS1 (baseado em $ PS1 ou $ 1), formatado como $ 2
exportar GIT_PS1_SHOWDIRTYSTATE = sim
export PS1 = " \ $ (be_get_branch " $ 2 " ) $ {PS1} " ;

# Mais rápido (1ms vs 5ms) do que / usr / bin / dirname
function  dirname () {
  dir local = " $ {1 % $ {1 ## * / } } "
  " $ {dir : = . / } "  ! = " / "  && dir = " $ {dir % ?} "
  echo  " $ dir "
}