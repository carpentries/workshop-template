import unittest
from bs4 import BeautifulSoup
import os
from pathlib import Path
from git_root import git_root

class beautifulSoupTests(unittest.TestCase):
	""" 
	This test sets up a bs4 (https://www.crummy.com/software/BeautifulSoup/bs4/doc/#installing-beautiful-soup) 
	runner for tests of index.md that do not require a web browser.
	"""

	#https://github.com/jtilly/git_root
	soup = BeautifulSoup("", 'html.parser')
	def setUp(self):
		with open(Path(git_root()) / 'index.md', "r") as index:
			indexpage = index.read()
		self.soup = BeautifulSoup(indexpage , 'html.parser')

	def test_for_active_css_in_tabs(self):
		"""
		As per https://github.com/carpentries/workshop-template/pull/573/files
		all tab divs need to have the active class in index.md
		"""
		for article in self.soup.find_all("article"):
			self.assertIn('active', article['class'])
			self.assertIn('tab-pane', article['class'])


if __name__ == '__main__':
    unittest.main()