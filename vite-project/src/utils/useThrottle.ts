import { useRef } from 'react';

const useThrottle = <T>(callback: (arg:T) => void, term: number) => {
  const timer = useRef<ReturnType<typeof setTimeout>>(); //clearTimout 사용을 위해 timer이라는 변수를 생성
  const complete = useRef<boolean>(false);

  const dispatchThrottle = (arg:T) => {
    if (!timer.current) {
        complete.current = false;
        const newTimer = setTimeout(() => {
          complete.current = true;
        }, term);
        timer.current = newTimer;
    } else if (complete.current) {
      callback(arg);
      timer.current = undefined;
    }

    
  };
  return dispatchThrottle;
};
export default useThrottle;
