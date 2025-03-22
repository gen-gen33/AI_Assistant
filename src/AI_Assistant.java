package src;

import ij.IJ;
import ij.plugin.PlugIn;

/**
 * AI アシスタントプラグインの基本構造
 * ImageJのPlugInインターフェースを実装した最小限のプラグイン
 */
public class AI_Assistant implements PlugIn {
    
    @Override
    public void run(String arg) {
        IJ.log("AI アシスタントプラグインが起動しました");
        IJ.showMessage("AI アシスタント", "プラグインが正常に起動しました");
    }
}
