def test_smoke():
    import importlib
    assert importlib.util.find_spec("playground_ds") is not None
