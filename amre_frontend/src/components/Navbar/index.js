import React from 'react';
import { Nav, NavLink, Bars, NavMenu, NavBtn, NavBtnLink } from './NavbarElements';
import { useAuth } from '../Auth/AuthContext';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';


const Navbar = () => {
    const { isLoggedIn, setIsLoggedIn } = useAuth();
    const navigate = useNavigate();
    const handleLogout = () => {
        localStorage.removeItem('token');
        setIsLoggedIn(false);
        toast.success('Logout successful!', {
            position: toast.POSITION.TOP_RIGHT,
            autoClose: 5000,
        });
        navigate('/sign-in');
    };

    return (
        <>
            <Nav>
                <Bars />
                <NavMenu>
                    <NavLink to='/' activeStyle>
                        Home
                    </NavLink>
                    {isLoggedIn && (
                        <>
                            <NavLink to='/yoga' activeStyle>
                                Yoga
                            </NavLink>
                            <NavLink to='/exercise' activeStyle>
                                Exercise
                            </NavLink>
                        </>
                    )}
                </NavMenu>
                <NavBtn>
                    {isLoggedIn ? (
                        <button className='button-34' onClick={handleLogout}>Logout</button>
                    ) : (
                        <NavBtnLink className='button-33' to='/sign-in'>Login</NavBtnLink>
                    )}
                </NavBtn>
            </Nav>
        </>
    );
};

export default Navbar;
