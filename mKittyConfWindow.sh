#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=31; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Макет окна ------------------------------- Window layout ---------------------+\033[0m";
 TPUT 29 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 32 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  5 3; $e " Размер окна                               \e[32m remember_window_size             \033[0m";}
  M1(){ TPUT  6 3; $e " Ширина окна                               \e[32m initial_window_width             \033[0m";}
  M2(){ TPUT  7 3; $e " Высота окна                               \e[32m initial_window_height            \033[0m";}
  M3(){ TPUT  8 3; $e " Включенные макеты окон                    \e[32m enabled_layouts *                \033[0m";}
  M4(){ TPUT  9 3; $e " Размер шага в единицах ширины/высоты      \e[32m window_resize_step_              \033[0m";}
  M5(){ TPUT 10 3; $e " Ширина границ окна                        \e[32m window_border_width              \033[0m";}
  M6(){ TPUT 11 3; $e " Нарисуйте только минимально границы       \e[32m draw_minimal_borders             \033[0m";}
  M7(){ TPUT 12 3; $e " Поле окна (пустая область за границей)    \e[32m window_margin_width              \033[0m";}
  M8(){ TPUT 13 3; $e " используемое, когда видно одно окно       \e[32m single_window_margin_width       \033[0m";}
  M9(){ TPUT 14 3; $e " пустая область меж текстом и границей окна\e[32m window_padding_width             \033[0m";}
 M10(){ TPUT 15 3; $e " размер окна не является кратным ячейки    \e[32m placement_strategy               \033[0m";}
 M11(){ TPUT 16 3; $e " Цвет бордюра активного окна               \e[32m active_border_color              \033[0m";}
 M12(){ TPUT 17 3; $e " Цвет бордюра неактивного окна             \e[32m inactive_border_color            \033[0m";}
 M13(){ TPUT 18 3; $e " Цвет границы неактивных окон, звонок      \e[32m bell_border_color                \033[0m";}
 M14(){ TPUT 19 3; $e " Затемнить текст в неактивных окнах        \e[32m inactive_text_alpha              \033[0m";}
 M15(){ TPUT 20 3; $e " Путь к изображению логотипа               \e[32m window_logo_path                 \033[0m";}
 M16(){ TPUT 21 3; $e " Где разместить логотип окна в окне        \e[32m window_logo_position             \033[0m";}
 M17(){ TPUT 22 3; $e " Величина, логотип должен слиться с фоном  \e[32m window_logo_alpha                \033[0m";}
 M18(){ TPUT 23 3; $e " Время ожидания перед перерисовкой экрана  \e[32m resize_debounce_time             \033[0m";}
 M19(){ TPUT 24 3; $e " Выберите, время изменения размера         \e[32m resize_draw_strategy             \033[0m";}
 M20(){ TPUT 25 3; $e " Изменяйте размер окна ОС с шагом          \e[32m resize_in_steps                  \033[0m";}
 M21(){ TPUT 26 3; $e " Список символов, визуального выбора окна  \e[32m visual_window_select_characters  \033[0m";}
 M22(){ TPUT 27 3; $e " Запрашивать подтверждение при закрытии    \e[32m confirm_os_window_close -1       \033[0m";}
 M23(){ TPUT 28 3; $e " Измените размер рендеринга каждой ячейки  \e[32m                                  \033[0m";}
#
 M24(){ TPUT 30 3; $e " \e[90mExit                                                                        \033[0m";}
LM=24
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
 Если включено, размер окна будет запоминаться, так что новые экземпляры kitty
 будут иметь тот же размер, что и предыдущий экземпляр. Если отключено, окно
 изначально будет иметь размер, настроенный с помощью initial_window_width/height
 в пикселях. Вы можете использовать суффикс «c» для значений ширины/высоты, чтобы
 они интерпретировались как количество ячеек, а не пикселей.
\e[32m remember_window_size yes\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m initial_window_width 640\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m initial_window_height 400\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Включенные макеты окон. Разделенный запятыми список имен макетов
 Специальное значение all означает все раскладки.
 Первый из перечисленных макетов будет использоваться в качестве
 начального макета.
 Конфигурация по умолчанию — все макеты в алфавитном порядке.
 Список доступных макетов см. на странице:
 https://sw.kovidgoyal.net/kitty/overview/#layouts.
\e[32m enabled_layouts *\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Размер шага (в единицах ширины/высоты ячейки), используемый при
 изменении размера окон котенка в макете с помощью клавиатуры
\e[32m start_resizing_window\e[0m
 Значение ячеек используется для изменения размера по горизонтали,
 а значение строк — для изменения размера по вертикали.
\e[32m window_resize_step_cells 2\e[0m
\e[32m window_resize_step_lines 2\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Ширина границ окна. Может быть либо в пикселях (px), либо в pts (pt).
 Значения в пунктах будут округлены до ближайшего числа пикселей
 в зависимости от разрешения экрана. Если не указано, предполагается,
 что единицей измерения являются pts.
 Обратите внимание, что границы отображаются только тогда,
 когда видно более одного окна.
 Они предназначены для разделения нескольких окон.
\e[32m window_border_width 0.5pt\e[0m
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Нарисуйте только минимально необходимые границы.
 Это означает, что рисуются только минимально необходимые границы для неактивных
 окон. Это только границы, отделяющие неактивное окно от соседнего.
 Обратите внимание, что установка ненулевого поля окна отменяет это и заставляет
 рисовать все границы.
\e[32m draw_minimal_borders yes\e[0m
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Поле окна (в пунктах) (пустая область за границей).
 Одно значение устанавливает все четыре стороны.
 Два значения задают вертикальную и горизонтальную стороны.
 Три значения задают сверху, по горизонтали и снизу.
 Четыре значения устанавливаются:
                                  \e[36mtop   \e[0m сверху
                                  \e[36mbottom\e[0m снизу
                                  \e[36mright \e[0m справа
                                  \e[36mleft  \e[0m слева
\e[32m window_margin_\e[36mwidth 0\e[0m
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Поле окна (в пунктах), используемое, когда видно только одно окно.
 Отрицательные значения приведут к тому, что вместо этого будет использоваться
 значение window_margin_width.
 Одно значение устанавливает все четыре стороны.
 Два значения задают вертикальную и горизонтальную стороны.
 Три значения задают сверху, по горизонтали и снизу.
 Четыре значения:
                                  \e[36mtop   \e[0m сверху
                                  \e[36mbottom\e[0m снизу
                                  \e[36mright \e[0m справа
\e[32m single_window_margin_\e[36mwidth -1\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Отступ окна (в пунктах) (пустая область между текстом и границей окна).
 Одно значение устанавливает все четыре стороны.
 Два значения задают вертикальную и горизонтальную стороны.
 Три значения задают сверху, по горизонтали и снизу.
 Четыре значения устанавливаются сверху, справа, снизу и слева.
\e[32m window_padding_width 0\e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Когда размер окна не является точным кратным размеру ячейки, область ячейки окна
 терминала будет иметь дополнительные отступы по бокам.
 С помощью этой опции вы можете контролировать, как распределяется это заполнение
 Использование значения center означает,
 что область ячейки будет размещена по центру. Значение top-left означает,
 что заполнение будет только на нижнем и правом краях.
\e[32m placement_strategy center\e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m active_border_color #ffffff\e[0m
 Цвет границы активного окна. Установите для этого параметра значение none,
 чтобы не рисовать границы вокруг активного окна:
\e[32m active_border_color none\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m inactive_border_color #cccccc\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Цвет границы неактивных окон, в которых произошел звонок
\e[32m bell_border_color #ff5a00\e[0m
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Затемнить текст в неактивных окнах на указанную величину (число от нуля до
 единицы, при этом ноль означает полное исчезновение)
 hide_window_decorations no Скрыть окно украшения
 (заголовок и границы окна) с yes.
 В macOS заголовок только для скрытия можно использовать только для скрытия
 заголовка. Работает ли это и какой именно эффект это имеет, зависит от
 оконного менеджера/операционной системы.
 Обратите внимание, что последствия изменения этого параметра при перезагрузке
 конфигурации не определены.
\e[32m inactive_text_alpha 1.0\e[0m
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Путь к изображению логотипа. Должен быть в формате PNG.
 Относительные пути интерпретируются относительно каталога конфигурации kitty.
 Логотип отображается в углу каждого окна kitty.
 Положение контролируется window_logo_position.
 Отдельные окна можно настроить так, чтобы они имели разные логотипы либо
 с помощью функции запуска, либо с помощью средства дистанционного управления.
\e[32m window_logo_path none\e[0m
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Где разместить логотип окна в окне. Значение может быть одним из:

\e[32m window_logo_position \e[36mbottom-right\e[0m снизу-справа
                     \e[36m top-left    \e[0m сверху-слева
                     \e[36m top         \e[0m сверху
                     \e[36m top-right   \e[0m сверху-справа
                     \e[36m left        \e[0m слева
                     \e[36m center      \e[0m по центру
                     \e[36m right       \e[0m справа
                     \e[36m bottom-left \e[0m снизу-слева
                     \e[36m bottom      \e[0m снизу
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Величина, на которую логотип должен слиться с фоном.
 При этом ноль полностью блеклый, а один полностью непрозрачный.
\e[32m window_logo_alpha 0.5\e[0m
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Время ожидания (в секундах) перед перерисовкой экрана при получении события
 изменения размера. На таких платформах, как macOS, где операционная система
 отправляет события, соответствующие началу и концу изменения размера,
 этот номер игнорируется.
\e[32m resize_debounce_time 0.1\e[0m
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Выберите, как kitty рисует окно во время изменения размера.
 Значение static означает отрисовку текущего содержимого окна, в основном без
 изменений.
 Значение scale означает отрисовку содержимого текущего окна в масштабе.
 Значение Blank означает рисование пустого окна.
 Значение size означает отображение размера окна в ячейках.
\e[32m resize_draw_strategy static\e[0m
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Изменяйте размер окна ОС с шагом, равным размеру ячеек, вместо обычной точности
 в пикселях. В сочетании с initial_window_width и initial_window_height в
 количестве ячеек этот параметр можно использовать для сохранения минимально
 возможных полей при изменении размера окна ОС.
 Обратите внимание, что в настоящее время это не работает на Wayland.
\e[32m resize_in_steps no\e[0m";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "
 Список символов, используемых для визуального выбора окна (например, для выбора
 окна для фокусировки с помощью focus_visible_window). Значение должно быть рядом
 уникальные числа или алфавиты, без учета регистра, из набора [0-9A-Z].
 Укажите свои предпочтения в виде строки символов.
\e[32m visual_window_select_characters\e[36m 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ\e[0m";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "
 Запрашивать подтверждение при закрытии окна ОС или вкладки с не менее чем этим
 количеством кошачьих окон диспетчером окон (например, нажатием кнопки закрытия
 окна или нажатием ярлыка операционной системы, чтобы закрыть окна) или действием
 close_tab. Нулевое значение отключает подтверждение. Это подтверждение также
 относится к запросы на выход из всего приложения,все окна ОС через действие quit.
 Однако отрицательные значения преобразуются в положительные с помощью:
 https://sw.kovidgoyal.net/kitty/shell-integration/
 включено, использование отрицательных значений означает, что окна, находящиеся в
 приглашении оболочки, не учитываются, а учитываются только окна, в которых в
 данный момент выполняется какая-либо команда.
 Обратите внимание, что если вы хотите подтверждение при закрытии отдельных окон,
 вы можете сопоставить действие:
 https://sw.kovidgoyal.net/kitty/actions/#close-window-with-confirmation.
\e[32m \e[0m";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "
 Измените размер рендеринга каждой ячейки персонажа.
 Вы можете использовать либо числа, которые интерпретируются как пиксели,
 либо проценты (число, за которым следует %), которые интерпретируются как
 проценты от неизмененных значений.
 Вы можете использовать отрицательные пиксели или проценты менее 100%,
 чтобы уменьшить размеры (но это может вызвать артефакты рендеринга).
";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
