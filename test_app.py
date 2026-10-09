import unittest

from app import calculate_total


class TestApp(unittest.TestCase):
    def test_calculate_total(self):
        self.assertEqual(calculate_total(25, 4), 100)

    def test_zero_quantity(self):
        self.assertEqual(calculate_total(25, 0), 0)

    def test_negative_price(self):
        with self.assertRaises(ValueError):
            calculate_total(-25, 4)


if __name__ == "__main__":
    unittest.main()