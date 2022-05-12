#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=16; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[0m\033[35m+- Управление вкладками --------------------- Tab management --------------------+\e[0m";
 TPUT 14 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 17 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  4 3; $e " Следующая вкладка                             \e[32m Next tab                     \e[0m";}
  M1(){ TPUT  5 3; $e " Предыдущая вкладка                            \e[32m Previous tab                 \e[0m";}
  M2(){ TPUT  6 3; $e " Новая вкладка                                 \e[32m New tab                      \e[0m";}
  M3(){ TPUT  7 3; $e " Закрыть вкладку                               \e[32m Close tab                    \e[0m";}
  M4(){ TPUT  8 3; $e " Закрыть окно ОС                               \e[32m Close OS window              \e[0m";}
  M5(){ TPUT  9 3; $e " Переместить вкладку вперед                    \e[32m Move tab forward             \e[0m";}
  M6(){ TPUT 10 3; $e " Переместить вкладку назад                     \e[32m Move tab backward            \e[0m";}
  M7(){ TPUT 11 3; $e " Установить заголовок вкладки                  \e[32m Set tab title                \e[0m";}
  M8(){ TPUT 12 3; $e " Cоздавать ярлыки для перехода к вкладкам      \e[32m map ctrl+alt                 \e[0m";}
  M9(){ TPUT 13 3; $e " передать имя произвольной команды для запуска \e[32m map ctrl+t                   \e[0m";}
#
 M10(){ TPUT 15 3; $e " \e[90mExit                                                                        \e[0m";}
LM=10
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+right next_tab\e[0m
\e[32m map shift+cmd+]     next_tab\e[0m
\e[32m map ctrl+tab        next_tab\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+left previous_tab\e[0m
\e[32m map shift+cmd+[    previous_tab\e[0m
\e[32m map ctrl+shift+tab previous_tab\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+t new_tab\e[0m
\e[32m map cmd+t       new_tab\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+q close_tab\e[0m
\e[32m map cmd+w       close_tab\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map shift+cmd+w close_os_window\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+. move_tab_forward\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+, move_tab_backward\e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+alt+t set_tab_title\e[0m
\e[32m map shift+cmd+i     set_tab_title\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Вы также можете создавать ярлыки для перехода к определенным вкладкам,
 где 1 — первая вкладка,
 2 — вторая вкладка
 -1 — предыдущая активная вкладка.
 вкладка, и любое число больше, чем последняя вкладка, является последней вкладкой:
\e[32m map ctrl+alt+1 goto_tab 1\e[0m
\e[32m map ctrl+alt+2 goto_tab 2\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Как и в случае с new_window выше, вы также можете передать имя произвольной
 команды для запуска при использовании new_tab и использовать new_tab_with_cwd
 Наконец, если вы хотите, чтобы новая вкладка открывалась рядом с текущей,
 а не в конце списка вкладок, используйте:
\e[32m  map ctrl+t new_tab !neighbor [optional cmd to run]\e[0m
";ES;fi;;
#
 10) S=M10;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
