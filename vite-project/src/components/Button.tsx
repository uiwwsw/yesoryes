import { ButtonHTMLAttributes } from "react"

export interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
}
const Button = ({children, className, ...props}: ButtonProps) => {
  return (
    <>
      <button {...props} className={`bg-purple p-3 rounded-sm${className ? ` ${className}` : ''}`}>{children}</button>
    </>
  )
}


export default Button
