import {  AnimationEventHandler, HTMLAttributes, ReactElement, cloneElement, useState } from "react"
import Times from "@/Times";
import { createPortal } from "react-dom";

export interface DialogProps extends HTMLAttributes<HTMLElement> {
  button?: ReactElement
  isOpen?: boolean
}
const Dialog = ({children, button, isOpen = false, ...props}: DialogProps) => {
  const [open, setOpen] = useState(isOpen)
  const [hideAnimation, setHideAnimation] = useState(false)
  const handleOpen = () => setOpen(true)
  const handleClose = () => setHideAnimation(true)
  const hideDialog:AnimationEventHandler<HTMLDivElement> = (e) => {
    if (e.nativeEvent.animationName === 'dialog-close') {
      e.stopPropagation()
      setOpen(false);
      setHideAnimation(false)}
    }

  return <>
  {button && cloneElement(button, {onClick: handleOpen})}
  {open && createPortal(
    <>
      <i className={`fixed bg-white w-full h-full left-0 top-0 bg-opacity-50 cursor-progress${hideAnimation ? ' pointer-events-none' : ''}`}/>
      <div className={`fixed w-full h-full left-0 top-0 p-7 flex items-center overflow-auto${hideAnimation ? ' pointer-events-none' : ''}`} {...props}>
        <div className="relative animate-dialog-open m-auto">
          <div className={hideAnimation ? 'animate-dialog-close' : ''} onAnimationEnd={hideDialog}>
            <div className="rounded border-2 bg-white p-6">
            {children}
            <button type="button" onClick={handleClose} className="absolute right-0 top-0 p-2"><Times/></button>
            </div>
          </div>
        </div>
      </div>
    </>
  , document.body)}
  </>
}

export default Dialog
