<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Шаблони податкової звітності](#%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD%D0%B8-%D0%BF%D0%BE%D0%B4%D0%B0%D1%82%D0%BA%D0%BE%D0%B2%D0%BE%D1%97-%D0%B7%D0%B2%D1%96%D1%82%D0%BD%D0%BE%D1%81%D1%82%D1%96)
  - [XSD-схеми перевірки XML](#xsd-%D1%81%D1%85%D0%B5%D0%BC%D0%B8-%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D1%96%D1%80%D0%BA%D0%B8-xml)
    - [Налаштування списку архівів](#%D0%9D%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D1%83-%D0%B0%D1%80%D1%85%D1%96%D0%B2%D1%96%D0%B2)
  - [FO-шаблони для формування PDF](#fo-%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD%D0%B8-%D0%B4%D0%BB%D1%8F-%D1%84%D0%BE%D1%80%D0%BC%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-pdf)
    - [Як працює генерація PDF](#%D0%AF%D0%BA-%D0%BF%D1%80%D0%B0%D1%86%D1%8E%D1%94-%D0%B3%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%86%D1%96%D1%8F-pdf)
    - [Архіви за замовчуванням](#%D0%90%D1%80%D1%85%D1%96%D0%B2%D0%B8-%D0%B7%D0%B0-%D0%B7%D0%B0%D0%BC%D0%BE%D0%B2%D1%87%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F%D0%BC)
  - [Довідники податкової звітності](#%D0%94%D0%BE%D0%B2%D1%96%D0%B4%D0%BD%D0%B8%D0%BA%D0%B8-%D0%BF%D0%BE%D0%B4%D0%B0%D1%82%D0%BA%D0%BE%D0%B2%D0%BE%D1%97-%D0%B7%D0%B2%D1%96%D1%82%D0%BD%D0%BE%D1%81%D1%82%D1%96)
    - [Оновлення через архіви ДПС](#%D0%9E%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-%D0%B0%D1%80%D1%85%D1%96%D0%B2%D0%B8-%D0%94%D0%9F%D0%A1)
    - [Оновлення через міграції](#%D0%9E%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-%D0%BC%D1%96%D0%B3%D1%80%D0%B0%D1%86%D1%96%D1%97)
  - [Якщо відсутній шаблон або схема](#%D0%AF%D0%BA%D1%89%D0%BE-%D0%B2%D1%96%D0%B4%D1%81%D1%83%D1%82%D0%BD%D1%96%D0%B9-%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD-%D0%B0%D0%B1%D0%BE-%D1%81%D1%85%D0%B5%D0%BC%D0%B0)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Шаблони податкової звітності

Усі шаблони та допоміжні файли зберігаються в теці:

```text
\Data\Templates\Tax
```

| Тека | Призначення |
|------|-------------|
| `fo` | XSLT-шаблони (`.fo`) для формування PDF |
| `xsd` | XSD-схеми для перевірки XML-документів |
| `spr` | Архіви для оновлення довідників податкової звітності |

---

## XSD-схеми перевірки XML

Для перевірки структури XML-документів використовуються файли **`.xsd`**.

Завантажити їх можна з **Реєстру електронних форм податкових документів**:
https://tax.gov.ua/elektronna-zvitnist/platnikam-podatkiv-pro/informatsiyno-analitichne-za/reestr-elektronnih-form-po/

Підтримуються два способи оновлення:

- загальний архів `xsd_all.arj`;
- окремі файли XSD.

> [!NOTE]
> Якщо використовуються окремі файли `.xsd` необхідно попередньо розпакувати архів в теку `\Data\Templates\Tax\xsd`.

### Налаштування списку архівів

```ini
xsdList=xsd_all.arj
```

Список архівів у параметрі `xsdList` задається через символ `|`.

Пошук необхідної схеми виконується у такому порядку:

1. окремий файли в `\Data\Templates\Tax\xsd`;
2. файл з архіву, перелічені у `xsdList`.

---

## FO-шаблони для формування PDF

### Як працює генерація PDF

> [!IMPORTANT]
> - **XML** — дані звіту.
> - **XSLT (.fo)** — шаблон оформлення.
> - **FO** — результат застосування шаблону до XML.
>
> Ланцюжок перетворення:
>
> `XML + XSLT → FO → PDF`

Для друку звітів використовуються файли **`.fo`** (XSLT-шаблони).

Назва файлу повинна збігатися з кодом форми.

| Код форми | Файл |
|-----------|------|
| `F0510410` | `F0510410.fo` |
| `F0510110` | `F0510110.fo` |
| `J1499202` | `J1499202.fo` |

### Архіви за замовчуванням

```ini
foList=fo.zip|fonet.fzz
```

Список архівів задається через символ `|`.

Пошук шаблону виконується у такому порядку:

1. окремий файл `\Data\Templates\Tax\fo`;
2. файл з архіву, перелічені у `foList`.

Оскільки ДПС регулярно оновлює форми звітності, користувач може самостійно додавати нові файли `.fo` до теки `fo`, не очікуючи випуску нової версії програми.

---

## Довідники податкової звітності

Довідники містять:

- перелік форм звітності;
- періоди застосування;
- строки дії.

Індексований довідник зберігається у файлі:

```text
\Data\Templates\Tax\tax.spr
```

### Оновлення через архіви ДПС

Завантажте з сайту ДПС:

| Архів | Призначення |
|-------|-------------|
| `SPR_VER.ZIP` | Версії документів https://tax.gov.ua/elektronna-zvitnist/platnikam-podatkiv-pro/informatsiyno-analitichne-za/dovidnik-versiy-podatkovih/|
| `SPR_TERM.ZIP` | Терміни подання https://tax.gov.ua/elektronna-zvitnist/platnikam-podatkiv-pro/informatsiyno-analitichne-za/dovidnik-terminiv-podannya-/|
| `SPR_DOC.ZIP` | Перелік документів https://tax.gov.ua/elektronna-zvitnist/platnikam-podatkiv-pro/informatsiyno-analitichne-za/dovidnik-zvitnih-podatkovi/|


Скопіюйте архіви до теки:

```text
\Data\Templates\Tax\spr
```

Після перезапуску програми індексний файл `tax.spr` буде автоматично оновлено.

### Оновлення через міграції

Розмістіть SQL-файл у теці:

```text
\Data\System\Schema\Migrations\TaxSpr\nnn
```

де `nnn` — номер актуальної версії міграції.

Після перезапуску програма автоматично виконає нові міграції.

---

## Якщо відсутній шаблон або схема

Можливі варіанти:

1. Використати пошук в мережі Інтернет та завантажити вже готовий файл в відповідну теку в \Data\Templates\Tax\.
2. Переглянути [Реєстр форм електронних документів](https://tax.gov.ua/elektronna-zvitnist/platnikam-podatkiv-pro/informatsiyno-analitichne-za/reestr-elektronnih-form-po/) і спробувати створити потрібний .fo файл.
3. Звернутись до технічного письменника з навичками форматування XSL-FO та інших документів.
4. Попередній пункт доволі дієвий.
5. Вибрати свій шлях.
