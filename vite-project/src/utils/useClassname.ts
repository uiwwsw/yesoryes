// import { useState } from 'react';

// const useClassname = () => {
//   const [classname, setClassname] = useState<Array<string>>([]);

//   const addClassname = (name: string) => {
//     setClassname([...classname, name])
//   };
//   const removeClassname = (name: string) => {
//     setClassname(classname.filter(x => x !== name))
//   };
//   const toggleClassname = (name: string) => {
//     if(classname.includes(name)) removeClassname(name)
//     else addClassname(name)
//   };
//   return {
//     addClassname,
//     removeClassname,
//     toggleClassname,
//     classname: classname.join(' ')
//   };
// };
// export default useClassname;

import { useRef } from 'react';

const useClassname = <T extends HTMLElement>() => {
  const elementRef = useRef<T>(null)

  const addClassname = (name: string) => {
    elementRef.current?.classList.add(name)
  };
  const removeClassname = (name: string) => {
    elementRef.current?.classList.remove(name)
  };
  const toggleClassname = (name: string) => {
    if(elementRef.current?.classList.contains(name)) removeClassname(name)
    else addClassname(name)
  };
  return {
    addClassname,
    removeClassname,
    toggleClassname,
    elementRef: elementRef
  };
};
export default useClassname;
