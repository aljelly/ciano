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

namespace Valley.Utils {

    /**
     * The {@code ArrayUtil} class is responsible for managing arrays.
     *
     * @since 0.1.5
     */
    public class ArrayUtil {

        /**
         * Join generic string arrays.
         *
         * Exemple:
         * > ArrayUtil.join_generic_string_arrays(new GenericArray<string>, new GenericArray<string>)
         * 
         * @param   {@code GenericArray<string>} array1
         * @param   {@code GenericArray<string>} array2
         * @return  {@code GenericArray} 
         */
        public static GenericArray join_generic_string_arrays (GenericArray<string> array1, GenericArray<string> array2) {
            var new_array = new GenericArray<string> ();

           array1.foreach ((str) => {
                new_array.add (str);
            });

            array2.foreach ((str) => {
                new_array.add (str);
            });

            return new_array;
        }
    }
}