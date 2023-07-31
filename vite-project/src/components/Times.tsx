import { HTMLAttributes } from "react"

export interface TimesProps extends HTMLAttributes<HTMLElement> {
}
const Times = ({...props}: TimesProps) => {
    return <span {...props} className={`rotate-45 block w-5 h-5 m-auto`}>
    <i className="absolute w-full h-0.5 bg-midnight left-0 top-0 right-0 bottom-0 m-auto"/>
    <i className="absolute w-0.5 h-full bg-midnight left-0 top-0 right-0 bottom-0 m-auto"/>
  </span>
}

export default Times