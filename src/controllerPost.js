import { pool } from './db.js'

export const updatePost = async (req, res) => {
  const postId = parseInt(req.params.id, 10)
  const { title, content } = req.body

  try {
    const [result] = await pool.execute('UPDATE posts SET title = ?, content = ? WHERE id_posts = ?', [title, content, postId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Post not found' })
    }
    res.json({ id: postId, title, content })
  } catch (error) {
    console.error('Error updating Post:', error)
    res.status(500).json({ error: 'Error updating Post' })
  }
}

export const postId = async (req, res) => {
  const postId = parseInt(req.params.id, 10)

  try {
    const [rows] = await pool.execute('SELECT * FROM posts WHERE id_posts = ?', [postId])
    if (rows.length === 0) {
      return res.status(404).json({ error: 'User not found' })
    }
    res.json(rows[0])
  } catch (error) {
    console.error('Error getting posts_id:', error)
    res.status(500).json({ error: 'Error getting posts_id' })
  }
}

export const createPost = async (req, res) => {
  const { title, content, user, idUser } = req.body
  if (!title || !content || !user || !idUser) {
    return res.status(400).json({ error: 'title, content, User and idUser are required!' })
  }

  const creationDate = new Date().toISOString().slice(0, 19).replace('T', ' ')

  try {
    const result = await pool.execute('INSERT INTO posts (title, content, creation_date, user, id_users) VALUES (?, ?, ?, ?, ?)', [title, content, creationDate, user, idUser]
    )
    const newPost = {
      id: result.insertId,
      title,
      content,
      creationDate,
      user,
      idUser
    }
    res.status(201).json(newPost)
  } catch (error) {
    console.error('Error create post:', error)
    res.status(500).json({ error: 'Error create post' })
  }
}

export const deletePost = async (req, res) => {
  const postId = parseInt(req.params.id, 10)

  try {
    const [result] = await pool.execute('DELETE FROM posts WHERE id_posts = ?', [postId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'User not found' })
    }
    res.status(204).send()
  } catch (error) {
    console.error('Error delete post:', error)
    res.status(500).json({ error: 'Error delete post' })
  }
}

export const postList = async (req, res) => {
  try {
    const [rows] = await pool.execute('SELECT * FROM posts')
    res.json(rows)
  } catch (error) {
    console.error('Error getting users list:', error)
    res.status(500).json({ error: 'Error getting users list' })
  }
}
