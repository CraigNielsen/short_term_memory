import unittest
import os
# from json_config_lib import JsonConfig
from json_config import JsonConfig

class TestJsonConfig(unittest.TestCase):

    def setUp(self):
        os.environ['ROLE'] = 'TESTING'
        self.lines = ['[config class]', 'this=something', 'is=something', 'a=something', 'bunch=something', 'of=something', 'lines=something', '[cool_hey]', 'yes=something']

    def tearDown(self):
        pass

    def test_can_read_file(self):
        j = JsonConfig()
        self.assertEqual(j._fetch_config_lines_from_file("lines.ini"), self.lines)

    def test_can_parse_lines(self):
        j = JsonConfig()
        expected_dict = {
            'config class': {
                'this': 'something',
                'is': 'something',
                'a': 'something',
                'bunch': 'something',
                'of': 'something',
                'lines': 'something'
            },
            'cool_hey': {
                'yes': 'something'
            }
        }
        self.assertEqual(j._parse_config_lines(self.lines), expected_dict)

    def test_can_read_all_files(self):
        j = JsonConfig('staging.ini')
        config = j.read_config()
        self.assertEqual(config['kafka']['host'], '5.7.36.26')
        self.assertEqual(config['kafka']['port'], '200')
        self.assertEqual(config['marketplace_service']['host_port'], 'marketplace-lb:80')
        self.assertEqual(config['marketplace_service']['endpoint'], '/rest/marketplace/seller_listings')

    def test_can_read_all_files(self):
        j = JsonConfig('staging.ini')
        config = j.read_config()
        self.assertEqual(config['kafka']['host'], '5.7.36.26')
        self.assertEqual(config['kafka']['port'], '200')
        self.assertEqual(config['marketplace_service']['host_port'], 'marketplace-lb:80')
        self.assertEqual(config['marketplace_service']['endpoint'], '/rest/marketplace/seller_listings')
