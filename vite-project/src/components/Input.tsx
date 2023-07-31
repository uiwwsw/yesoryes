import {  InputHTMLAttributes, forwardRef, useEffect, useImperativeHandle, useRef } from "react"
import useClassname from "#/useClassname";
import Times from "@/Times";

export interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  errorMessage?: string
}
const Input = forwardRef<HTMLInputElement, InputProps>(({value = '',type = "text",errorMessage, ...props}: InputProps, ref) => {
    const innerRef = useRef<HTMLInputElement>(null);
    const {addClassname, removeClassname, elementRef} = useClassname<HTMLDivElement>();
    useImperativeHandle(ref, () => innerRef.current!);
    const setValue = (value: unknown) => (innerRef.current) && (innerRef.current.value = String(value))
    useEffect(() => {
      setValue(value)
    }, [value])

    const handleFocus = () => {
      addClassname('outline-2')
    }
    const handleBlur = () => {
      removeClassname('outline-2')
    }
    const handleClickAtClearBtn = () => {
      setValue('')
    }
  return (
    <>
      <div className={`flex items-center bd-black rounded bg-transparent w-full outline outline-1`} ref={elementRef}>
        <input {...props} type={type} onFocus={handleFocus} onBlur={handleBlur} className="border-0 p-3 bg-transparent w-full outline-0 peer" ref={innerRef} />
        <button className="p-3 relative peer-invalid:hidden" onClick={handleClickAtClearBtn}><Times/></button>
      </div>
      <div className="text-bubble-gum empty:hidden">
        {errorMessage}
      </div>
    </>
  )
})

export default Input
