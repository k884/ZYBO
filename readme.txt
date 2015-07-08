1.PC環境
 OS : VM Ubuntu 14.04LTS 
 Xilinx Tool: Vivado 2015.1 Web Edition
 Board : Digilent ZYBO

２.ファイル
test
 |-App					// linux myLED制御アプリケーション
   |-irq_test			// inux myLED制御アプリケーション
   |-irq_test.c			// Cソース
   |-Makefile
 |-devicetree			// devicetree
   |-device_tree_bsp_0		// Xilinx SDKにて生成したdevicetree
 |-ip_repo				// Custom IPのレポジトリ　myLedが入っている。
 |-IRQ_TEST				// プロジェクトフォルダ（空）
 |-irq_test.tcl			// vivado用のtclソース
 |-SD_IMAGE				// ZYNC SDカードにいれるファイル
   |-Boot.bin			//　IRQ_TESTのBoot.bin
   |-devicetree.dtb		//　devicretree
   |-irq_test			//　アプリケーション
   |-uImage				//　Linuxkernel 4.0.0
   |-uramdisk.image.gz	//　RAMDISK
 |-src
   |-ZYBO_IRQ.xdc		//xdcファイル
   |-ZYBO_zynq_def.xml	//ZYBO　PS用のデフォルト設定
   
3.動作方法
　UART接続を行いLinuxが起動したらSDカードに移動しirq_testを実行する。
　　cd　/mnt
　　./irq_test
　irqはLD3の信号と同じなので発生しているはずなのでinterruptsを見ているがIRQ_F2PにつながるIRQが見られない。
　　cat /proc/interrupts
　

　   
 
  
