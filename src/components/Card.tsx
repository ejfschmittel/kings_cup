import React from "react";
import "../styles/components/Card.scss";

const CARDS = {
    ACE: "Ace (A)",
    KING: "King (K)",
    QUEEN: "Queen (Q)",
    JACK: "Jack (J)",
    TEN: "Ten (10)",
    NINE: "Nine (9)",
    EIGHT: "Eight (8)",
    SEVEN: "Seven (7)",
    SIX: "Six (6)",
    FIVE: "Five (5)",
    FOUR: "Four (4)",
    THREE: "Three (3)",
    TWO: "Two (2)",
};

type CardType =  typeof CARDS[keyof typeof CARDS];

interface Props {
    title: string;
    description: string;
    cardValue: CardType;
    showLogo?: boolean;

}

export const Card: React.FC<Props> = ({title, description, cardValue, showLogo}) => {
    return (
        <div className={"card"}>
            <div className={"card__front"}>
                <div className={"card__logo_top"}></div>
                <div className={"card__inner"}>
                    <h3>{title}</h3>
                    <p>{description}</p>
                </div>
                <div className={"card__logo_bot"}></div>
            </div>
        </div>
    )
}