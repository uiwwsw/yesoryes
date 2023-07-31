import { useState } from 'react';

const useClassname = () => {
  const [classname, setClassname] = useState<Array<string>>([]);

  const addClassname = (name: string) => {
    setClassname([...classname, name])
  };
  const removeClassname = (name: string) => {
    setClassname(classname.filter(x => x !== name))
  };
  const toggleClassname = (name: string) => {
    if(classname.includes(name)) removeClassname(name)
    else addClassname(name)
  };
  return {
    addClassname,
    removeClassname,
    toggleClassname,
    classname
  };
};
export default useClassname;
