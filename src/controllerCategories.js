import { pool } from './db.js'

export const categoriesList = async (req, res) => {
  try {
    const [rows] = await pool.execute('SELECT * FROM category')
    res.json(rows)
  } catch (error) {
    console.error('Error to load category:', error)
    res.status(500).json({ error: 'Error to load category' })
  }
}

export const createCategory = async (req, res) => {
  const { rol, category } = req.body
  if (rol !== '1') {
    return res.status(400).json({ error: 'You do not have access to create the category.' })
  }

  if (!rol || !category) {
    return res.status(400).json({ error: 'rol, category are required!' })
  }

  try {
    const result = await pool.execute('INSERT INTO category (category_name) VALUES (?)', [category])
    const newCategory = {
      id: result.insertId,
      category
    }
    res.status(201).json(newCategory)
  } catch (error) {
    console.error('Error create category:', error)
    res.status(500).json({ error: 'Error create category' })
  }
}

export const updateCategories = async (req, res) => {
  const categorieId = parseInt(req.params.id, 10)
  const { rol, category } = req.body
  if (rol !== '1') {
    return res.status(400).json({ error: 'You do not have access to create the category' })
  }

  if (!rol || !category) {
    return res.status(400).json({ error: 'rol, category are required' })
  }

  try {
    const [result] = await pool.execute('UPDATE category SET category_name = ? WHERE id_category = ?', [category, categorieId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'category not found' })
    }
    res.json({ id: categorieId, category })
  } catch (error) {
    console.error('Error updating category:', error)
    res.status(500).json({ error: 'Error updating category' })
  }
}

export const deleteCategory = async (req, res) => {
  const categorieId = parseInt(req.params.id, 10)
  const { rol } = req.body
  if (rol !== '1') {
    return res.status(400).json({ error: 'No have access to create category' })
  }

  if (!rol) {
    return res.status(400).json({ error: 'rol required' })
  }

  try {
    const [result] = await pool.execute('DELETE FROM category WHERE id_category = ?', [categorieId])
    res.status(400).json({ message: 'category delete' })
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'category not found' })
    }
    res.status(204).send()
  } catch (error) {
    console.error('Error delete category:', error)
    res.status(500).json({ error: 'Error delete category' })
  }
}
