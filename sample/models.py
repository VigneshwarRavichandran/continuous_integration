from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()

class Post(models.Model):
	title = models.TextField()
	content = models.TextField()
	createdby = models.ForeignKey(User, on_delete=models.CASCADE)

	def __repr__(self):
		return self.title

class Vote(models.Model):
	votedby = models.ForeignKey(User, on_delete=models.CASCADE)
	post = models.ForeignKey(Post, on_delete=models.CASCADE)

class Comment(models.Model):
	commentedby = models.ForeignKey(User, on_delete=models.CASCADE)
	post = models.ForeignKey(Post, on_delete=models.CASCADE)