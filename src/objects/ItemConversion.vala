/*
 * MIT License
 *
 * Copyright (c) 2018 Valley Framework
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

using Ciano.Enums;

namespace Ciano.Objects {

    /**
     * The {@code Conversion} class is responsible for representing 
     * each item selected for conversion.
     *
     * @see Ciano.Enums.TypeItemEnum
     * @since 0.1.0
     */
    public class ItemConversion {

        public int              id          { public get; public set; }
        public string           name        { public get; public set; }
        public string           directory   { public get; public set; }
        public string           convert_to  { public get; public set; }        
        public double           progress    { public get; public set; }
        public TypeItemEnum     type_item   { public get; public set; }

        /**
         * Constructs a new {@code ItemConversion} object.
         *
         * @see Ciano.Enums.TypeItemEnum
         */
        public ItemConversion (
            int id, 
            string name, 
            string directory, 
            string? convert_to,
            double? progress, 
            TypeItemEnum type_item
        ) {            
            this.id = id;
            this.name = name;
            this.directory = directory;
            this.type_item = type_item;
            
            if (convert_to != null) {
                this.convert_to = convert_to;
            }

            if (progress != null) {
                this.progress = progress;    
            }
        }
    }
}