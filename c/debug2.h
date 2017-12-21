/*************************************************************************************************
 * Copyright 2017 Joshua Dugie (joshuadugie _AT_ gmail.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this 
 * software and associated documentation files (the "Software"), to deal in the Software 
 * without restriction, including without limitation the rights to use, copy, modify, 
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
 * persons to whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or 
 * substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
 * BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *************************************************************************************************/

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#define EXP(...)    __VA_ARGS__

#ifdef _DEBUG
#   include <stdio.h>
#   include <tchar.h>
#   include <Windows.h>

#   define DBGSIZE 0x200
#   define DBGPRINT_HELPER(fmt, ...)                                    \
    {                                                                   \
        TCHAR msg[DBGSIZE];                                             \
        _sntprintf_s(msg, DBGSIZE, _TRUNCATE, fmt, __VA_ARGS__);        \
        OutputDebugString(msg);                                         \
    }

#   define DBGPRINT(fmtString, ...)                                     \
        DBGPRINT_HELPER(_T("[%d][010_keygen][%s:%s(%d)] "),             \
        _T(fmtString) _T("\n"), GetCurrentThreadId(), _T(__FILE__),     \
        _T(__FUNCTION__),  __LINE__, __VA_ARGS__)

#   define TRACE_ENTER()                                                \
        DBGPRINT_HELPER(_T("[%d][010_keygen][%s:%s(%d)] -->\n"),        \
        GetCurrentThreadId(), _T(__FILE__), _T(__FUNCTION__),           \
        __LINE__)

#   define TRACE_EXIT()                                                 \
        DBGPRINT_HELPER(_T("[%d][010_keygen][%s:%s(%d)] <--\n"),        \
        GetCurrentThreadId(), _T(__FILE__), _T(__FUNCTION__),           \
        __LINE__)

#else
#   define DBGPRINT(...)        // nothing
#   define TRACE_ENTER()        // nothing
#   define TRACE_EXIT()         // nothing
#endif // _DEBUG

#ifdef __cplusplus
}
#endif