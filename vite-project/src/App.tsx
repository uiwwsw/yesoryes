import { ChangeEvent, ChangeEventHandler, useRef } from 'react'
import Input from '@/Input'
import Button from '@/Button'
import useDebounce from '#/useDebounce';
import Dialog from '@/Dialog';
import Form from '@/Form';
function App() {
  const inputRef = useRef<HTMLInputElement>(null);
  const onChange:ChangeEventHandler<HTMLInputElement> = (e) => {
    console.log(e.target.value)
    console.log(e)
  }
  const handleClick = () => {
    inputRef.current && (inputRef.current.value ='ddawkd;lawkd')
  }
  const debouncedChange = useDebounce<ChangeEvent<HTMLInputElement>>(onChange, 200);
  return (
    <>
      <Dialog button={<Button>팝업오픈</Button>}>
        테스트입니다
        <br/>
        <br/>
        <br/>
        <Dialog button={<Button>팝업오픈2</Button>}>
        테스트입니다
        <br/>
        <br/>
        <br/>
        <br/>
      </Dialog>
      </Dialog>
      <Button className="bg-white" onClick={handleClick}>버튼</Button>
      <Button className="bg-white">버튼2</Button>
      <Button className="bg-white">버튼3</Button>
      <Button className="bg-white">버튼4</Button>
      <Input errorMessage='dawdaw' value="dawdaw" required onBlur={() => {console.log('dawdawd')}} onChange={debouncedChange} />
      <Input onBlur={() => {console.log('dawdawd')}}/>
    </>
  )
}

export default App
