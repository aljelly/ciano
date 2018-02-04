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

namespace Ciano.Utils {

    /**
     * The {@code WidgetUtil} class is responsible for customizing widget actions.
     *
     * @since 0.1.0
     */
    public class WidgetUtil {

        /**
         * Change component visibility status.
         *
         * Exemple:
         * > WidgetUtil.set_visible(widget, true)
         * 
         * @param   {@code widget} widget - component
         * @param   {@code bool} visible - if true the component is displayed if false is not displayed
         * @return  {@code void} 
         */
        public static void set_visible (Gtk.Widget widget, bool visible) {
            widget.no_show_all = !visible;
            widget.visible = visible;
        }
    }
}