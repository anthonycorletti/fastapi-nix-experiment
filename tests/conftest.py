from typing import Generator

import pytest
from fastapi.testclient import TestClient

from app.app import app


@pytest.fixture(scope="session")
def client() -> Generator:
    with TestClient(app) as c:
        yield c
