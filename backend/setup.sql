-- Usuários (se não usar auth do Supabase)
CREATE TABLE users (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email text UNIQUE NOT NULL,
  password_hash text NOT NULL,
  created_at timestamp DEFAULT now()
);

-- Categorias
CREATE TABLE categories (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id uuid REFERENCES users(id) ON DELETE CASCADE,
  name text NOT NULL,
  color text DEFAULT '#3B82F6',
  created_at timestamp DEFAULT now()
);

-- Transações
CREATE TABLE transactions (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id uuid REFERENCES users(id) ON DELETE CASCADE,
  title text NOT NULL,
  value numeric NOT NULL,
  type text CHECK (type IN ('income', 'expense')),
  category_id uuid REFERENCES categories(id),
  date date NOT NULL,
  description text,
  created_at timestamp DEFAULT now()
);