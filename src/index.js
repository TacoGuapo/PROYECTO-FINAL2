import express from 'express'
import bodyParser from 'body-parser'
import { createUser, userId, updateUser, deleteUser, list } from './controllerUser.js'
import { createPost, postId, updatePost, deletePost, postList } from './controllerPost.js'
import { createComm, updateComm, deleteComm, commentList } from './controllerComments.js'
import { categoriesList, createCategory, deleteCategory, updateCategories } from './controllerCategories.js'
import { manejarErrorArchivo } from './helper.js'
import swaggerUi from 'swagger-ui-express'
import jsonDocs from './swagger-output.json' assert {type: 'json'}

const app = express()

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(jsonDocs))

app.use(bodyParser.json())

/// /////////////USERS///////////////////////

app.post('/users', createUser, manejarErrorArchivo)

app.get('/users', list)

app.get('/users/:id', userId)

app.put('/users/:user', updateUser)

app.delete('/users/:user', deleteUser)

/// /////////////POSTS///////////////////////

app.post('/posts', createPost, manejarErrorArchivo)

app.put('/posts/:id', updatePost)

app.get('/posts', postList)

app.get('/posts/:id', postId)

app.delete('/posts/:id', deletePost)

/// /////////////COMMENTS///////////////////////

app.put('/comments/:id', updateComm)

app.get('/posts/:id/comments', commentList)

app.delete('/comments/:id', deleteComm)

app.post('/comments', createComm)

/// /////////////CATEGORY///////////////////////

app.post('/categories', createCategory)

app.get('/categories', categoriesList)

app.put('/categories/:id', updateCategories)

app.delete('/categories/:id', deleteCategory)

app.listen(3000, () => console.log('Server running on http://localhost:3000'))
