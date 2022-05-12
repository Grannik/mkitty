#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=16; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[0m\033[35m+- Прокрутка -------------------------------- Scrolling -------------------------+\e[0m";
 TPUT 14 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 17 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  4 3; $e " Прокрутить строку вверх                     \e[32m Scroll line up                 \e[0m";}
  M1(){ TPUT  5 3; $e " Прокрутить строку вниз                      \e[32m Scroll line down               \e[0m";}
  M2(){ TPUT  6 3; $e " Прокрутить страницу вверх                   \e[32m Scroll page up                 \e[0m";}
  M3(){ TPUT  7 3; $e " Прокрутить страницу вниз                    \e[32m Scroll page down               \e[0m";}
  M4(){ TPUT  8 3; $e " Пролистать наверх                           \e[32m Scroll to top                  \e[0m";}
  M5(){ TPUT  9 3; $e " Прокрутите вниз                             \e[32m Scroll to bottom               \e[0m";}
  M6(){ TPUT 10 3; $e " Прокрутите до предыдущей подсказки оболочки \e[32m Scroll to previous shell prompt\e[0m";}
  M7(){ TPUT 11 3; $e " Прокрутите до следующего приглашения оболочки  \e[32m Scroll to next shell prompt \e[0m";}
  M8(){ TPUT 12 3; $e " Просмотр буфера прокрутки в пейджере     \e[32m Browse scrollback buffer in pager \e[0m";}
  M9(){ TPUT 13 3; $e " Просмотр последней команды в пейджере   \e[32m Browse output of the last in pager \e[0m";}
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+up    scroll_line_up\e[0m
\e[32m map kitty_mod+k     scroll_line_up\e[0m
\e[32m map opt+cmd+page_up scroll_line_up\e[0m
\e[32m map cmd+up          scroll_line_up\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+down    scroll_line_down\e[0m
\e[32m map kitty_mod+j       scroll_line_down\e[0m
\e[32m map opt+cmd+page_down scroll_line_down\e[0m
\e[32m map cmd+down          scroll_line_down\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+page_up scroll_page_up\e[0m
\e[32m map cmd+page_up       scroll_page_up\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+page_down scroll_page_down\e[0m
\e[32m map cmd+page_down       scroll_page_down\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+home scroll_home\e[0m
\e[32m map cmd+home       scroll_home\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+end scroll_end\e[0m
\e[32m map cmd+end       scroll_end\e[0m
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+z scroll_to_prompt -1\e[0m
 Используйте нулевой параметр для scroll_to_prompt, чтобы прокрутить до последней
 позиции перехода или последней позиции щелчка. Требует работы.
 https://sw.kovidgoyal.net/kitty/shell-integration/
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+x scroll_to_prompt 1\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+h show_scrollback\e[0m
 Вы можете передать содержимое текущего экрана и буфера истории как STDIN в про-
 извольную программу, используя функцию запуска.
 Например, код открывает буфер обратной прокрутки в меньшем окне наложения:
 map f1 launch --stdin-source=@screen_scrollback --stdin-add-formatting --type=overlay less +G -R
 Дополнительные сведения о передаче содержимого экрана
 и буфера во внешние программы см. в разделе launch.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Просмотр вывода последней команды оболочки в пейджере
\e[32m map kitty_mod+g show_last_command_output\e[0m
 Вы также можете определить дополнительные ярлыки для получения вывода команды.
 Например, чтобы получить вывод первой команды на экран функция запуска:
 map f1 show_first_command_output_on_screen
 Например, следующее открывает вывод в меньшем размере в окне наложения:
 map f1 launch --stdin-source=@last_cmd_output --stdin-add-formatting --type=overlay less +G -R
 Чтобы получить вывод первой команды на экране,
 используйте @first_cmd_output_on_screen.
 Чтобы получить результат последнего прыжка для команды
 используйте @last_visited_cmd_output
 Требуется работа:
  https://sw.kovidgoyal.net/kitty/shell-integration/
";ES;fi;;
#
 10) S=M10;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
