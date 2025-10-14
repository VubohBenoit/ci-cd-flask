from app.utils import add, greet

def test_add_ints():
    assert add(1, 2) == 3

def test_add_floats():
    assert abs(add(1.2, 2.3) - 3.5) < 1e-9

def test_greet():
    assert greet('Ben') == 'hello Ben'
