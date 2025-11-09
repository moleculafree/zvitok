# fonet.exe

**fonet.exe** — утиліта для генерації PDF з використанням XSL-FO або XML + XSLT.  
> [!IMPORTANT]
> ця перероблена версія fonet.exe, усі параметри актуальні лише для неї.

Покращення:  
* Коректна обробка файлів, що містить українську мову.
* Параметри задаються через **командний рядок**, **конфігураційний файл** або комбінованим методом (де пріоритет мають параметри з командного рядка).
* Початкові файли не видаляються і не змінюються - усі дії виконуються з тимчасовими копіями.

---

## Параметри

| Параметр | Командний рядок | Конфіг. файл | Опис |
|----------|-----------------|--------------|------|
| **Файл конфігурації** | `-config <файл>` |  | Використати власний файл конфігурації |
| **Кернінг шрифтів** | `-kerning` | `<Kerning>True</Kerning>` | Увімкнути кернінг шрифтів |
| **Спосіб обробки шрифтів TrueType** | `-fonttype <Link\|Embed\|Subset>` | `<FontType>Embed</FontType>` | <ul><li>`Link` — посилатись на шрифт</li><li>`Embed` — вбудовувати шрифт у PDF</li><li>`Subset` — вбудовувати лише використані символи (менше розмір файлу)</li></ul> |
| **Файл XSL-FO** | `-fo <файл>` | `<FoFile></FoFile>` | Шлях до XSL-FO файлу (що вже містить дані та розмітку) |
| **Файл XML з даними** | `-xml <файл>` | `<XmlFile></XmlFile>` | Шлях до XML-файлу з даними |
| **Файл XSLT з розміткою** | `-xslt <файл>` | `<XsltFile></XsltFile>` | Шлях до XSLT-файлу розмітки |
| **Вихідний PDF** | `-pdf <файл>` | `<PdfFile></PdfFile>` | Шлях до PDF-файлу. Якщо не вказано — результат виводиться у консоль |
| **Конвертація в UTF-8** | `-convert` | `<Convert>True</Convert>` | Конвертує дані у UTF-8 та змінює декларацію на `<?xml version="1.0" encoding="UTF-8"?>` |

---

## Примітка

Для створення PDF-файлу, що містить **українську мову**, **обов’язково** в командному рядку вказувати 
```
fonet.exe -convert -fonttype Embed
```
або зазначати в файлі конфігурації
```
<Convert>True</Convert>
<FontType>Embed</FontType>
```

## Приклади використання

### 1. Створення PDF безпосередньо з XML + XSLT
Взяти дані з файлу `xml`, об’єднати з файлом розмітки `xslt` і створити PDF:  

```bash
fonet.exe -xml file.xml -xslt file.xslt -pdf file.pdf
```

### 2. Створення PDF з проміжним XSL-FO

Взяти дані з файлу xml, об’єднати з файлом розмітки xslt, результат об’єднання записати у файл fo, і потім створити PDF:

```bash
fonet.exe -xml file.xml -xslt file.xslt -fo file.fo -pdf file.pdf
```


## Мапінг шрифтів

Під час трансформації **XML + XSLT → XSL-FO** назви шрифтів виправляються згідно з мапінгом `<Fonts>` у конфігураційному файлі.  
Наприклад:

```xml
<Fonts>
  <Font old="TimesNewRoman" new="Times New Roman" />
</Fonts>
```


## userconfig.xml ##
```
<Config>
  <Fonts>
    <Font old="TimesNewRoman" new="Times New Roman" />
    <Font old="ArialNarrow" new="Arial Narrow" />
  </Fonts>
  <Options>
    <XmlFile></XmlFile>
    <XsltFile></XsltFile>
    <FoFile></FoFile>
    <PdfFile></PdfFile>
    <Convert>True</Convert>
    <FontType>Subset</FontType>
    <Kerning></Kerning>
  </Options>
</Config>
```
