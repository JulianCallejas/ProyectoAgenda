from controller.ManejoPassword import Contrasena

import pytest

@pytest.fixture(scope='module')
def new_password():
    contrasena = Contrasena("1234").password
    hashed_contrasena = Contrasena.gen_password(contrasena)
    return contrasena,hashed_contrasena

def test_gen_password(new_password):
    """
    GIVEN a new password
    WHEN is encripted
    THEN check the password is encrypted
    """
    plain_password,hashed_password =new_password
    assert plain_password != hashed_password 

def test_check_password(new_password):
    """
    GIVEN a password
    WHEN a password is checked
    THEN check that the password matches
    """
    plain_password,hashed_password = new_password
    print(Contrasena.check_password(hashed_password,plain_password))