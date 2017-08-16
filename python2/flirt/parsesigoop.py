#!/bin/python
"""
Copyright 2017 Steve Lavoie

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS 
BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

References: 
  IDA SDK:                https://www.hex-rays.com/products/ida/support/sdkdoc/
  Forum post:             http://www.woodmann.com/forum/showthread.php?7517-IDA-signature-file-format&p=87450&viewfull=1#post87450
  Universal Decompiler:   https://github.com/JohnDMcMaster/uvudec
  lscan:                  https://github.com/maroueneboubakri/lscan
  lscan fork :            https://github.com/invano/lscan

License/Credit Notes:
  IDA Pro's FLAIR utilities' documentation and the IDA SDK are the
  primary, originating sources for the SIG file format. The forum post
  linked above, by user rheax, attaches a SIGv7 parser, written in C++.
  That parser was released under the WTFPL (http://www.wtfpl.net/),
  (effectively Public Domain aside from not re-using the name).

  The relevant portions of Universal Decompiler appear heavily based on
  the WTFPL code. The next project, lparse, has no license specified but
  the parsing algorithm is the same as the WTFPL. This was a handy
  reference since my Python-fu is poor. Similarly, the fork of lpase has
  helped identify the compression used (Gzip's Deflate) and how to support
  later versions of SIG files.
  
  This implementation is released under the BSD 3-clause license.
"""
import os
import io
import struct
import zlib
import cStringIO
import logging

__author__      = 'Steve Lavoie'
__copyright__   = 'Copyright (c) 2017'
__license__     = 'BSD 3-clause'
__credits__     = [ 'Steve Lavoie', 'John McMaster', 'Marouene Boubakri', 'Emanuele (Github: invano)', 'rheax (woodman.com forums user)' ]

#l = logging.getLogger('parsesig')
#l.setLevel(logging.DEBUG)

SIGFILE_HEADER_ARCH = {
    0: 'Intel 80x86',
    1: '8085, Z80',
    2: 'Intel 860',
    3: '8051',
    4: 'Texas Instruments TMS320C5x',
    5: '6502',
    6: 'PDP11',
    7: 'Motorola 680x0',
    8: 'Java',
    9: 'Motorola 68xx',
    10: 'SGS-Thomson ST7',
    11: 'Motorola 68HC12',
    12: 'MIPS',
    13: 'Advanced RISC Machines',
    14: 'Texas Instruments TMS320C6x',
    15: 'PowerPC',
    16: 'Intel 80196',
    17: 'Z8',
    18: 'Renesas (formerly Hitachi) SuperH',
    19: 'Microsoft Visual Studio.Net',
    20: 'Atmel 8-bit RISC processor(s)',
    21: 'Hitachi H8/300, H8/2000',
    22: "Microchip's PIC",
    23: 'SPARC',
    24: 'DEC Alpha',
    25: 'Hewlett-Packard PA-RISC',
    26: 'Hitachi H8/500',
    27: 'Tasking Tricore',
    28: 'Motorola DSP5600x',
    29: 'Siemens C166 family',
    30: 'SGS-Thomson ST20',
    31: 'Intel Itanium IA64',
    32: 'Intel 960',
    33: 'Fujistu F2MC-16',
    34: 'Texas Instruments TMS320C54xx',
    35: 'Texas Instruments TMS320C55xx',
    36: 'Trimedia',
    37: 'Mitsubishi 32bit RISC',
    38: 'NEC 78K0',
    39: 'NEC 78K0S',
    40: 'Mitsubishi 8bit',
    41: 'Mitsubishi 16bit',
    42: 'ST9+',
    43: 'Fujitsu FR Family',
    44: 'Motorola 68HC16',
    45: 'Mitsubishi 7900',
    46: 'Texas Instruments TMS320C3',
    47: 'Angstrem KR1878',
    48: 'Analog Devices ADSP 218X',
    49: 'Atmel OAK DSP',
    50: 'Toshiba TLCS-900',
    51: 'Rockwell C39',
    52: 'NSC CR16',
    53: 'Panasonic MN10200',
    54: 'Texas Instruments TMS320C1x',
    55: 'NEC V850 and V850ES/E1/E2',
    56: 'Processor module adapter for processor modules written in scripting languages',
    57: 'EFI Bytecode',
    58: 'Texas Instruments MSP430',
    59: 'Cell Broadband Engine Synergistic Processor Unit',
    60: 'Android Dalvik Virtual Machine',
    61: '65802/65816',
    62: 'Renesas M16C',
    63: 'Argonaut RISC Core',
    64: 'SunPlus unSP',
    65: 'Texas Instruments TMS320C28x',
    66: 'Motorola DSP96000',
    67: 'Sony SPC700',
}
SIGFILE_HEADER_FILETYPE_FLAGS = {
    0x00000004L: 'Binary File',
    0x00000008L: 'MS DOS Driver',
    0x00000010L: 'New Executable (NE)',
    0x00000020L: 'Intel Hex Object File',
    0x00000040L: 'MOS Technology Hex Object File',
    0x00000080L: 'LiExecutable (LX)',
    0x00000100L: 'LiExecutable (LE)',
    0x00000200L: 'Netware Loadable Module (NLM)',
    0x00000400L: 'Common Object File Format (COFF)',
    0x00000800L: 'Portable Executable (PE)',
    0x00001000L: 'Object Module Format (OMF)',
    0x00002000L: 'S-record format',
    0x00004000L: 'ZIP archive',
    0x00008000L: 'OMF library',
    0x00010000L: 'ar library',
    0x00020000L: 'User-written loader',
    0x00040000L: 'Executable and Linkable Format (ELF)',
    0x00080000L: 'Watcom DOS32 Extender (W32RUN)',
    0x00100000L: 'Linux a.out (AOUT)',
    0x00200000L: 'PalmPilot program file',
    0x00400000L: 'MS DOS EXE File',
    0x00800000L: 'MS DOS COM File',
    0x01000000L: 'AIX ar library',
}
SIGFILE_HEADER_OSTYPE_FLAGS = {
    0x0001: 'MS DOS',
    0x0002: 'MS Windows',
    0x0004: 'OS/2',
    0x0008: 'Netware',
    0x0010: 'Unix',
    0x0020: 'Other',
}
SIGFILE_HEADER_APPTYPE_FLAGS = {
    0x0001: 'console',
    0x0002: 'graphics',
    0x0004: 'program (EXE)',
    0x0008: 'library (DLL)',
    0x0010: 'driver  (VxD)',
    0x0020: 'Single-threaded',
    0x0040: 'Multi-threaded',
    0x0080: '16bit',
    0x0100: '32bit',
    0x0200: '64bit',
}
SIGFILE_HEADER_FEATURE_FLAGS = {
    0x01: 'Startup',
    0x02: 'ctype CRC',
    0x04: '2-byte cytpe',
    0x08: 'Alt ctype CRC',
    0x10: 'Compressed'
}
SIGFILE_PARSE_FLAGS = {
    'MORE_NAMES': 0x1,
    'TAIL_BYTES': 0x2,
    'REF_FUNCS':  0x4,
    'MORE_MODS_CRC': 0x8,
    'MORE_MODS': 0x10
}
SIGFILE_FUNC_FLAGS = {
    'D':        0x1,
    'LOCAL':    0x2,
    '?':        0x4,
    'UNRESOLVED_COLLISION': 0x8
}
MAX_FLIRT_FUNC_NAME = 1024

class SIGFILE_HEADER(object):
    """
    Represents the SIG file's header:
        struct UVD_IDA_sig_header_t
        {
            char        magic[6];
            uint8_t     version;
            uint8_t     arch;
            uint32_t    file_types;
            uint16_t    OS_types;
            uint16_t    app_types;
            uint16_t    feature_flags;
            uint16_t    old_number_modules;
            uint16_t    crc16;
            char        ctype[12];
            uint8_t     library_name_sz;
            uint16_t    alt_ctype_crc;
            uint32_t    n_modules;
            /* ver 8+ */
            uint_16t    pat_size;
            /* ver 10+ */
            uint_16t    ctype_unk
        }  __attribute__((__packed__));

        char[lib_name_sz] lib_name;
    """
    def __init__(self, buf):
        self.magic = None
        self.version = None
        self.arch = None
        self.file_types_flags = None
        self.file_types = {}
        self.OS_types_flags = None
        self.OS_types = {}
        self.app_types_flags = None
        self.app_types = {}
        self.feature_flags = None
        self.features = {}
        self.old_number_modules = None
        self.crc16 = None
        self.ctype = None
        self. lib_name_len = None
        self.alt_ctype_crc16 = None
        self.n_modules = None
        self.pat_size = None
        self.ctype_unk = None       # Maybe the -C switch, signifying ctype is a ptr?

        if buf is not None:
            self.parse(buf)
            
    def parse(self, buf):
        self.magic = buf.read(6)
        if self.magic != 'IDASGN':
            print 'Invalid file format'
            return False

        try:
            self.version              = struct.unpack('<b', buf.read(1))[0]
            self.archinfo             = SIGFILE_HEADER_ARCH[struct.unpack('<b', buf.read(1))[0]]
            self.file_types_flags     = struct.unpack('<I', buf.read(4))[0]
            self.os_types_flags       = struct.unpack('<H', buf.read(2))[0]
            self.app_types_flags      = struct.unpack('<H', buf.read(2))[0]
            self.feature_flags        = struct.unpack('<H', buf.read(2))[0]
            self.old_number_modules   = struct.unpack('<H', buf.read(2))[0]
            self.crc16                = struct.unpack('<H', buf.read(2))[0]
            self.ctype                = buf.read(12)
            self.lib_name_len         = struct.unpack('<b', buf.read(1))[0]
            self.alt_ctype_crc16      = struct.unpack('<H', buf.read(2))[0]

            self.file_types           = {v for k,v in SIGFILE_HEADER_FILETYPE_FLAGS.items() if k & self.file_types_flags}
            self.OS_types           = {v for k,v in SIGFILE_HEADER_OSTYPE_FLAGS.items() if k & self.os_types_flags}
            self.app_types           = {v for k,v in SIGFILE_HEADER_APPTYPE_FLAGS.items() if k & self.app_types_flags}
            self.features           = {v for k,v in SIGFILE_HEADER_FEATURE_FLAGS.items() if k & self.feature_flags}
            
            if self.version >= 6:
                self.n_modules        = struct.unpack('<I', buf.read(4))[0]
            if self.version >= 8:
                self.pat_size         = struct.unpack('<H', buf.read(2))[0]
            if self.version >= 10:
                self.ctype_unk        = struct.unpack('<H', buf.read(2))[0]
        except (KeyboardInterrupt, SystemExit):
            raise
        except Exception as (errno, strerror):
            print 'Failed to parse SIG file header. Error %d: %s' % (errno, strerror)
            return False

    
class FlirtFunction:
    name = ""
    offset = 0
    neg_offset = 0
    is_loc = False
    is_col = False

class FlirtTailByte:
    offset = 0
    value = 0

#class FlirtFlag:
#    flags = 0

class BinarySegment:
    offset = 0
    size = 0
    addr = 0

class BinaryFunction:
    name = ""
    offset = 0
    size = 0
    buf = ""

class FLIRTModule:
    def __init__(self, sigfile, ver, crclen, crc16):
        self.crclen = crclen
        self.crc16 = crc16
        self.len = 0
        self.pub_fcns = []
        self.ref_fcns = []
        self.tail_bytes = []

        self.sigfile = sigfile
        self.ver = ver

        if self.ver >= 9:
            self.len = self.sigfile.next_multibytes()
        else:
            self.len = self.sigfile.next_bitshift()

        self.parse_funcs()
        
    def parse_funcs(self):
        self.pub_fcns = []
        off = 0
        flags = 0
        while True:
            func = FlirtFunction()
            if self.ver >= 9:
                off += self.sigfile.next_multibytes()
            else:
                off += self.sigfile.next_bitshift()

            func.offset = off
            byte = self.sigfile.next_byte()

            if byte < 0x20:     # it's a flag
                if byte & SIGFILE_FUNC_FLAGS['LOCAL']:
                    func.is_loc = True
                if byte & SIGFILE_FUNC_FLAGS['UNRESOLVED_COLLISION']:
                    func.is_col = True
                if byte & SIGFILE_FUNC_FLAGS['D'] or byte & SIGFILE_FUNC_FLAGS['?']:
                    print 'Unknown function flag: %x' % byte

                byte = self.sigfile.next_byte()

            for i in range(MAX_FLIRT_FUNC_NAME):
                if byte < 0x20:
                    break
                func.name += chr(byte)
                byte = self.sigfile.next_byte()

            if i == MAX_FLIRT_FUNC_NAME:
                print 'Function name too long! Read bytes: %s' % func.name
                break

            self.flags = byte
            self.pub_fcns.append(func)
            #self.FunctionCount += 1
            if flags & SIGFILE_PARSE_FLAGS['MORE_NAMES'] == 0:
                break

    def parse_tail(self):
        byte_cnt = 1
        if self.ver >= 8:
            byte_cnt = self.sigfile.next_multibytes()

        for i in range(byte_cnt):
            tb = FlirtTailByte()
            if self.ver >= 9:
                tb.offset = self.sigfile.next_multibytes()
            else:
                tb.offset = self.sigfile.next_bitshift()

            tb.value = self.next_byte()
            self.tail_bytes.append(tb)

    def parse_ref_funcs(self):
        self.ref_fcns = []

        func_cnt = 1
        if self.ver >= 8:
            func_cnt = self.sigfile.next_byte()

        for i in range(func_cnt):
            f = FlirtFunction()

            if self.ver >=9:
                f.offset = self.sigfile.next_multibytes()
            else:
                f.offset = self.sigfile.next_bitshift()

            f.fcn_name_len = self.sigfile.next_byte()
            if f.fcn_name_len == 0:
                f.fcn_name_len = self.sigfile.next_multibytes()

            for i in range(f.fcn_name_len):
                f.name += chr(self.sigfile.next_byte())

            if f.name[f.fcn_name_len-1] == 0:
                f.neg_offset = True

            self.ref_fcns.append(f)

class FLIRTNode:
    def __init__(self, sigfile, ver, rootNode=None):
        self.sigfile = sigfile
        self.len = self.sigfile.next_byte()
        self.var_mask = 0
        self.pat_bytes = None
        self.var_bool_arr = None
        self.children = []
        self.modules = []
        self.parent = rootNode
        
        self.ver = ver

        self.parse_tree()
        self.parse_leaf()
        
    def parse_tree(self):
        flirt_tree_cnt = self.sigfile.next_multibytes()
        print 'Got %d FLIRT trees' % flirt_tree_cnt
        
        if flirt_tree_cnt == 0:
            self.parse_leaf()
            
        self.children = []
        
        for i in range(flirt_tree_cnt):
            node = FLIRTNode(self.sigfile, self.ver)
            self.parse_var_mask()
            self.parse_bytes()
            node.parent = self
            self.children.append(node)
            return node.parse_tree()

    def parse_leaf(self):
        self.modules = []
        flags = 0x0
        
        while True:
            crclen = self.sigfile.next_byte()
            crc16   = self.sigfile.next_short()
            while True:
                mod = FLIRTModule(self.sigfile, self.ver, crclen, crc16)

                flags = mod.flags
                
                if flags & SIGFILE_PARSE_FLAGS['TAIL_BYTES']:
                    self.parse_tail()
                if flags & SIGFILE_PARSE_FLAGS['REF_FUNCS']:
                    mod.parse_ref_funcs()

                self.modules.append(mod)
                
                if flags & SIGFILE_PARSE_FLAGS['MORE_MODS_CRC'] == 0:
                    break
                    
            if flags & SIGFILE_PARSE_FLAGS['MORE_MODS'] == 0:
                break
        
        return True

    def parse_var_mask(self):
        if self.len < 0x10:
            self.var_mask = self.sigfile.next_bitshift()
        elif self.len <= 0x20:
            self.var_mask = self.sigfile.next_multibytes()
        elif self.len <= 0x40:
            self.var_mask = (self.sigfile.next_multibytes << 32) + self.sigfile.next_multibytes()
        
    def parse_bytes(self):
        cur_mask = 1 << (self.len - 1)
        self.var_bool_arr = []
        self.pat_bytes = []
        for i in range(self.len):
            val = True if self.var_mask & cur_mask else False
            self.node.var_bool_arr.append(val)
            if self.var_mask & cur_mask:
                self.pat_bytes.append(0x00)
            else:
                self.pat_bytes.append(self.sigfile.next_byte())

            cur_mask >>= 1
            

class SIGFILE:
    def __init__(self, path):
        self._path   = path
        self._buf    = None
        self.Header  = None
        self.LibName = None
        self.FunctionCount = 0
        self.RootNode = None
        
        if not self.parse():
            print 'Failed to parse SIG file'
            return

    def parse(self):
        with open(self._path, 'rb') as sigfile:
            self._buf = io.BytesIO(sigfile.read())

            self._buf.seek(0)
            self.Header = SIGFILE_HEADER(self._buf)
            if not self.Header:
                return False
            
            self.LibName = self._buf.read(self.Header.lib_name_len)
            self._buf = self._buf.read(sigfile.tell() - self._buf.tell())
            
            if self.Header.feature_flags & 0x10: # compressed
                zd = zlib.decompressobj()
                self._buf = zd.decompress(buf)
                
            self._buf = cStringIO.StringIO(self._buf)
            self._buf.seek(0)

            self.RootNode = FLIRTNode(self, self.Header.version)
            
            if self.RootNode is not None:
                return True
            else:
                return False
            
    def next_byte(self):
        return struct.unpack('<b', self._buf.read(1))[0]
    def next_short(self, bitshift=False):
        if not bitshift:
            return struct.unpack('<H', self._buf.read(2))[0]
    def next_int16(self):
        return struct.unpack('<I', self._buf.read(4))[0]
    def next_bitshift(self):
        byte = self.next_byte()
        if byte & 0x80:
            byte = ((byte & 0x7f) << 8) + self.next_byte()
        return byte
    def next_multibytes (self):
        """Reads up to 5 bytes depending on the value identified."""
        byte = self.next_byte()

        if (byte & 0x80) != 0x80:
            return byte
        elif (byte & 0xc0) != 0xc0:
            return ((byte & 0x7f) << 8) + self.next_byte()
        elif (byte & 0xe0) != 0xe0:
            byte = ((byte & 0x3f) << 24) + self.next_byte()
            byte += self.next_short()
            return byte
        else:
            return self.next_int16()


