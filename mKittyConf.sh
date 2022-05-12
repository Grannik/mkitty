#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=30; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 4
        $E "\e[90mКонфигурации                              \e[36mConfigurations\e[0m";
 TPUT 4 1
        $E "\033[0m\033[35m+--- conf  ----------------------------------------------------------------------+\033[0m";
 TPUT 28 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
 FOOT(){ MARK;TPUT 31 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  5 3; $e " Cоздать файл конфигурации                 \e[32mkitty.conf                        \e[0m";}
  M1(){ TPUT  6 3; $e " Редактировать файл конфигурации           \e[32mkitty.conf                        \e[0m";}
  M2(){ TPUT  7 3; $e " Зайти в директорию                        \e[32mkitty                             \e[0m";}
  M3(){ TPUT  8 3; $e "\e[90m Настройка мыши                           \e[36m Mouse customization               \e[0m";}
  M4(){ TPUT  9 3; $e "\e[90m Настройка шрифта                         \e[36m Font customization                \e[0m";}
  M5(){ TPUT 10 3; $e "\e[90m Настройка производительности             \e[36m Performance tuning                \e[0m";}
  M6(){ TPUT 11 3; $e "\e[90m Терминальный звонок                      \e[36m Terminal bell                     \e[0m";}
  M7(){ TPUT 12 3; $e "\e[90m Настройка прокрутки                      \e[36m Scroll customization              \e[0m";}
  M8(){ TPUT 13 3; $e "\e[90m Настройка курсора                        \e[36m Cursor customization              \e[0m";}
  M9(){ TPUT 14 3; $e "\e[90m Макет окна                               \e[36m Window layout                     \e[0m";}
 M10(){ TPUT 15 3; $e "\e[90m Панель вкладок                           \e[36m Tab bar                           \e[0m";}
 M11(){ TPUT 16 3; $e "\e[90m Цвета переднего плана и фона             \e[36m Foreground and background colors  \e[0m";}
 M12(){ TPUT 17 3; $e "\e[90m Передовой                                \e[36m Advanced                          \e[0m";}
 M13(){ TPUT 18 3; $e "\e[90m Специальные настройки ОС                 \e[36m OS specific tweaks                \e[0m";}
 M14(){ TPUT 19 3; $e "\e[90m Горячие клавиши                          \e[36m Keyboard shortcuts                \e[0m";}
 M15(){ TPUT 20 3; $e "\e[90m Буфер обмена                             \e[36m Clipboard                         \e[0m";}
 M16(){ TPUT 21 3; $e "\e[90m Прокрутка                                \e[36m Scrolling                         \e[0m";}
 M17(){ TPUT 22 3; $e "\e[90m Управление окнами                        \e[36m Window management                 \e[0m";}
 M18(){ TPUT 23 3; $e "\e[90m Управление вкладками                     \e[36m Tab management                    \e[0m";}
 M19(){ TPUT 24 3; $e "\e[90m Размеры шрифта                           \e[36m Font sizes                        \e[0m";}
 M20(){ TPUT 25 3; $e "\e[90m Управление макетом                       \e[36m Layout management                 \e[0m";}
 M21(){ TPUT 26 3; $e "\e[90m Выбор и действие с видимым текстом       \e[36m Select and act on visible text    \e[0m";}
 M22(){ TPUT 27 3; $e "\e[90m Разное                                   \e[36m Miscellaneous                     \e[0m";}
#
 M23(){ TPUT 29 3; $e " \e[90mExit                                                                        \e[0m";}
LM=23
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
  0) S=M0;SC;if [[ $cur == enter ]];then R;echo -e "
 Чтобы создать файл конфигурации, используйте следующие команды:
\e[32m mkdir -p ~/.config/kitty/\e[0m
\e[32m touch ~/.config/kitty/kitty.conf\e[0m";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo -e "
 Открыть файл конфигурации:
\e[32m nano -w ~/.config/kitty/kitty.conf\e[0m";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m cd .config/kitty/;clear;ls -l\e[0m";ES;fi;;
  3) S=M3;SC;if [[ $cur == enter ]];then R;./mKittyConfMouse.sh;ES;fi;;
  4) S=M4;SC;if [[ $cur == enter ]];then R;./mKittyConfFont.sh;ES;fi;;
  5) S=M5;SC;if [[ $cur == enter ]];then R;./mKittyConfPerformance.sh;ES;fi;;
  6) S=M6;SC;if [[ $cur == enter ]];then R;./mKittyConfBell.sh;ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;./mKittyConfScroll.sh;ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;./mKittyConfCursor.sh;ES;fi;;
  9) S=M9;SC;if [[ $cur == enter ]];then R;./mKittyConfWindow.sh;ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;./mKittyConfTabBar.sh;ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;./mKittyConfColors.sh;ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;./mKittyConfAdvanced.sh;ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;./mKittyConfTweaks.sh;ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;./mKittyConfShortcuts.sh;ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;./mKittyConfClipboard.sh;ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;./mKittyConfScrolling.sh;ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;./mKittyConfManagementWindow.sh;ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;./mKittyConfManagementTab.sh;ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;./mKittyConfManagementFont.sh;ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;./mKittyConfManagementLayout.sh;ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;./mKittyConfManagemenSelect.sh;ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;./mKittyConfManagemenMiscel.sh;ES;fi;;
#
 23) S=M23;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
