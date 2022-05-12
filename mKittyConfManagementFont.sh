#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=13; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[35m+- Размеры шрифта --------------------------- Font sizes ------------------------+\e[0m";
 TPUT 4 3
  $E "\e[90mВы можете изменить размер шрифта для всех окон операционной системы kitty\e[0m";
 TPUT 5 3
  $E "\e[90mверхнего уровня одновременно или только для текущего.\e[0m";
 TPUT 11 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 14 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Увеличить размер шрифта                    \e[32m Increase font size              \e[0m";}
  M1(){ TPUT  7 3; $e " Уменьшить размер шрифта                    \e[32m Decrease font size              \e[0m";}
  M2(){ TPUT  8 3; $e " Сбросить размер шрифта                     \e[32m Reset font size                 \e[0m";}
  M3(){ TPUT  9 3; $e " Чтобы настроить ярлыки для определенных размеров шрифта                    \e[32m \e[0m";}
  M4(){ TPUT 10 3; $e " Чтобы настроить ярлыки для изменения размера шрифта только текущего окна ОС\e[32m \e[0m";}
#
  M5(){ TPUT 12 3; $e " \e[90mExit                                                                        \e[0m";}
LM=5
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+equal  change_font_size all +2.0\e[0m
\e[32m map kitty_mod+plus   change_font_size all +2.0\e[0m
\e[32m map kitty_mod+kp_add change_font_size all +2.0\e[0m
\e[32m map cmd+plus         change_font_size all +2.0\e[0m
\e[32m map cmd+equal        change_font_size all +2.0\e[0m
\e[32m map shift+cmd+equal  change_font_size all +2.0\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+minus       change_font_size all -2.0\e[0m
\e[32m map kitty_mod+kp_subtract change_font_size all -2.0\e[0m
\e[32m map cmd+minus             change_font_size all -2.0\e[0m
\e[32m map shift+cmd+minus       change_font_size all -2.0\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+backspace change_font_size all 0\e[0m
\e[32m map cmd+0               change_font_size all 0\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f6 change_font_size all 10.0\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f6 change_font_size current 10.0\e[0m";ES;fi;;
#
  5) S=M5;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
