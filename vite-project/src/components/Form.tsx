import {   FormHTMLAttributes, Fragment, ReactChildren, ReactElement, ReactNode, cloneElement, createElement, useState } from "react"
import { InputProps } from "@/Input"
export interface FormStatus extends InputProps {
}
export type FormData = Record<string, FormStatus>
export interface FormProps extends FormHTMLAttributes<HTMLFormElement> {
  children: ReactElement[]
  formData: FormData
}
const Form = ({ children,formData = {}, ...props}: FormProps) => {
    const [value, setValue] = useState<FormData>(formData);
    const cc = children.map(x => {
      const pr = value[x.key ?? '']
      return {
        ...x,
        key: x.key,
        props: pr
      }
    })
    ;
  return (
    <div onChange={(e) => console.log(e)}>
      {cc}
      
    </div>
  )
}

export default Form
