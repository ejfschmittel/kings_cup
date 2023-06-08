import {useState} from "react";
import "../styles/components/Menu.scss";

export const Menu = () => {
    const [open, setOpen] = useState(false)


    const toggle = () => {
        setOpen(!open)
    }

    return (
        <div className={`menu ${open && 'menu--open'}`} onClick={toggle}>
            <button className={"menu__button"}>

                    <span></span>
                    <span></span>
                    <span></span>

            </button>
            <div className={"menu__background"}>

            </div>
            <div className={"menu__content"}>
                <div className={"menu__items"}>
                <div className={"menu__item"}>
                    Menu item 1
                </div>
                <div className={"menu__item"}>
                    Menu item 1
                </div>
                <div className={"menu__item"}>
                    Menu item 1
                </div>
                <div className={"menu__item"}>
                    Menu item 1
                </div>
                </div>
            </div>
        </div>
    )
}