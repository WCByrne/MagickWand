// PixelWand.swift
//
// Copyright (c) 2016 Sergey Minakov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

#if os(Linux)
    import CMagickWandLinux
#else
    import CMagickWandOSX
#endif


public struct Quantums {

    private var pointer: OpaquePointer

    init(_ wand: PixelWand) {
        self.init(wand.pointer)
    }

    init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }

    var rgb: (Quantum, Quantum, Quantum) {
        let red = PixelGetRedQuantum(self.pointer)
        let green = PixelGetGreenQuantum(self.pointer)
        let blue = PixelGetBlueQuantum(self.pointer)
        return (red, green, blue)
    }


    // PixelGetBlackQuantum
    // PixelGetQuantumPacket
    // PixelGetQuantumPixel
    // PixelSetAlphaQuantum
    //Quantum PixelGetYellowQuantum(const PixelWand *wand)
    //Quantum PixelGetCyanQuantum(const PixelWand *wand)
    //Quantum PixelGetIndex(const PixelWand *wand)
    //Quantum PixelGetMagentaQuantum(const PixelWand *wand)
}
extension PixelWand {

    public var quantums: Quantums {
        return Quantums(self)
    }
}