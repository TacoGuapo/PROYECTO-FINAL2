import { pool } from './db.js'

export const updateUser = async (req, res) => {
  const userId = req.params.user
  const { name, email, password, rol } = req.body

  try {
    const [result] = await pool.execute('UPDATE users SET name = ?, email = ?, password = ?, id_rol = ? WHERE user = ?', [name, email, password, rol, userId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'User not found' })
    }
    res.json({ id: userId, name, email, password, rol })
  } catch (error) {
    console.error('Error updating user:', error)
    res.status(500).json({ error: 'Error updating user' })
  }
}

export const userId = async (req, res) => {
  const userId = parseInt(req.params.id, 10)

  try {
    const [rows] = await pool.execute('SELECT * FROM users WHERE id_users = ?', [userId])
    if (rows.length === 0) {
      return res.status(404).json({ error: 'User not found' })
    }
    res.json(rows[0])
  } catch (error) {
    console.error('Error getting user_id:', error)
    res.status(500).json({ error: 'Error getting user_id' })
  }
}

export const createUser = async (req, res) => {
  const { user, name, email, password, rol } = req.body
  if (!user || !name || !email || !password || !rol) {
    return res.status(400).json({ error: 'user, name, email, password, rol are required!' })
  }

  try {
    const result = await pool.execute('INSERT INTO users (user, name, email, password, id_rol) VALUES (?, ?, ?, ?, ?)', [user, name, email, password, rol])
    const newUser = {
      id: result.insertId,
      user,
      name,
      email,
      password,
      rol
    }
    res.status(201).json(newUser)
  } catch (error) {
    console.error('Error create user:', error)
    res.status(500).json({ error: 'Error create user' })
  }
}

export const deleteUser = async (req, res) => {
  const userId = req.params.user

  try {
    const [result] = await pool.execute('DELETE FROM users WHERE user = ?', [userId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'User not found' })
    }
    res.status(204).send()
  } catch (error) {
    console.error('Error al eliminar usuario:', error)
    res.status(500).json({ error: 'Error al eliminar usuario' })
  }
}

export const list = async (req, res) => {
  const { rol } = req.body
  if (rol !== '1') {
    return res.status(400).json({ error: 'You do not have access to view users' })
  }

  try {
    const [rows] = await pool.execute('SELECT * FROM users')
    res.json(rows)
  } catch (error) {
    console.error('Error getting users list:', error)
    res.status(500).json({ error: 'Error getting users list' })
  }
}
