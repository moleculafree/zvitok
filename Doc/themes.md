<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Налаштування інтерфейсу](#%D0%9D%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D1%96%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81%D1%83)
  - [Загальна структура](#%D0%97%D0%B0%D0%B3%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0-%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0)
    - [theme.json описує:](#themejson-%D0%BE%D0%BF%D0%B8%D1%81%D1%83%D1%94)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Налаштування інтерфейсу
> [!NOTE]
> Поточна публічна версія програми може не повністю підтримувати або збігатися з описом у цьому файлі.
 

## Загальна структура

Тека \Data\Themes містить папки з темами оформлення. Кожна тема має файл налаштувань theme.json та підпапку Icon з іконками. 

### theme.json описує:

1. розміри форм
2. поведінку при ресайзі (onresize)
3. елементи 
   1. розташування (left/top/width/height)
   2. тексти та опис
   3. значення за замовчуванням
   4. перелік варіантів вибору (для combo списків)
   5. прив’язку значення до ключа в ini файлі
4. кольори
5. іконки (зображення на кнопках та у списках)

