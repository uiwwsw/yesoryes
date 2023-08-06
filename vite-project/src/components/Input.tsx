import {  ChangeEventHandler, FocusEventHandler, InputHTMLAttributes, forwardRef, useEffect, useImperativeHandle, useRef } from "react"
import useClassname from "#/useClassname";
import Times from "@/Times";
import { ChangeEvent } from "react";
import useDebounce from "#/useDebounce";

export interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  changed: (value: string) => unknown
  errorMessage?: string
  debounce?: number
}
const Input = forwardRef<HTMLInputElement, InputProps>(({value = '',type = "text",errorMessage,debounce = 500,changed, ...props}: InputProps, ref) => {
    const innerRef = useRef<HTMLInputElement>(null);
    const {addClassname, removeClassname, elementRef} = useClassname<HTMLDivElement>();
    useImperativeHandle(ref, () => innerRef.current!);
    const setValue = (value: unknown) => (innerRef.current) && (innerRef.current.value = String(value))
    useEffect(() => {
      setValue(value)
    }, [value])

    const handleFocus:FocusEventHandler<HTMLInputElement> = (e) => {
      addClassname('outline-2')
      props.onFocus && props.onFocus(e)
    }
    const handleBlur:FocusEventHandler<HTMLInputElement> = (e) => {
      removeClassname('outline-2')
      props.onBlur && props.onBlur(e)
    }
    const debouncedChange = useDebounce(changed, debounce);
    const handleChange:ChangeEventHandler<HTMLInputElement> = (e) => {
      props.onChange && props.onChange(e)
      debouncedChange(e.target.value)
    }

    const handleClickAtClearBtn = () => {
      setValue('')
      debouncedChange('')
    }
  return (
    <>
      <div className={`flex items-center bd-black rounded bg-transparent w-full outline outline-1`} ref={elementRef}>
        <input {...props} onChange={handleChange} onFocus={handleFocus} onBlur={handleBlur} className="border-0 p-3 bg-transparent w-full outline-0 peer" ref={innerRef} />
        <button className="p-3 relative peer-invalid:hidden" onClick={handleClickAtClearBtn}><Times/></button>
      </div>
      <div className="text-bubble-gum empty:hidden">
        {errorMessage}
      </div>
    </>
  )
})

export default Input
