//: [Previous](@previous)

import Foundation
/*1. Создайте перечисление для ошибок. Добавьте в него 3 кейса:
 
 ошибка 400,
 ошибка 404,
 ошибка 500.
 Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500). И при помощи do-catch сделайте обработку ошибок перечисления. Для каждой ошибки должно быть выведено сообщение в консоль.*/
enum SomeErrors: Error {
    case error400 // ошибка 400 Bad Request (неправильный, некорректный запрос)
    case error404 // ошибка 404 Not found (не найдено)
    case error500 // ошибка 500 Internal Server Error (внутренняя ошибка сервера)
}

var error400: Bool = true
var error404: Bool = false
var error500: Bool = false

do {
    if error400 {
        throw SomeErrors.error400
    }
    if error404 {
        throw SomeErrors.error404
    }
    if error500 {
        throw SomeErrors.error500
    }
} catch SomeErrors.error400 {
    print("ошибка 400 - Bad Request (неправильный, некорректный запрос)")
} catch SomeErrors.error404 {
    print("ошибка 404 - Not found (не найдено)")
} catch SomeErrors.error500 {
    print("ошибка 500 - Internal Server Error (внутренняя ошибка сервера)")
}

//2. Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!

func errorFunc () throws{
    if error400 {
        throw SomeErrors.error400
    }
    if error404 {
        throw SomeErrors.error404
    }
    if error500 {
        throw SomeErrors.error500
    }
}
do {
    try errorFunc()
} catch SomeErrors.error400 {
    print("ошибка 400 - Bad Request (неправильный, некорректный запрос)")
} catch SomeErrors.error404 {
    print("ошибка 404 - Not found (не найдено)")
} catch SomeErrors.error500 {
    print("ошибка 500 - Internal Server Error (внутренняя ошибка сервера)")
}

//3. Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае — “No”.

func someFunc<T,E> (a: T, b: E) {
    if T.self == E.self {
        print("Yes")
    }else{
        print("No")
    }
}
someFunc(a: "String", b: 5)

//4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.
enum SomeEnum2: Error {
    case firstError // Одинаковые типы
    case secondErrors // Разные типы
}
func someErrorFunc<T,E> (a: T, b: E) throws{
    if T.self == E.self {throw SomeEnum2.firstError}
    if T.self != E.self {throw SomeEnum2.secondErrors}
}
do {
    try someErrorFunc(a: "String", b: 234)
} catch SomeEnum2.firstError {
    print("Yes")
} catch SomeEnum2.secondErrors {
    print("No")
}
//5. Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==.
func someFunc2<T:Equatable> (a: T, b: T) {
    if a == b {
        print("Yes")
    }else{
        print("No")
    }
}
someFunc(a: 5, b: "String")
