# Состояние базы данных (v11)

## Таблица: `product_media`
- **url**: Ссылка на изображение (Primary Key / Unique).
- **ai_json**: Структура v11.
- **ai_caption**: Краткое резюме (summary_ru).
- **ai_last_analyzed_at**: Таймстамп последней обработки.

## Структура JSON (ai_json v11)
```json
{
  "schema_version": 11,
  "summary_ru": "Художественное описание",
  "entities": [
    {
      "name_ru": "Название объекта",
      "setting_ru": "Сеттинг",
      "class_ru": "Класс (NPC, Декор и т.д.)",
      "tags_ru": ["лор", "смежные вселенные"]
    }
  ],
  "quality": {
    "new_feature_candidates": ["фактура", "рекомендация по вселенной"]
  }
}
