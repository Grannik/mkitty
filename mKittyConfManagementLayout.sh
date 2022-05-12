#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=11; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[0m\033[35m+- Управление макетом -------------------------------- Layout management --------+\e[0m";
 TPUT 8 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 11 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  4 3; $e " Следующий макет                                    \e[32m Next layout             \e[0m";}
  M1(){ TPUT  5 3; $e " Cоздать ярлыки переключения на определенные макеты \e[32m map ctrl+alt            \e[0m";}
  M2(){ TPUT  6 3; $e " Точно так же, чтобы вернуться к предыдущему макету \e[32m map ctrl+alt+p          \e[0m";}
  M3(){ TPUT  7 3; $e " функция переключения макета, на макет              \e[32m map ctrl+alt+z          \e[0m";}
#
  M4(){ TPUT  9 3; $e " \e[90mExit                                                                        \e[0m";}
LM=4
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+l next_layout\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Вы также можете создавать ярлыки для переключения на определенные макеты:
\e[32m map ctrl+alt+t goto_layout tall\e[0m
\e[32m map ctrl+alt+s goto_layout stack\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map ctrl+alt+p last_used_layout\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Существует также функция переключения макета, которая переключается на именован-
 ный макет или обратно к предыдущему макету, если он находится в именованном ма-
кете. Полезно временно «увеличить» активное окно, переключившись на макет стека:
\e[32m map ctrl+alt+z toggle_layout stack\e[0m
";ES;fi;;
#
 4) S=M4;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
