import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/Game';

document.addEventListener('DOMContentLoaded', () => {
  const gameElement = document.getElementById('game-root');
  if (gameElement) {
    ReactDOM.render(<Game />, gameElement);
  }
});

const Game = () => {
  // ゲームのロジックをここに書くダ
  return <div>ゲームのUIをここに表示するダ</div>;
};

export default Game;