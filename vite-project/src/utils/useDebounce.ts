import { useRef } from 'react';

const useDebounce = <T>(callback: (arg:T) => void, term: number) => {
  const timer = useRef<ReturnType<typeof setTimeout>>(); //clearTimout 사용을 위해 timer이라는 변수를 생성

  const dispatchDebounce = (arg:T) => {
    if (timer.current) clearTimeout(timer.current);

    const newTimer = setTimeout(() => {
      callback(arg);
    }, term);
    timer.current = newTimer;
  };
  return dispatchDebounce;
};
export default useDebounce;
