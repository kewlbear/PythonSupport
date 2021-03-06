//
//  Symbols.m
//
//  Copyright (c) 2020 Changbeom Ahn
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#if defined(__arm64__) || defined(__x86_64__)

#import "Symbols.h"
#import <Foundation/Foundation.h>
#import <Python.h>

#define SYMBOL(symbol) @#symbol: [NSValue valueWithPointer: symbol]

ForceLink(Python,
          Py_Initialize,
          PyEval_GetBuiltins,
          Py_IncRef,
          PyRun_SimpleString,
          PyUnicode_DecodeUTF8,
          Py_DecRef,
          PyBool_FromLong,
          PyObject_GetAttrString,
          PyErr_Occurred,
          PyTuple_New,
          PyObject_CallObject,
          PyLong_AsLong,
          PyDict_New,
          PyDict_SetItem,
          PyImport_ImportModule,
          PyObject_GetIter,
          PyIter_Next,
          PyObject_RichCompareBool,
          PyUnicode_AsUTF8,
          PyLong_FromLong,
          PyTuple_SetItem,
          PyObject_Call,
          PyObject_GetItem,
          PyDict_Next,
          PyErr_Fetch,
          PyErr_Clear,
          )

static NSDictionary *symbols;

void *getSymbol(const char *name) {
    if (!symbols) {
        symbols = @{
            SYMBOL(Py_Initialize),
            SYMBOL(PyEval_GetBuiltins),
            SYMBOL(Py_IncRef),
            SYMBOL(PyRun_SimpleString),
            SYMBOL(PyUnicode_DecodeUTF8),
            SYMBOL(Py_DecRef),
            SYMBOL(PyBool_FromLong),
            SYMBOL(PyObject_GetAttrString),
            SYMBOL(PyErr_Occurred),
            SYMBOL(PyTuple_New),
            SYMBOL(PyObject_CallObject),
            SYMBOL(PyLong_AsLong),
            SYMBOL(PyDict_New),
            SYMBOL(PyDict_SetItem),
            SYMBOL(PyImport_ImportModule),
            SYMBOL(PyObject_GetIter),
            SYMBOL(PyIter_Next),
            SYMBOL(PyObject_RichCompareBool),
            SYMBOL(PyUnicode_AsUTF8),
            SYMBOL(PyLong_FromLong),
            SYMBOL(PyTuple_SetItem),
            SYMBOL(PyObject_Call),
            SYMBOL(PyObject_GetItem),
            SYMBOL(PyDict_Next),
            SYMBOL(PyErr_Fetch),
            SYMBOL(PyErr_Clear),
        };
    }

    void *symbol = [(NSValue *) symbols[[NSString stringWithUTF8String:name]] pointerValue];
//    NSLog(@"%s: %s", __func__, name);
    assert(symbol);
    return symbol;
}

#endif // __arm64__ || __x86_64__
