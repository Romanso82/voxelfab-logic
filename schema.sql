-- Таблицы пользователей и коммуникаций
CREATE TABLE app_users (id uuid, display_name text, username text, channel_user_id text, profile jsonb, language text, is_admin boolean, is_blocked boolean, allow_links boolean, allow_notify boolean, behavior_vector USER-DEFINED, first_seen_at timestamp with time zone, last_seen_at timestamp with time zone, updated_at timestamp with time zone, created_at timestamp with time zone, first_utm_source text, first_utm_medium text, first_utm_campaign text, first_utm_content text, first_utm_term text, channel text);
CREATE TABLE conversations (id uuid, user_id uuid, status text, topic text, handoff_provider text, handoff_ref text, updated_at timestamp with time zone, created_at timestamp with time zone);
CREATE TABLE messages (id bigint, conversation_id uuid, role text, content text, content_type text, meta jsonb, tokens integer, embedding USER-DEFINED, channel_message_id text, created_at timestamp with time zone);
CREATE TABLE memories (id uuid, user_id uuid, conversation_id uuid, key text, value text, kind text, scope text, confidence numeric, is_active boolean, source_message_id bigint, updated_at timestamp with time zone, created_at timestamp with time zone);

-- Таблицы товаров и анализа
CREATE TABLE products (offer_id text, title text, category text, kind text, universe text, description text, ai_description text, hashtags text, ai_tags ARRAY, ai_recommendations jsonb, qty integer, height_mm numeric, diameter_mm numeric, size_mm_min numeric, size_mm_max numeric, base_mm_min numeric, base_mm_max numeric, is_adult boolean, tokens integer, embedding USER-DEFINED, ai_embedding USER-DEFINED, ai_last_analyzed_at timestamp with time zone, images_updated_at timestamp with time zone, updated_at timestamp with time zone, created_at timestamp with time zone);
CREATE TABLE product_media (id bigint, offer_id text, url text, sort_order integer, is_main boolean, ai_caption text, ai_tags jsonb, ai_json jsonb, ai_embedding USER-DEFINED, ai_last_analyzed_at timestamp with time zone, updated_at timestamp with time zone, created_at timestamp with time zone);
CREATE TABLE product_prices (offer_id text, ozon_price numeric, ozon_url text, updated_at timestamp with time zone, created_at timestamp with time zone);
CREATE TABLE product_ai_analysis_queue (id bigint, product_id bigint, offer_id text, image_url text, ai_text text, status text, processed_at timestamp with time zone, created_at timestamp with time zone);

-- Векторные хранилища и поиск
CREATE TABLE embeddings_store (id uuid, doc_id text, doc_type text, content text, content_hash text, meta jsonb, embedding USER-DEFINED, embedding_dim integer, embedding_model text, lang text, updated_at timestamp with time zone, created_at timestamp with time zone);
CREATE TABLE search_export (id uuid, doc_id text, doc_type text, content text, content_hash text, meta jsonb, embedding USER-DEFINED, embedding_dim integer, embedding_model text, lang text, updated_at timestamp with time zone, chunk_index integer);

-- Аналитика и обратная связь
CREATE TABLE events (id bigint, user_id uuid, conversation_id uuid, message_id bigint, offer_id text, event_type text, meta jsonb, created_at timestamp with time zone);
CREATE TABLE recommendation_feedback (id uuid, user_id uuid, conversation_id uuid, request_text text, offered_products jsonb, feedback_text text, rating integer, created_at timestamp with time zone);
CREATE TABLE unmet_recommendations (id uuid, user_id uuid, conversation_id uuid, user_request text, interpreted_intent jsonb, missing_products jsonb, missing_attributes jsonb, missing_media boolean, status text, resolved_at timestamp with time zone, created_at timestamp with time zone);
CREATE TABLE assortment_expansion_ideas (id uuid, idea jsonb, source text, status text, priority integer, created_at timestamp with time zone);

-- Тренды (вьюхи)
CREATE TABLE v_trends_catalog_30d (universe text, category text, shows bigint);
CREATE TABLE v_trends_queries_30d (query text, cnt bigint, zero_hit_cnt bigint, last_seen timestamp with time zone);
