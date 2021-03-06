//
//  Symbols.h
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

#ifndef Symbols_h
#define Symbols_h

#import <sys/types.h>

#define ForceLink(package, ...) \
@interface ForceLink##package : NSObject { \
    void **_symbols; \
} \
@end \
\
@implementation ForceLink##package { \
    ; \
} \
- (void)foo { \
    static void *symbols[] = { __VA_ARGS__ }; \
    _symbols = symbols; \
} \
@end

void *getSymbol(const char*);

void Py_Initialize();

wchar_t* Py_DecodeLocale(const char* arg, size_t *size);

void Py_SetPythonHome(const wchar_t *home);

#endif /* Symbols_h */
