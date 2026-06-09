-- 1. 建立測驗題庫資料表
CREATE TABLE sentence_practices (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,        -- 文章或題組標題
    en_text TEXT NOT NULL,      -- 英文句子
    zh_text TEXT NOT NULL,      -- 中文翻譯
    seq_num INTEGER NOT NULL,   -- 句子順序 (例如：1, 2, 3...)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- 2. 設定 RLS (Row Level Security) 政策，允許所有人讀取與新增 (方便前端直接操作)
ALTER TABLE sentence_practices ENABLE ROW LEVEL SECURITY;

CREATE POLICY "允許匿名讀取" ON sentence_practices
    FOR SELECT USING (true);

CREATE POLICY "允許匿名新增" ON sentence_practices
    FOR INSERT WITH CHECK (true);