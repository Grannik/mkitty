#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=11; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[35m+- Буфер обмена ----------------------------- Clipboard -------------------------+\033[0m";
 TPUT 4 3
        $E "\e[0m\033[90mСкопировать в буфер обмена\e[0m";
 TPUT 9 1
        $E "\033[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 12 1
        $E "$c";UNMARK;}
#
  M0(){ TPUT  5 3; $e " Действие copy_or_interrupt         \e[32m map kitty_mod+c copy_to_clipboard        \e[0m";}
  M1(){ TPUT  6 3; $e " Вставить из буфера обмена          \e[32m map kitty_mod+v paste_from_clipboard     \e[0m";}
  M2(){ TPUT  7 3; $e " Вставить из выделения              \e[32m map kitty_mod+c kitty_mod+v              \e[0m";}
  M3(){ TPUT  8 3; $e " Передать выбор в программу         \e[32m map kitty_mod+o pass_selection_to_program\e[0m";}
#
  M4(){ TPUT 10 3; $e " \e[90mExit                                                                        \e[0m";}
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Существует также действие copy_or_interrupt, которое можно дополнительно сопоста-
 вить с Ctrl+c. Он будет копировать только в том случае, если есть выбор, и посы-
 лает прерывание в противном случае.
 Точно так же copy_and_clear_or_interrupt скопирует и очистит выбор или отправит
 прерывание, если выбора нет.
\e[32m map kitty_mod+c copy_to_clipboard\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Вставить из буфера обмена
\e[32m map kitty_mod+v paste_from_clipboard\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Вставить из выделения
\e[32m map kitty_mod+c copy_to_clipboard\e[0m
\e[32m map kitty_mod+v paste_from_clipboard\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Передать выбор в программу
\e[32m map kitty_mod+o pass_selection_to_program\e[0m
 Вы также можете передать содержимое текущего выделения любой программе,
 используя pass_selection_to_program.
 По умолчанию используется системная открытая программа, но вы можете указать
 свою, выбор будет передан в качестве аргумента командной строки программе,
 например:
 map kitty_mod+o pass_selection_to_program firefox
 Вы можете передать текущий выбор терминальной программе,
 работающей в новом окне kitty, используя заполнитель @selection:
 map kitty_mod+y new_window less @selection
";ES;fi;;
#
  4) S=M4;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
