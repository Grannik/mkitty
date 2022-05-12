#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=27; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[0m\033[35m+- Управление окнами ------------------------ Window management -----------------+\e[0m";
 TPUT 25 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 28 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  4 3; $e " Новое окно                               \e[32m New window                        \e[0m";}
  M1(){ TPUT  5 3; $e " Работает как new_window выше             \e[32m map kitty_mod+n map cmd+n         \e[0m";}
  M2(){ TPUT  6 3; $e " Закрыть окно                             \e[32m Close window                      \e[0m";}
  M3(){ TPUT  7 3; $e " Следующее окно                           \e[32m Next window                       \e[0m";}
  M4(){ TPUT  8 3; $e " Предыдущее окно                          \e[32m Previous window                   \e[0m";}
  M5(){ TPUT  9 3; $e " Переместить окно вперед                  \e[32m Move window forward               \e[0m";}
  M6(){ TPUT 10 3; $e " Переместить окно назад                   \e[32m Move window backward              \e[0m";}
  M7(){ TPUT 11 3; $e " Переместить окно вверх                   \e[32m Move window to top                \e[0m";}
  M8(){ TPUT 12 3; $e " Начать изменение размера окна            \e[32m Start resizing window             \e[0m";}
  M9(){ TPUT 13 3; $e " Первое окно                              \e[32m First window                      \e[0m";}
 M10(){ TPUT 14 3; $e " второе окно                              \e[32m second window                     \e[0m";}
 M11(){ TPUT 15 3; $e " Третье окно                              \e[32m Third window                      \e[0m";}
 M12(){ TPUT 16 3; $e " Четвертое окно                           \e[32m Fourth window                     \e[0m";}
 M13(){ TPUT 17 3; $e " Пятое окно                               \e[32m Fifth window                      \e[0m";}
 M14(){ TPUT 18 3; $e " Шестое окно                              \e[32m Sixth window                      \e[0m";}
 M15(){ TPUT 19 3; $e " Седьмое окно                             \e[32m Seventh window                    \e[0m";}
 M16(){ TPUT 20 3; $e " Восьмое окно                             \e[32m Eight window                      \e[0m";}
 M17(){ TPUT 21 3; $e " Девятое окно                             \e[32m Ninth window                      \e[0m";}
 M18(){ TPUT 22 3; $e " Десятое окно                             \e[32m Tenth window                      \e[0m";}
 M19(){ TPUT 23 3; $e " Визуально выберите окно фокуса           \e[32m Visually select focus window      \e[0m";}
 M20(){ TPUT 24 3; $e " Визуально поменять окно на другое        \e[32m Visually swap window with another \e[0m";}
#
 M21(){ TPUT 26 3; $e " \e[90mExit                                                                        \e[0m";}
LM=21
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
\e[32m map kitty_mod+enter new_window\e[0m
\e[32m map cmd+enter       new_window\e[0m
 Вы можете открыть новое окно, запустив произвольную программу, например:
 map kitty_mod+y      launch mutt
 Вы можете открыть новое окно с текущим рабочим каталогом,
 установленным в рабочий каталог текущего окна, используя:
 map ctrl+alt+enter    launch --cwd=current
 Вы можете открыть новое окно, которому разрешено управлять kitty с помощью
 средства дистанционного управления kitty, поставив перед командной строкой
 префикс @. Любым программам, запущенным в этом окне,
 будет разрешено управлять kitty. Например:
 map ctrl+enter launch --allow-remote-control some_program
 Вы можете открыть новое окно рядом с текущим активным окном
 или в качестве первого окна с помощью:
 map ctrl+n launch --location=neighbor some_program
 map ctrl+f launch --location=first some_program
 Для получения более подробной информации см. запуск. Новое окно ОС.
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Работает как new_window выше, за исключением того, что открывает окно kitty ОС
 верхнего уровня. В частности, вы можете использовать new_os_window_with_cwd
 для открыть окно с текущим рабочим каталогом.
\e[32m map kitty_mod+n new_os_window\e[0m
\e[32m map cmd+n       new_os_window\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+w close_window\e[0m
\e[32m map shift+cmd+d close_window\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+] next_window\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+[ previous_window\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f move_window_forward\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+b move_window_backward\e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+\` move_window_to_top\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m map kitty_mod+r start_resizing_window\e[0m
\e[32m map cmd+r       start_resizing_window\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+1 first_window\e[0m
\e[32m map cmd+1       first_window\e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+2 second_window\e[0m
\e[32m map cmd+2       second_window\e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+3 third_window\e[0m
\e[32m map cmd+3       third_window\e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+4 fourth_window\e[0m\
\e[32m map cmd+4       fourth_window\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+5 fifth_window\e[0m
\e[32m map cmd+5       fifth_window\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+6 sixth_window\e[0m
\e[32m map cmd+6       sixth_window\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+7 seventh_window\e[0m
\e[32m map cmd+7       seventh_window\e[0m";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+8 eighth_window\e[0m
\e[32m map cmd+8       eighth_window\e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+9 ninth_window\e[0m
\e[32m map cmd+9       ninth_window\e[0m";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+0 tenth_window\e[0m";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f7 focus_visible_window\e[0m";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f8 swap_with_window\e[0m";ES;fi;;
#
 21) S=M21;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
