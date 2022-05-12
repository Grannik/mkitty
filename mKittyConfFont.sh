#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=18; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Font customization ----------------------- Настройка шрифта ------------------+\033[0m";
 TPUT 16 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 19 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  4 3; $e " Отрегулируйте вертикальное выравнивание    \e[32madjust_baseline                  \e[0m";}
  M1(){ TPUT  5 3; $e " Например                                   \e[32msymbol_map                       \e[0m";}
  M2(){ TPUT  6 3; $e " Например узкие символы                     \e[32mnarrow_symbols                   \e[0m";}
  M3(){ TPUT  7 3; $e " Kак обрабатывать многосимвольные лигатуры  \e[32mdisable_ligatures                \e[0m";}
  M4(){ TPUT  8 3; $e " Kакие функции OpenType включить/отключить  \e[32mfont_features                    \e[0m";}
  M5(){ TPUT  9 3; $e " Изменение размеров линий символов Unicode  \e[32mbox_drawing_scale                \e[0m";}
  M6(){ TPUT 10 3; $e " Цвет текста                                \e[32mforeground                       \e[0m";}
  M7(){ TPUT 11 3; $e " Размер шрифта                              \e[32mfont_size                        \e[0m";}
  M8(){ TPUT 12 3; $e " Семейство шрифтов                          \e[32mfont_family                      \e[0m";}
  M9(){ TPUT 13 3; $e " Начертание шрифта                          \e[32mbold_font                        \e[0m";}
 M10(){ TPUT 14 3; $e " Список поддерживаемых шрифтов              \e[32mkitty +list-fonts                \e[0m";}
 M11(){ TPUT 15 3; $e " Двунаправленный текст                      \e[32mBidi                             \e[0m";}
#
 M12(){ TPUT 17 3; $e " \e[90mExit                                                                        \033[0m";}
LM=12
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e " Отрегулируйте вертикальное выравнивание текста (высоту в ячейке, на которой
 расположен текст). Вы можете использовать либо числа, которые интерпретируются
 как пиксели, либо проценты (число, за которым следует %), которые
 интерпретируются как процент высоты строки. Положительное значение перемещает
 базовую линию вверх, а отрицательное — вниз.
 Позиции подчеркивания и зачеркивания корректируются соответствующим образом.
\e[32m adjust_baseline 0\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e " Например. symbol_map U+E0A0-U+E0A3,U+E0C0-U+E0C7 PowerlineSymbols Сопоставьте
 указанные кодовые точки Unicode с определенным шрифтом. Полезно, если вам нужен
 специальный рендеринг для некоторых символов, например для Powerline.
 Избегает необходимости в исправленных шрифтах. Каждая кодовая точка Юникода
 указывается в форме U+<кодовая точка в шестнадцатеричном формате>.
 Вы можете указать несколько кодовых точек, разделенных запятыми, и диапазоны,
 разделенные дефисами. Сам symbol_map может быть указан несколько раз.
 Синтаксис: symbol_map codepoints Название семейства шрифтов
\e[32m symbol_map\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Например. узкие_символы U+E0A0-U+E0A3,U+E0C0-U+E0C7 1
 Обычно для частного использования символы Unicode и некоторые символы
 символов/дингбатов, если за символом следует один или несколько пробелов,
 ktty будет использовать эти дополнительные ячейки для отображения символ
 крупнее, если символ в шрифте имеет широкое соотношение сторон.
 Используя эту настройку, вы может заставить kitty ограничить отображение
 указанных кодовых точек в указанном количестве ячеек, по умолчанию в одной ячейке
 Синтаксис: narrow_symbols codepoints Необязательно количество ячеек
\e[32m narrow_symbols\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Выберите, как вы хотите обрабатывать многосимвольные лигатуры.
 По умолчанию они всегда отображаются.
 Вы можете сказать котенку не отображать их, когда на них наведен курсор.
 с помощью курсора, чтобы упростить редактирование, или чтобы kitty никогда не
 отображал их, используя всегда, если они вам не нравятся.
 Стратегия лигатуры может быть установлена для каждого окна
 либо с помощью средства удаленного управления kitty,
 либо путем определения ярлыков для него в kitty.conf, например:
  map alt+1 disable_ligatures_in active always
  map alt+2 disable_ligatures_in all never
  map alt+3 disable_ligatures_in tab cursor
 Обратите внимание, что это относится к программным лигатурам,
 обычно реализуемым с помощью функции calt OpenType.
 Для отключения общих лигатур используйте параметр font_features.
\e[32m disable_ligatures never\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Например. font_features нет.
 Выберите, какие именно функции OpenType включить или отключить.
 Это полезно, поскольку некоторые шрифты могут иметь полезные функции в терминале.
 Например, Fira Code Retina включает в себя необязательную функцию, ноль, которая
 в этом шрифте изменяет внешний вид нуля (0), чтобы сделать его более простым.
 отличить от Ø. Fira Code Retina также включает другие дополнительные функции,
 известные как стилистические наборы, которые имеют теги от ss01 до ss20.
 Для точного синтаксис для отдельных функций см. в документации Harfbuzz:
 https://harfbuzz.github.io/harfbuzz-hb-common.html#hb-feature-from-string
 Обратите внимание, что этот код индексируется по имени PostScript,
 а не по семейству шрифтов. Это позволяет вам определить очень точные настройки
 функции; например вы можете отключить функцию курсивом, но не обычным шрифтом.
 В Linux они сначала считываются из базы данных FontConfig, а затем применяется
 этот параметр, поэтому их можно настраивается в одном центральном месте.
 Чтобы получить имя PostScript для шрифта, используйте kitty +list-fonts
 --psnames:
 .. code-block:: sh
     \$ kitty +list-fonts --psnames | grep Fira
     Fira Code
     Fira Code Bold (FiraCode-Bold)
     Fira Code Light (FiraCode-Light)
     Fira Code Medium (FiraCode-Medium)
     Fira Code Regular (FiraCode-Regular)
     Fira Code Retina (FiraCode-Retina)
 В скобках указано имя PostScript.
 Включить альтернативные нули и цифры старого стиля:
 font_features FiraCode-Retina +zero +onum
 Включить только альтернативные нули font_features FiraCode-Retina +zero
 Отключить нормальные лигатуры, но сохранить функцию калта, которая в этом шрифте
 разбивает монотонность font_features TT2020StyleB-Regular -liga + calt
 В сочетании с force_ltr вы можете полностью отключить формирование арабского
 языка и смотреть только на отдельные формы, если они появляются в документе.
 Вы можете сделать это, например:
 font_features UnifontMedium +isol -medi -fina -init
\e[32m font_features\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Изменение размеров линий, используемых для рисования символов Unicode.
 Эти значения указаны в точках. Они будут масштабироваться с помощью
 DPI монитора, чтобы получить значение в пикселях.
 Должно быть четыре значения:
 соответствующие тонким, нормальным, толстым и очень толстым линиям.
\e[32m box_drawing_scale 0.001, 1, 1.5, 2\e[0m";ES;fi;;
  6) S=M6;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m foreground #ffffff\e[0m";ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m font_size 3.0\e[0m";ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;echo -e "
 Fonts kitty имеет очень мощное управление шрифтами.
 Вы можете настроить отдельные шрифты
 и даже указать специальные шрифты для определенных символов.
\e[32m font_family\e[36m monospace
             serif
             sans-serif
             cursive
             fantasy
             arial
             verdana
             Georgia
             Impact
             Comic Sans MS
             Trebuchet MS
             Courier New
             Times New Roman
\e[0m";ES;fi;;
  9) S=M9;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m
 bold_font\e[36m auto
           normal
           bold
           lighter
           bolder
\e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;kitty +list-fonts;ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 kitty не поддерживает BIDI (двунаправленный текст),
 однако для скриптов RTL слова автоматически отображаются в RTL.
 То есть в сценарии RTL слова «HELLO WORLD» отображается в котенке как
 «WORLD HELLO», и если вы попытаетесь выбрать подстроку RTL-образной строки,
 вы получите символ, который был бы там, строка была LTR.
 Например, предположив еврейское слово ירושלים, выбор символа,
 который на экране выглядит как ם, на самом деле запишет буфер выбора символа י
 поведение kitty по умолчанию полезно в сочетании с фильтром для изменения
 порядка слов, однако, если вы хотите манипулировать Глифы RTL, работать с ними
 может быть очень сложно, поэтому предусмотрена эта опция для отключения.
 Кроме того, эту опцию можно использовать с программой командной строки
 GNU FriBidi: https://github.com/fribidi/fribidi#executable
 чтобы получить поддержку BIDI, потому что это заставит kitty всегда обрабатывать
 текст как LTR, чего ожидает FriBidi для терминалов.
";ES;fi;;
#
 12) S=M12;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
