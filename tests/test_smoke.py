def test_smoke():
    import importlib
    assert importlib.util.find_spec("mini_rideshare_warehouse") is not None
