#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=13; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT  3 1
        $E "\033[0m\033[35m+- Терминальный звонок ---------------------- Terminal bell ---------------------+\033[0m";
 TPUT 11 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 14 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  4 3; $e " Включить/выключить звуковой сигнал         \e[32menable_audio_bell                \033[0m";}
  M1(){ TPUT  5 3; $e " Продолжительность визуального звонка       \e[32mvisual_bell_duration             \033[0m";}
  M2(){ TPUT  6 3; $e " Цвет, используемый визуальным звонком      \e[32mvisual_bell_color                \033[0m";}
  M3(){ TPUT  7 3; $e " Просьба у окна обратить внимание на звонок \e[32mwindow_alert_on_bell             \033[0m";}
  M4(){ TPUT  8 3; $e " Некоторый текст или символ Юникода         \e[32mbell_on_tab                      \033[0m";}
  M5(){ TPUT  9 3; $e " Программа для запуска при звонке           \e[32mcommand_on_bell none             \033[0m";}
  M6(){ TPUT 10 3; $e " Путь к звуковому файлу                     \e[32mbell_path none                   \033[0m";}
#
  M7(){ TPUT 12 3; $e " \e[90mExit                                                                        \033[0m";}
LM=7
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e " Включить/выключить звуковой сигнал. Полезно в средах, требующих тишины.
\e[32m enable_audio_bell yes\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e " Продолжительность визуального звонка.
 Мигание экрана при звонке в течение указанного количества секунд.
 Установите на ноль, чтобы отключить.
\e[32m visual_bell_duration 0.0\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e " Цвет, используемый визуальным звонком.
 Установите значение none, чтобы вернуться к выбранному цвету фона.
 Если вы чувствуете, что визуальный звонок слишком яркий,
 вы можете установить более темный цвет.
\e[32m visual_bell_color none\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Просьба у окна обратить внимание на звонок.
 Заставляет значок дока подпрыгивать в macOS или мигать на панели задач в Linux.
\e[32m window_alert_on_bell yes\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Некоторый текст или символ Юникода для отображения на вкладке,
 если окно на вкладке, не имеющее фокуса, имеет колокольчик.
 Если вы хотите использовать начальные или конечные пробелы,
 заключите текст в кавычки.
 См. tab_title_template, как это отображается.
 Для обратной совместимости значения yes, y, true преобразуются в символ
 колокольчика по умолчанию, а no, n, false, none преобразуются в пустую строку.
\e[32m bell_on_tab \" \" \e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Программа для запуска при звонке.
 Переменная окружения KITTY_CHILD_CMDLINE может использоваться
 для запуска программы в окне, в котором раздался звонок.
\e[32m command_on_bell none\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Путь к звуковому файлу для воспроизведения звука звонка.
 Если установлено значение none, используется системный звук звонка по умолчанию.
 Должен быть в формате, поддерживаемом звуковым API операционной системы,
 например WAV
 или OGA в Linux (libcanberra)
 или AIFF, MP3 или WAV в macOS (NSSound).
\e[32m bell_path none\e[0m";ES;fi;;
#
  7) S=M7;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
