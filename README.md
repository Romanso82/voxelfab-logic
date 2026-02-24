# VoxelFab AI Worker (v11 "Gold Standard")

Интеллектуальный воркер на базе Supabase Edge Functions и OpenAI GPT-4o-mini для автоматического анализа и тегирования 3D-миниатюр.

## 🚀 Текущий статус: Промышленная эксплуатация (v11)
Система перешла от простого распознавания образов к контекстному анализу на основе мастер-данных.

### Ключевые особенности v11:
- **Context-Aware Analysis**: Воркер считывает `title`, `description` и `universe` из таблицы `products` перед анализом изображения.
- **Discovery Mode 2.0**: Автоматический поиск уникальных фактур (камень, пористое тесто, ритуальная броня) для обучения системы.
- **Universe Expander**: Бот предлагает кросс-системную совместимость (например, Trench Crusade -> Warhammer / Pathfinder / Frostgrave).
- **Anti-Hallucination Guard**: Благодаря контексту БД, мирные декорации больше не определяются как «оружие Grimdark».

## 🛠 Технический стек
- **Runtime**: Deno (Supabase Edge Functions)
- **AI Model**: GPT-4o-mini (Vision) + text-embedding-3-small
- **Database**: Supabase (PostgreSQL + pgvector)
